package org.dscnitrourkela.elaichi.repository

import android.annotation.SuppressLint
import android.content.Context
import androidx.paging.PagingSource
import androidx.paging.PagingState
import kotlinx.coroutines.flow.first
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.api.database.MailDao
import org.dscnitrourkela.elaichi.others.ApiConstants
import org.dscnitrourkela.elaichi.utils.isInternetConnected
import java.text.SimpleDateFormat
import java.util.*

class MailPagingSource(
    private val box: Byte,
    private val context: Context,
    private val request: String,
    private val mailApi: MailApi,
    private val mailDao: MailDao
) : PagingSource<Int, Mail>() {
    override fun getRefreshKey(state: PagingState<Int, Mail>) = 0

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, Mail> {
        val page = params.key ?: 0
        return try {
            getMails(box, request, page)
        } catch (e: Exception) {
            LoadResult.Error(e)
        }
    }

    private suspend fun getMails(box: Byte, request: String, page: Int): LoadResult<Int, Mail> =
        when (isInternetConnected(context)) {
            true -> {
                val month = getMonth(page)
                val mails =
                    mailApi.getMails(request, ApiConstants.MONTH_QUERY + month).body()?.mails
                mails?.let { mailDao.insertMails(it) }
                LoadResult.Page(
                    mails ?: emptyList(),
                    if (page > 0) page - 1 else null,
                    if (page < 100) page + 1 else null
                )
            }
            else -> {
                val mails = mailDao.getMails(box).first()
                LoadResult.Page(mails, null, null)
            }
        }

    @SuppressLint("SimpleDateFormat")
    private fun getMonth(page: Int) =
        SimpleDateFormat(context.getString(R.string.zimbra_month_format)).format(getCalender(page).time)

    private fun getCalender(page: Int) = Calendar.getInstance().apply {
        add(Calendar.MONTH, -page)
        val firstDay = getActualMinimum(Calendar.DAY_OF_MONTH)
        set(Calendar.DAY_OF_MONTH, firstDay)
    }
}