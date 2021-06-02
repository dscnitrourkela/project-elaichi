package org.dscnitrourkela.elaichi.services

import android.annotation.SuppressLint
import android.app.job.JobParameters
import android.app.job.JobService
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.calls.BasicAuthInterceptor
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.others.ApiConstants
import java.text.SimpleDateFormat
import java.util.*
import javax.inject.Inject

@AndroidEntryPoint
class SyncService : JobService() {

    @Inject
    lateinit var basicAuthInterceptor: BasicAuthInterceptor

    @Inject
    lateinit var mailApi: MailApi

    @Inject
    lateinit var notificationExt: NotificationExt

    @SuppressLint("NewApi")
    override fun onStartJob(jobParameters: JobParameters?): Boolean {

        val shouldSync =
            jobParameters?.extras?.getBoolean(applicationContext.getString(R.string.key_should_sync))
        if (shouldSync == false) {
            stopSelf()
        }
        startSyncWorker(jobParameters)
        return true
    }

    override fun onStopJob(jobParameters: JobParameters?) = true

    private fun startSyncWorker(jobParameters: JobParameters?) {
        jobParameters?.let { it ->
            it.extras.getString(applicationContext.getString(R.string.key_credential))
                ?.let { credential -> basicAuthInterceptor.credential = credential }
            it.extras.getString(applicationContext.getString(R.string.key_token))
                ?.let { token -> basicAuthInterceptor.token = token }
            notificationExt.notify("Syncing Mails", "You may have some new mails")
            getMails().invokeOnCompletion { t ->
                notificationExt.cancelNotify()
                if (t == null) {
                    jobFinished(jobParameters, false)
                } else {
                    jobFinished(jobParameters, true)
                }
            }
        }
    }

    @SuppressLint("SimpleDateFormat")
    private fun getMails() = CoroutineScope(Dispatchers.IO).launch {
        val calendar = Calendar.getInstance()
        val simpleDateFormat =
            SimpleDateFormat(applicationContext.getString(R.string.zimbra_month_format))
        val month = simpleDateFormat.format(calendar.time)
        val list = mailApi.getMails(
            applicationContext.getString(R.string.inbox),
            ApiConstants.MONTH_QUERY + month
        ).body()?.mails
        list?.let { sendNotification(it) }
    }

    private fun sendNotification(list: List<Mail>) {
        list.forEach { mail ->
            if (mail.flag?.contains('u') == true) {
                val sender = mail.addresses?.last()
                notificationExt.notify(
                    "New Mail From ${sender?.firstName}",
                    mail.subject ?: "",
                    mail.id
                )
            }
        }
    }
}