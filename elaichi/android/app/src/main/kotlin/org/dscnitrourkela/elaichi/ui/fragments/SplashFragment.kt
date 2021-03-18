package org.dscnitrourkela.elaichi.ui.fragments

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.NavOptions
import androidx.navigation.fragment.findNavController
import dagger.hilt.android.AndroidEntryPoint
import org.dscnitrourkela.elaichi.NavGraphDirections
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.ui.viewmodels.SplashViewModel

@AndroidEntryPoint
class SplashFragment : Fragment(R.layout.fragment_splash) {

    private val viewModel: SplashViewModel by viewModels()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        subscribeToObservers()
    }

    private fun subscribeToObservers() {
        viewModel.isLoggedIn.observe(viewLifecycleOwner, {
            it?.let {
                val navOptions = NavOptions.Builder()
                    .setPopUpTo(R.id.splashFragment, true)
                    .build()
                when (it) {
                    true -> findNavController().navigate(
                        NavGraphDirections.actionToMailBoxFragment(getString(R.string.inbox)),
                        navOptions
                    )
                    false -> findNavController().navigate(
                        NavGraphDirections.actionToAuthFragment(),
                        navOptions
                    )
                }
            }
        })
    }
}