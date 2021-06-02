package org.dscnitrourkela.elaichi.repository

import android.content.Context
import androidx.paging.PagingSource
import androidx.paging.PagingState
import kotlinx.coroutines.flow.first
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.api.database.MailDao
import org.dscnitrourkela.elaichi.utils.isInternetConnected

class SearchMailPagingSource(
    private val context: Context,
    private val request: String,
    private val mailApi: MailApi,
    private val mailDao: MailDao
) : PagingSource<Int, Mail>() {
    override fun getRefreshKey(state: PagingState<Int, Mail>) = state.anchorPosition

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, Mail> {
        val page = params.key ?: 0
        return try {
            getMails(request, page)
        } catch (e: Exception) {
            LoadResult.Error(e)
        }
    }

    private suspend fun getMails(request: String, page: Int): LoadResult<Int, Mail> =
        when (isInternetConnected(context)) {
            true -> {
                val mails = mailApi.searchMails(request).body()?.mails
                mails?.let { mailDao.insertMails(it) }
                LoadResult.Page(mails ?: emptyList(), null, null)
            }
            else -> {
                val mails = mailDao.searchMails(request).first()
                LoadResult.Page(mails, null, null)
            }
        }
}