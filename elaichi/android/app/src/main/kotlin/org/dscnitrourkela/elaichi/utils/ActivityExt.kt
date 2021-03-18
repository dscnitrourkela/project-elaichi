package org.dscnitrourkela.elaichi.utils

import android.app.AlarmManager
import android.app.job.JobInfo
import android.app.job.JobScheduler
import android.content.ComponentName
import android.content.Context
import android.os.PersistableBundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.app.AppCompatDelegate
import com.google.android.play.core.appupdate.AppUpdateInfo
import com.google.android.play.core.appupdate.AppUpdateManager
import com.google.android.play.core.appupdate.AppUpdateManagerFactory
import com.google.android.play.core.install.model.AppUpdateType
import com.google.android.play.core.install.model.UpdateAvailability
import com.google.android.play.core.review.ReviewManagerFactory
import com.google.android.play.core.tasks.Task
import org.dscnitrourkela.elaichi.others.debugLog
import org.dscnitrourkela.elaichi.services.SyncService

fun AppCompatActivity.enableSyncService(shouldEnable: Boolean, bundle: PersistableBundle) =
    when (shouldEnable) {
        true -> startSyncJobService(bundle)
        else -> stopSyncJobService()
    }

fun AppCompatActivity.startSyncJobService(bundle: PersistableBundle) {
    val syncJob = JobInfo.Builder(1000, ComponentName(this, SyncService::class.java)).apply {
        setPeriodic(AlarmManager.INTERVAL_FIFTEEN_MINUTES)
        setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
        setExtras(bundle)
        setPersisted(true)
    }.build()
    (getSystemService(Context.JOB_SCHEDULER_SERVICE) as JobScheduler).schedule(syncJob)
}

fun AppCompatActivity.stopSyncJobService() =
    (getSystemService(Context.JOB_SCHEDULER_SERVICE) as JobScheduler).cancelAll()

fun AppCompatActivity.inAppReview() {
    val reviewManager = ReviewManagerFactory.create(this)
    val request = reviewManager.requestReviewFlow()
    request.addOnCompleteListener { task ->
        when (task.isSuccessful) {
            true -> {
                val reviewInfo = task.result
                val flow = reviewManager.launchReviewFlow(this, reviewInfo)
                flow.addOnCompleteListener {
                    debugLog(task.isComplete)
                }
            }
            else -> {
                debugLog(task.exception)
            }
        }
    }
}

fun AppCompatActivity.inAppUpdate() {
    val appUpdateManager = AppUpdateManagerFactory.create(this)
    val appUpdateInfo = appUpdateManager.appUpdateInfo
    appUpdateInfo.addOnSuccessListener {
        doUpdate(appUpdateManager, appUpdateInfo)
    }
}

fun AppCompatActivity.doUpdate(
    appUpdateManager: AppUpdateManager,
    task: Task<AppUpdateInfo>
) {
    if ((task.result.updateAvailability() == UpdateAvailability.UPDATE_AVAILABLE || task.result.updateAvailability() == UpdateAvailability.DEVELOPER_TRIGGERED_UPDATE_IN_PROGRESS) && task.result.isUpdateTypeAllowed(
            AppUpdateType.IMMEDIATE
        )
    ) {
        appUpdateManager.startUpdateFlowForResult(
            task.result,
            AppUpdateType.IMMEDIATE,
            this,
            1000
        )
    }
}

fun enableDarkTheme(shouldEnable: Boolean) {
    when (shouldEnable) {
        false -> AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO)
        else -> AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
    }
}