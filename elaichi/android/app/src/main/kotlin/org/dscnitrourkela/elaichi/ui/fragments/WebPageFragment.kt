package org.dscnitrourkela.elaichi.ui.fragments

import android.os.Bundle
import android.view.View
import android.webkit.WebChromeClient
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.navArgs
import dagger.hilt.android.AndroidEntryPoint
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.databinding.FragmentWebViewBinding
import org.dscnitrourkela.elaichi.others.ApiConstants
import org.dscnitrourkela.elaichi.ui.viewmodels.WebPageViewModel
import javax.inject.Inject

@AndroidEntryPoint
class WebPageFragment : Fragment(R.layout.fragment_web_view) {

    private var _binding: FragmentWebViewBinding? = null
    private val binding: FragmentWebViewBinding get() = _binding!!

    private val viewModel: WebPageViewModel by viewModels()

    private val args: WebPageFragmentArgs by navArgs()

    @Inject
    lateinit var chromeClient: WebChromeClient

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        _binding = FragmentWebViewBinding.bind(view)

        setContent()

        binding.swipeRefreshLayout.setOnRefreshListener {
            setContent()
        }
    }

    private fun setContent() {
        val url = ApiConstants.BASE_URL + args.url.replace("auth=co&disp=a", "disp=i")
        binding.swipeRefreshLayout.isRefreshing = true
        binding.webView.apply {
            webChromeClient = chromeClient
            settings.loadsImagesAutomatically = true
            settings.setSupportZoom(true)
            setInitialScale(100)
            loadUrl(url + ApiConstants.AUTH_FROM_TOKEN + viewModel.token.substringAfter('='))
            zoomOut()
        }
        binding.swipeRefreshLayout.isRefreshing = false
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}