package org.dscnitrourkela.elaichi.ui.activities

import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.google.firebase.analytics.ktx.analytics
import com.google.firebase.crashlytics.ktx.crashlytics
import com.google.firebase.ktx.Firebase
import dagger.hilt.android.AndroidEntryPoint
import org.dscnitrourkela.elaichi.databinding.ActivityMailBinding
import org.dscnitrourkela.elaichi.ui.viewmodels.SettingsViewModel
import org.dscnitrourkela.elaichi.utils.enableDarkTheme
import org.dscnitrourkela.elaichi.utils.enableSyncService
import org.dscnitrourkela.elaichi.utils.hideKeyBoard


@AndroidEntryPoint
class MailActivity : AppCompatActivity() {

    private var _binding: ActivityMailBinding? = null
    private val binding: ActivityMailBinding get() = _binding!!

//    private lateinit var toggle: ActionBarDrawerToggle
//    private lateinit var navController: NavController

    private val viewModel: SettingsViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        _binding = ActivityMailBinding.inflate(layoutInflater)
        setContentView(binding.root)

//        drawerOptionMenu()

//        inAppReview()
//
//        inAppUpdate()

        subscribeToObservers()

//        loadAds()

    }

    private fun enableFirebase(shouldEnable: Boolean) {
        Firebase.analytics.setAnalyticsCollectionEnabled(shouldEnable)
        Firebase.crashlytics.setCrashlyticsCollectionEnabled(shouldEnable)
    }

//    private fun drawerOptionMenu() {
//
//        navController = findNavController(R.id.navHostFragment)
//
//        supportActionBar?.setDisplayHomeAsUpEnabled(true)
//
//        toggle = ActionBarDrawerToggle(this, binding.drawerLayout, R.string.open, R.string.close)
//        binding.drawerLayout.addDrawerListener(toggle)
//        toggle.syncState()
//
//        binding.navView.apply {
//            setCheckedItem(R.id.inboxFragment)
//            setNavigationItemSelectedListener {
//                navController.navigate(getNavGraphDirections(it.itemId))
//                setCheckedItem(it)
//                binding.drawerLayout.closeDrawer(GravityCompat.START)
//                true
//            }
//        }
//
//        navController.addOnDestinationChangedListener { _, destination, arguments ->
//            arguments?.get("request")?.let { supportActionBar?.title = it.toString() }
//            navGraphActionBarAndDrawer(destination.id)
//        }
//    }

//    private fun navGraphActionBarAndDrawer(id: Int) = when (id) {
//        R.id.authFragment -> {
//            supportActionBar?.hide()
//            enableDrawer(false)
//        }
//        R.id.mailBoxFragment -> {
//            supportActionBar?.show()
//            enableDrawer(true)
//        }
//        else -> {
//            supportActionBar?.show()
//            enableDrawer(false)
//        }
//    }
//
//    private fun getNavGraphDirections(itemId: Int) = when (itemId) {
//        R.id.inboxFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.inbox))
//        R.id.sentFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.sent))
//        R.id.draftFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.draft))
//        R.id.junkFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.junk))
//        R.id.trashFragment -> NavGraphDirections.actionToMailBoxFragment(getString(R.string.trash))
//        R.id.settingsFragment -> NavGraphDirections.actionToSettingsFragment()
//        R.id.aboutFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.about_us))
//        R.id.newFeaturesFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.new_features))
//        R.id.privacyPolicyFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.privacy_policy))
//        R.id.termsAndConditionsFragment -> NavGraphDirections.actionToWebViewFragment(getString(R.string.terms_conditions))
//        else -> NavGraphDirections.actionToAuthFragment()
//    }

    private fun subscribeToObservers() {
        viewModel.darkThemeState.observe(this, { result -> result?.let { enableDarkTheme(it) } })
        viewModel.analyticsState.observe(this, { result -> result?.let { enableFirebase(it) } })
        viewModel.syncState.observe(this, { result ->
            result?.let { enableSyncService(it, viewModel.getBundle(this)) }
        })
    }

//    private fun enableDrawer(shouldEnable: Boolean) {
//        binding.drawerLayout.setDrawerLockMode(if (shouldEnable) DrawerLayout.LOCK_MODE_UNLOCKED else DrawerLayout.LOCK_MODE_LOCKED_CLOSED)
//        toggle.isDrawerIndicatorEnabled = shouldEnable
//    }
//
//    private fun loadAds() {
//        MobileAds.initialize(this)
//        binding.adView.loadAd(AdRequest.Builder().build())
//    }
//
//    override fun onOptionsItemSelected(item: MenuItem): Boolean {
//        if (toggle.onOptionsItemSelected(item)) {
//            return true
//        }
//        return super.onOptionsItemSelected(item)
//    }

    override fun onBackPressed() {
        if (binding.root.hideKeyBoard()) {
            return
        }
        super.onBackPressed()
    }

//    override fun onSupportNavigateUp() = navController.navigateUp() || super.onSupportNavigateUp()

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}