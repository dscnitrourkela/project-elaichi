package org.dscnitrourkela.elaichi.repository

import android.annotation.SuppressLint
import android.content.Context
import androidx.paging.ExperimentalPagingApi
import androidx.paging.Pager
import androidx.paging.PagingConfig
import androidx.paging.PagingSource
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.calls.BasicAuthInterceptor
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.api.data.ParsedMail
import org.dscnitrourkela.elaichi.api.database.MailDao
import org.dscnitrourkela.elaichi.api.database.ParsedMailDao
import org.dscnitrourkela.elaichi.others.ApiConstants
import org.dscnitrourkela.elaichi.others.Resource
import org.dscnitrourkela.elaichi.others.debugLog
import org.dscnitrourkela.elaichi.utils.isInternetConnected
import org.jsoup.Jsoup
import java.text.SimpleDateFormat
import java.util.*

class MailRepository(
    private val basicAuthInterceptor: BasicAuthInterceptor,
    private val context: Context,
    private val mailApi: MailApi,
    private val mailDao: MailDao,
    private val parsedMailDao: ParsedMailDao,
    private val pagerConfig: PagingConfig,
) {

    @ExperimentalPagingApi
    fun getSearchMails(request: String) =
        getPager(SearchMailPagingSource(context, request, mailApi, mailDao))

    suspend fun getParsedMails(conversationId: Int): List<ParsedMail> {
        if (isInternetConnected(context)) {
            insertParsedMails(conversationId)
        }
        return parsedMailDao.getConversationMails(conversationId).first()
    }

    @SuppressLint("SimpleDateFormat")
    private suspend fun insertParsedMails(conversationId: Int): Flow<List<ParsedMail>> {
        if (isInternetConnected(context)) {
            mailDao.getMailsId(conversationId).first().forEach { id ->
                val response = Jsoup.parse(mailApi.getParsedMail(id).string())
                val parsedMail = ParsedMail(id, conversationId, response)
                parsedMailDao.insertMail(parsedMail)
            }
        }
        return parsedMailDao.getConversationMails(conversationId)
    }

    suspend fun getMails(request: String, month: Int): List<Mail> {
        if (isInternetConnected(context)) {
            val mails =
                mailApi.getMails(request, ApiConstants.MONTH_QUERY + getMonth(month)).body()?.mails
            mails?.let {
                mailDao.insertMails(it)
                debugLog(it)
            }
        }
        return mailDao.getMails(getBox(request)).first()
    }


    @SuppressLint("SimpleDateFormat")
    private fun getMonth(page: Int) =
        SimpleDateFormat(context.getString(R.string.zimbra_month_format)).format(getCalender(page).time)

    private fun getCalender(page: Int) = Calendar.getInstance().apply {
        add(Calendar.MONTH, -page)
        val firstDay = getActualMinimum(Calendar.DAY_OF_MONTH)
        set(Calendar.DAY_OF_MONTH, firstDay)
    }

    suspend fun login(): Resource<List<Mail>> = try {
        val response = mailApi.login()
        if (response.isSuccessful && response.code() == 200) {
            Resource.success(response.body()?.mails)
        } else {
            Resource.error(response.message(), null)
        }
    } catch (e: Exception) {
        Resource.error(
            e.message ?: "Couldn't connect to the servers. Check your internet connection", null
        )
    }

    fun setCredential(credential: String) {
        basicAuthInterceptor.credential = credential
    }

    fun getCredential() = basicAuthInterceptor.credential

    fun setToken(token: String) {
        basicAuthInterceptor.token = token
    }

    fun getToken() = basicAuthInterceptor.token

    fun resetLogin() = CoroutineScope(Dispatchers.IO).launch {
        mailDao.deleteAllMails()
        parsedMailDao.deleteAllMails()
        basicAuthInterceptor.credential = ""
        basicAuthInterceptor.token = ""
    }

    private fun <T : Any> getPager(pagingSource: PagingSource<Int, T>) =
        Pager(pagerConfig, 0, { pagingSource }).flow

    fun getBox(request: String) = when (request) {
        context.getString(R.string.inbox) -> 2
        context.getString(R.string.trash) -> 3
        context.getString(R.string.junk) -> 4
        context.getString(R.string.sent) -> 5
        context.getString(R.string.draft) -> 6
        else -> 0
    }.toByte()
}