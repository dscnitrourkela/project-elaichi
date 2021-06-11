package org.dscnitrourkela.elaichi.ui.activities

import android.os.Bundle
import android.os.PersistableBundle
import androidx.activity.viewModels
import androidx.annotation.NonNull
import androidx.lifecycle.lifecycleScope
import dagger.hilt.android.AndroidEntryPoint
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.launch
import org.dscnitrourkela.elaichi.others.Status
import org.dscnitrourkela.elaichi.others.debugLog
import org.dscnitrourkela.elaichi.ui.viewmodels.MainViewModel

@AndroidEntryPoint
class MainActivity : FlutterFragmentActivity() {

    private val viewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
//        subscribeToObservers()
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method.equals("startOwlMail", ignoreCase = true)) {
                    login().invokeOnCompletion {
                        debugLog("Mails")
                        getMails().invokeOnCompletion {
                            debugLog(viewModel.mails)
                        }
                    }
                }
                if (call.method.equals("getMails", ignoreCase = true)) {
                    debugLog("clicked")
                    getMails().invokeOnCompletion {
                        debugLog(viewModel.mails)
                    }
                    result.success(viewModel.mails.size)
                }
                if (call.method.equals("getParsedMails", ignoreCase = true)) {
                    getParsedMails(0)
                }
            }
    }

    //TODO Change the hardcoded email password
    private fun login(roll: String = "", password: String = "") =
        lifecycleScope.launch {
            val result = viewModel.login(roll, password)
            debugLog(result)
            when (result.status) {
                Status.SUCCESS -> {
//                    viewModel.saveLogIn()
                    debugLog("Logged In")
                }
                Status.ERROR -> {
                    //TODO Show Error
                }
                Status.LOADING -> {
                    //TODO Show Progress Bar
                }
            }
        }

    private fun getMails() = viewModel.getMails("inbox", 0)

    private fun getParsedMails(conversationId: Int) = viewModel.getParsedMails(conversationId)

//    private fun subscribeToObservers() {
//        viewModel.isLoggedIn.observe(this, {
//            it?.let {
//                when (it) {
//                    true -> {
//                    }//Login data exist, naviagate to inbox
//                    false -> {
//                    }//Show Login Dialog
//                }
//            }
//        })
//    }

    companion object {
        private const val CHANNEL = "org.dscnitrourkela.elaichi"
    }
}
