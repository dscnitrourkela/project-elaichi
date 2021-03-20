package org.dscnitrourkela.elaichi.ui.fragments

import android.os.Bundle
import androidx.fragment.app.activityViewModels
import androidx.navigation.NavOptions
import androidx.navigation.fragment.findNavController
import androidx.preference.Preference
import androidx.preference.PreferenceFragmentCompat
import androidx.preference.SwitchPreferenceCompat
import dagger.hilt.android.AndroidEntryPoint
import org.dscnitrourkela.elaichi.NavGraphDirections
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.ui.viewmodels.SettingsViewModel

@AndroidEntryPoint
class SettingsFragment : PreferenceFragmentCompat() {

    private val viewModel: SettingsViewModel by activityViewModels()

    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        setPreferencesFromResource(R.xml.root_preferences, rootKey)

        preferenceManager.findPreference<Preference>("Logout")?.apply {
            setOnPreferenceClickListener {
                val navOptions = NavOptions.Builder()
                    .setPopUpTo(R.id.settingsFragment, true)
                    .build()
                findNavController().navigate(NavGraphDirections.actionToAuthFragment(), navOptions)
                true
            }
        }

        preferenceManager.findPreference<SwitchPreferenceCompat>("Theme")?.apply {
            setDefaultValue(viewModel.darkThemeState.value ?: true)
            setOnPreferenceChangeListener { _, value ->
                viewModel.saveThemeState(value as Boolean).invokeOnCompletion {
                    viewModel.syncState()
                }
                true
            }
        }


        preferenceManager.findPreference<SwitchPreferenceCompat>("Sync")?.apply {
            setDefaultValue(viewModel.syncState.value ?: true)
            setOnPreferenceChangeListener { _, value ->
                viewModel.saveSyncState(value as Boolean).invokeOnCompletion {
                    viewModel.syncState()
                }
                true
            }
        }

        preferenceManager.findPreference<SwitchPreferenceCompat>("Analytics")?.apply {
            setDefaultValue(viewModel.analyticsState.value ?: true)
            setOnPreferenceChangeListener { _, value ->
                viewModel.saveAnalyticsState(value as Boolean).invokeOnCompletion {
                    viewModel.syncState()
                }
                true
            }
        }
    }
}