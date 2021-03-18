package org.dscnitrourkela.elaichi.services

import android.annotation.SuppressLint
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.ui.activities.MailActivity

class NotificationExt(private val context: Context) {

    private val notificationManager = NotificationManagerCompat.from(context).apply {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val notificationChannel = NotificationChannel(
                context.getString(R.string.notification_id),
                context.getString(R.string.notification_channel),
                NotificationManager.IMPORTANCE_DEFAULT
            )
            notificationChannel.apply {
                enableLights(true)
                lightColor = Color.WHITE
                enableVibration(true)
            }
            createNotificationChannel(notificationChannel)
        }
    }

    private fun notificationBuilder(title: String, subject: String, pendingIntent: PendingIntent) =
        NotificationCompat.Builder(context, context.getString(R.string.notification_id)).apply {
            priority = NotificationCompat.PRIORITY_DEFAULT
            setStyle(NotificationCompat.BigTextStyle())
            setColorized(true)
            setSmallIcon(R.drawable.ic_launcher_foreground)
            setContentTitle(title)
            setContentText(subject)
            setContentIntent(pendingIntent)
        }.build()

    fun notify(
        title: String, subject: String, id: Int = 0,
        @SuppressLint("UnspecifiedImmutableFlag") pendingIntent: PendingIntent =
            PendingIntent.getActivity(context, 1000, Intent(context, MailActivity::class.java), 0)
    ) = notificationManager.notify(id, notificationBuilder(title, subject, pendingIntent))

    fun cancelNotify(id: Int = 0) = notificationManager.cancel(id)
}