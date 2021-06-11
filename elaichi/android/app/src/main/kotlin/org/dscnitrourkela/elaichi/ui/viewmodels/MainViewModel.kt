package org.dscnitrourkela.elaichi.ui.viewmodels

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import okhttp3.Credentials
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.api.data.ParsedMail
import org.dscnitrourkela.elaichi.others.Resource
import org.dscnitrourkela.elaichi.repository.MailRepository
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
//    private val dataStoreRepository: DataStoreRepository,
    private val mailRepository: MailRepository,
) : ViewModel() {

    private val _forceUpdate = MutableLiveData(false)

    var mails = emptyList<Mail>()

    var parsedMails = emptyList<ParsedMail>()

//    val isLoggedIn = _forceUpdate.switchMap {
//        dataStoreRepository.readCredential(R.string.key_token)
//            .asLiveData(viewModelScope.coroutineContext).map { token ->
//                if (token.isNullOrEmpty()) {
//                    false
//                } else {
//                    mailRepository.setToken(token)
//                    true
//                }
//            }.switchMap { loggedIn ->
//                dataStoreRepository.readCredential(R.string.key_credential)
//                    .asLiveData(viewModelScope.coroutineContext).map { credential ->
//                        if (credential.isNullOrEmpty()) {
//                            loggedIn
//                        } else {
//                            mailRepository.setCredential(credential)
//                            true
//                        }
//                    }
//            }
//    }

    fun getMails(request: String, month: Int) = viewModelScope.launch {
        mails = mailRepository.getMails(request, month)
    }


    suspend fun login(roll: String, password: String): Resource<List<Mail>> {
        mailRepository.setCredential(Credentials.basic(roll, password))
        return mailRepository.login()
    }

    fun getParsedMails(conversationId: Int) = viewModelScope.launch {
        parsedMails = mailRepository.getParsedMails(conversationId)
    }

//    fun saveLogIn() = viewModelScope.launch {
//        dataStoreRepository.apply {
//            saveCredential(R.string.key_credential, mailRepository.getCredential())
//            saveCredential(R.string.key_token, mailRepository.getToken())
//            saveState(R.string.key_should_sync, true)
//        }
//    }
//
//    fun resetLogin() = viewModelScope.launch {
//        dataStoreRepository.resetLogin()
//        mailRepository.resetLogin()
//    }
}