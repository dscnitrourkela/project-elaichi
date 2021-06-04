package org.dscnitrourkela.elaichi.ui.viewmodels

import androidx.lifecycle.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.launch
import okhttp3.Credentials
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.repository.DataStoreRepository
import org.dscnitrourkela.elaichi.repository.MailRepository
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
    private val dataStoreRepository: DataStoreRepository,
    private val mailRepository: MailRepository,
) : ViewModel() {

    private val _forceUpdate = MutableLiveData(false)

    val isLoggedIn = _forceUpdate.switchMap {
        dataStoreRepository.readCredential(R.string.key_token)
            .asLiveData(viewModelScope.coroutineContext).map { token ->
                if (token.isNullOrEmpty()) {
                    false
                } else {
                    mailRepository.setToken(token)
                    true
                }
            }.switchMap { loggedIn ->
                dataStoreRepository.readCredential(R.string.key_credential)
                    .asLiveData(viewModelScope.coroutineContext).map { credential ->
                        if (credential.isNullOrEmpty()) {
                            loggedIn
                        } else {
                            mailRepository.setCredential(credential)
                            true
                        }
                    }
            }
    }

    fun getMails(request: String, month: Int) =
        flow { emit(mailRepository.getMails(request, month).first()) }.asLiveData().value

    suspend fun login(roll: String, password: String) = flow {
        mailRepository.setCredential(Credentials.basic(roll, password))
        emit(mailRepository.login())
    }.first()

    fun getParsedMails(conversationId: Int) =
        flow { emit(mailRepository.getParsedMails(conversationId).first()) }.asLiveData().value

    fun saveLogIn() = viewModelScope.launch {
        dataStoreRepository.apply {
            saveCredential(R.string.key_credential, mailRepository.getCredential())
            saveCredential(R.string.key_token, mailRepository.getToken())
            saveState(R.string.key_should_sync, true)
        }
    }

    fun resetLogin() = viewModelScope.launch {
        dataStoreRepository.resetLogin()
        mailRepository.resetLogin()
    }
}