package org.dscnitrourkela.elaichi.repository

import android.content.Context
import androidx.paging.ExperimentalPagingApi
import androidx.paging.Pager
import androidx.paging.PagingConfig
import androidx.paging.PagingSource
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.calls.BasicAuthInterceptor
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.api.database.MailDao
import org.dscnitrourkela.elaichi.api.database.ParsedMailDao
import org.dscnitrourkela.elaichi.others.Resource
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

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

    @ExperimentalPagingApi
    fun getParsedMails(conversationId: Int) =
        getPager(ParsedMailPagingSource(context, conversationId, mailApi, mailDao, parsedMailDao))

    @ExperimentalPagingApi
    fun getMails(request: String) =
        getPager(MailPagingSource(getBox(request), context, request, mailApi, mailDao))

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