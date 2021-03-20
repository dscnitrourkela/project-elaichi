package org.dscnitrourkela.elaichi.ui.viewmodels

import android.content.Context
import androidx.core.os.persistableBundleOf
import androidx.lifecycle.*
import dagger.hilt.android.lifecycle.HiltViewModel
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.repository.DataStoreRepository
import org.dscnitrourkela.elaichi.repository.MailRepository
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SettingsViewModel @Inject constructor(
    private val dataStoreRepository: DataStoreRepository,
    private val mailRepository: MailRepository,
) : ViewModel() {

    private val _forceUpdate = MutableLiveData(false)

    val darkThemeState = _forceUpdate.switchMap {
        dataStoreRepository.readState(R.string.key_dark_theme)
            .asLiveData(viewModelScope.coroutineContext)
    }

    val syncState = _forceUpdate.switchMap {
        dataStoreRepository.readState(R.string.key_should_sync)
            .asLiveData(viewModelScope.coroutineContext)
    }

    val analyticsState = _forceUpdate.switchMap {
        dataStoreRepository.readState(R.string.key_analytics)
            .asLiveData(viewModelScope.coroutineContext)
    }

    fun saveThemeState(enabled: Boolean) = viewModelScope.launch {
        dataStoreRepository.saveState(R.string.key_dark_theme, enabled)
    }

    fun saveSyncState(enabled: Boolean) = viewModelScope.launch {
        dataStoreRepository.saveState(R.string.key_should_sync, enabled)
    }

    fun saveAnalyticsState(enabled: Boolean) = viewModelScope.launch {
        dataStoreRepository.saveState(R.string.key_analytics, enabled)
    }

    fun syncState() = _forceUpdate.postValue(true)

    fun getBundle(context: Context) = persistableBundleOf(
        context.getString(R.string.key_should_sync) to syncState.value,
        context.getString(R.string.key_token) to mailRepository.getToken(),
        context.getString(R.string.key_credential) to mailRepository.getCredential()
    )
}