package org.dscnitrourkela.elaichi.ui.activities

import androidx.annotation.NonNull
import dagger.hilt.android.AndroidEntryPoint
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import okhttp3.Credentials
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.repository.MailRepository
import javax.inject.Inject

@AndroidEntryPoint
class MainActivity : FlutterFragmentActivity() {

    @Inject
    lateinit var mailRepository: MailRepository

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method.equals("startOwlMail", ignoreCase = true)) {
                    ensureLogin()
                }
                if (call.method.equals("getMails", ignoreCase = true)) {
                    result.success(getMailsList().size)
                }
            }
    }

    fun getMailsList():List<Mail>{
        var list:List<Mail> = emptyList()
        CoroutineScope(Dispatchers.IO).launch {
            list = getMails()
            print("getting list inside coroutine done")

        }
        return list
    }

    fun ensureLogin():Unit{
        CoroutineScope(Dispatchers.IO).launch {
            login()
            print("login inside coroutine done")

        }
    }
    suspend fun getMails()=
        mailRepository.getMails(getString(R.string.inbox),0).first()

    //TODO Change the hardcoded email password
    suspend fun login() {
        mailRepository.setCredential(Credentials.basic("Roll no","Password."))
        mailRepository.login()
        print("Ho gaya login, aage badho")
    }

    companion object {
        private const val CHANNEL = "org.dscnitrourkela.elaichi"
    }
}
