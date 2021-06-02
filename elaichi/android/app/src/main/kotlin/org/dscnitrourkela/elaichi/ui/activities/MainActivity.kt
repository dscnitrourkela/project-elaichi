package org.dscnitrourkela.elaichi.ui.activities

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import androidx.lifecycle.*
import androidx.paging.ExperimentalPagingApi
import dagger.hilt.android.AndroidEntryPoint
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import okhttp3.Credentials
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.repository.MailRepository
import javax.inject.Inject

@AndroidEntryPoint
class MainActivity : FlutterFragmentActivity() {

    @Inject
    lateinit var mailRepository: MailRepository

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, _ ->
                if (call.method.equals("startOwlMail", ignoreCase = true)) {
                    startActivity(Intent(this, MailActivity::class.java))
                }
            }
    }

    suspend fun getMails()=
        mailRepository.getMails(getString(R.string.inbox),0)

    suspend fun login() {
        mailRepository.setCredential(Credentials.basic("RollNO","Password"))
        mailRepository.login()
    }

    companion object {
        private const val CHANNEL = "OWL_MAIL"
    }
}
