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
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.others.Status
import org.dscnitrourkela.elaichi.others.debugLog
import org.dscnitrourkela.elaichi.ui.viewmodels.MainViewModel

@AndroidEntryPoint
class MainActivity : FlutterFragmentActivity() {

    private val viewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        subscribeToObservers()
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method.equals("startOwlMail", ignoreCase = true)) {
                    login()
                }
                if (call.method.equals("getMails", ignoreCase = true)) {
                    val list = getMails()
                    debugLog(list)
                    result.success(list?.size)
                }
                if (call.method.equals("getParsedMails", ignoreCase = true)) {
                    result.success(getParsedMails(0))
                    //TODO pass the conversation id to this
                }
            }
    }

    //TODO Change the hardcoded email password
    private fun login(roll: String = "Roll no", password: String = "Password.") =
        lifecycleScope.launch {
            val result = viewModel.login(roll, password)
            when (result.status) {
                Status.SUCCESS ->
                    viewModel.saveLogIn()
                Status.ERROR -> {
                    //TODO Show Error
                }
                Status.LOADING -> {
                    //TODO Show Progress Bar
                }
            }
        }

    private fun getMails() = viewModel.getMails(getString(R.string.inbox), 0)

    private fun getParsedMails(conversationId: Int) = viewModel.getParsedMails(conversationId)

    private fun subscribeToObservers() {
        viewModel.isLoggedIn.observe(this, {
            it?.let {
                when (it) {
                    true -> {
                    }//Login data exist, naviagate to inbox
                    false -> {
                    }//Show Login Dialog
                }
            }
        })
    }

    companion object {
        private const val CHANNEL = "org.dscnitrourkela.elaichi"
    }
}
