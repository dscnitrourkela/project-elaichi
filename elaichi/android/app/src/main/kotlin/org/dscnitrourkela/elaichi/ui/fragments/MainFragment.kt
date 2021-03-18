package org.dscnitrourkela.elaichi.ui.fragments

import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.ActivityInfo
import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import androidx.navigation.fragment.findNavController
import org.dscnitrourkela.elaichi.NavGraphDirections
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.databinding.FragmentMainBinding

class MainFragment : Fragment(R.layout.fragment_main) {

    private var _binding: FragmentMainBinding? = null
    private val binding: FragmentMainBinding get() = _binding!!

    @SuppressLint("SourceLockedOrientationActivity")
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        _binding = FragmentMainBinding.bind(view)

        requireActivity().requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT

        findNavController().navigate(getNavGraphDirections(0))
    }


    private fun getNavGraphDirections(itemId: Int) = when (itemId) {
        R.id.inboxFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.inbox))
        R.id.sentFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.sent))
        R.id.draftFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.draft))
        R.id.junkFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.junk))
        R.id.trashFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.trash))
        R.id.settingsFragment -> NavGraphDirections.actionToSettingsFragment()
        R.id.aboutFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.about_us))
        R.id.newFeaturesFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.new_features))
        R.id.privacyPolicyFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.privacy_policy))
        R.id.termsAndConditionsFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.terms_conditions))
        else -> NavGraphDirections.actionToAuthFragment()
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}