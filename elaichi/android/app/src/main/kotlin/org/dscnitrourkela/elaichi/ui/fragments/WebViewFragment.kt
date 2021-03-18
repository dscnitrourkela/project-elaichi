package org.dscnitrourkela.elaichi.ui.fragments

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatDelegate
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.navArgs
import androidx.webkit.WebSettingsCompat
import androidx.webkit.WebViewFeature
import dagger.hilt.android.AndroidEntryPoint
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.databinding.FragmentWebViewBinding
import org.dscnitrourkela.elaichi.others.debugLog

@AndroidEntryPoint
open class WebViewFragment : Fragment(R.layout.fragment_web_view) {

    private var _binding: FragmentWebViewBinding? = null
    private val binding: FragmentWebViewBinding get() = _binding!!

    private val args: WebViewFragmentArgs by navArgs()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        _binding = FragmentWebViewBinding.bind(view)

        setContent()

        binding.swipeRefreshLayout.setOnRefreshListener {
            setContent()
        }
    }

    private fun setContent() = try {
        val assets = requireContext().assets
        val css = assets.open("Font").bufferedReader().use { it.readText() }
        val page = assets.open(args.request).bufferedReader().use { it.readText() }
        binding.webView.apply {
            if (WebViewFeature.isFeatureSupported(WebViewFeature.FORCE_DARK)) {
                val darkMode = when (AppCompatDelegate.getDefaultNightMode()) {
                    AppCompatDelegate.MODE_NIGHT_YES -> WebSettingsCompat.FORCE_DARK_ON
                    else -> WebSettingsCompat.FORCE_DARK_OFF
                }
                WebSettingsCompat.setForceDark(this.settings, darkMode)
            }
            settings.loadsImagesAutomatically = true
            loadDataWithBaseURL(null, page + css, "text/html", "utf-8", null)
        }
    } catch (e: Exception) {
        debugLog(e)
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}