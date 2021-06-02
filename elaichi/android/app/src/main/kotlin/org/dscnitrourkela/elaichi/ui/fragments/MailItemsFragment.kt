package org.dscnitrourkela.elaichi.ui.fragments

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.lifecycle.lifecycleScope
import androidx.navigation.fragment.findNavController
import androidx.navigation.fragment.navArgs
import androidx.paging.ExperimentalPagingApi
import androidx.paging.LoadState
import androidx.recyclerview.widget.LinearLayoutManager
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.InternalCoroutinesApi
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import org.dscnitrourkela.elaichi.NavGraphDirections
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.adapters.MailItemsAdapter
import org.dscnitrourkela.elaichi.databinding.FragmentMailItemsBinding
import org.dscnitrourkela.elaichi.ui.viewmodels.MailItemsViewModel
import org.dscnitrourkela.elaichi.utils.showSnackbar
import javax.inject.Inject


@AndroidEntryPoint
class MailItemsFragment : Fragment(R.layout.fragment_mail_items) {

    private var _binding: FragmentMailItemsBinding? = null
    private val binding: FragmentMailItemsBinding get() = _binding!!

    private val viewModel: MailItemsViewModel by viewModels()

    private val args: MailItemsFragmentArgs by navArgs()

    private var job: Job? = null

    @Inject
    lateinit var mailItemsAdapter: MailItemsAdapter

    @InternalCoroutinesApi
    @ExperimentalPagingApi
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        _binding = FragmentMailItemsBinding.bind(view)

        setupRecyclerView()
        setContent()

        binding.swipeRefreshLayout.setOnRefreshListener {
            getJob()
        }
    }

    private fun setupRecyclerView() = binding.recyclerViewMailBox.apply {
        mailItemsAdapter.view = binding.textViewMailSubject
        mailItemsAdapter.id = args.id
        mailItemsAdapter.token = viewModel.getToken().substringAfter('=')
        mailItemsAdapter.css =
            requireContext().assets.open("Font").bufferedReader().use { it.readText() }
        mailItemsAdapter.setupOnItemClickListener { link ->
            findNavController().navigate(NavGraphDirections.actionToComposeFragment(link))
        }
        adapter = mailItemsAdapter
        layoutManager = LinearLayoutManager(context)
    }

    @ExperimentalPagingApi
    private fun getJob() {
        job?.cancel()
        job = lifecycleScope.launch {
//            viewModel.getParsedMails(args.conversationId).collectLatest {
//                mailItemsAdapter.submitData(it)
//            }
        }
    }

    @InternalCoroutinesApi
    @ExperimentalPagingApi
    private fun setContent() {
        lifecycleScope.launchWhenCreated {
            mailItemsAdapter.loadStateFlow.collectLatest { loadStates ->
                binding.swipeRefreshLayout.isRefreshing = loadStates.refresh is LoadState.Loading
            }
        }
        getJob()
        mailItemsAdapter.addLoadStateListener { loadState ->
            val errorState = loadState.source.append as? LoadState.Error
                ?: loadState.source.prepend as? LoadState.Error
                ?: loadState.append as? LoadState.Error
                ?: loadState.prepend as? LoadState.Error
            errorState?.let {
                it.error.message?.let { message -> binding.root.showSnackbar(message) }
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}