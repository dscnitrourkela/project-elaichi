package org.dscnitrourkela.elaichi.ui.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.paging.ExperimentalPagingApi
import androidx.paging.cachedIn
import dagger.hilt.android.lifecycle.HiltViewModel
import org.dscnitrourkela.elaichi.repository.MailRepository
import javax.inject.Inject

@HiltViewModel
class MailBoxViewModel @Inject constructor(
    private val mailRepository: MailRepository,
) : ViewModel() {

    @ExperimentalPagingApi
    fun getMails(request: String) = when (mailRepository.getBox(request)) {
        0.toByte() -> mailRepository.getSearchMails(request).cachedIn(viewModelScope)
        else -> mailRepository.getMails(request).cachedIn(viewModelScope)
    }
}