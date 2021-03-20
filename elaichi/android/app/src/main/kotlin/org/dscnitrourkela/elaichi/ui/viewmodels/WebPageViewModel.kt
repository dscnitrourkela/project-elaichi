package org.dscnitrourkela.elaichi.ui.viewmodels

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import org.dscnitrourkela.elaichi.repository.MailRepository
import javax.inject.Inject

@HiltViewModel
class WebPageViewModel @Inject constructor(
    private val mailRepository: MailRepository
) : ViewModel() {
    val token = mailRepository.getToken()
}