package org.dscnitrourkela.elaichi.repository

import android.annotation.SuppressLint
import android.content.Context
import androidx.paging.PagingSource
import androidx.paging.PagingState
import kotlinx.coroutines.flow.first
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.api.data.ParsedMail
import org.dscnitrourkela.elaichi.api.database.MailDao
import org.dscnitrourkela.elaichi.api.database.ParsedMailDao
import org.dscnitrourkela.elaichi.utils.isInternetConnected
import org.jsoup.Jsoup

class ParsedMailPagingSource(
    private val context: Context,
    private val conversationId: Int,
    private val mailApi: MailApi,
    private val mailDao: MailDao,
    private val parsedMailDao: ParsedMailDao
) : PagingSource<Int, ParsedMail>() {
    override fun getRefreshKey(state: PagingState<Int, ParsedMail>) = state.anchorPosition

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, ParsedMail> {
        return try {
            val result = getParsedMails(conversationId)
            LoadResult.Page(result, null, null)
        } catch (e: Exception) {
            LoadResult.Error(e)
        }
    }

    private suspend fun getParsedMails(conversationId: Int): List<ParsedMail> {
        if (isInternetConnected(context)) {
            insertParsedMails(conversationId)
        }
        return parsedMailDao.getConversationMails(conversationId).first()
    }

    @SuppressLint("SimpleDateFormat")
    private suspend fun insertParsedMails(conversationId: Int) =
        mailDao.getMailsId(conversationId).first().forEach { id ->
            val response = Jsoup.parse(mailApi.getParsedMail(id).string())
            val parsedMail = ParsedMail(id, conversationId, response)
            parsedMailDao.insertMail(parsedMail)
        }
}