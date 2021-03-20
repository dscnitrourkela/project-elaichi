package org.dscnitrourkela.elaichi.ui.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.paging.ExperimentalPagingApi
import androidx.paging.cachedIn
import dagger.hilt.android.lifecycle.HiltViewModel
import org.dscnitrourkela.elaichi.repository.MailRepository
import javax.inject.Inject

@HiltViewModel
class MailItemsViewModel @Inject constructor(
    private val mailRepository: MailRepository
) : ViewModel() {

    @ExperimentalPagingApi
    fun getParsedMails(conversationId: Int) =
        mailRepository.getParsedMails(conversationId).cachedIn(viewModelScope)

    fun getToken() = mailRepository.getToken()
}