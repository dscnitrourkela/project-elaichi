package org.dscnitrourkela.elaichi

import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.dscnitrourkela.elaichi.ui.activities.MailActivity


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, _ ->
                if (call.method.equals("startOwlMail", ignoreCase = true)) {
                    startActivity(Intent(this, MailActivity::class.java))
                }
            }
    }

    companion object {
        private const val CHANNEL = "OWL_MAIL"
    }
}
