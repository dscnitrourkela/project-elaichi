package org.dscnitrourkela.elaichi.ui.fragments

import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.View
import androidx.appcompat.widget.SearchView
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.lifecycle.lifecycleScope
import androidx.navigation.fragment.findNavController
import androidx.navigation.fragment.navArgs
import androidx.paging.ExperimentalPagingApi
import androidx.paging.LoadState
import androidx.recyclerview.widget.LinearLayoutManager
import dagger.hilt.android.AndroidEntryPoint
import org.dscnitrourkela.elaichi.NavGraphDirections
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.adapters.MailBoxAdapter
import org.dscnitrourkela.elaichi.databinding.FragmentMailBoxBinding
import org.dscnitrourkela.elaichi.others.ApiConstants
import org.dscnitrourkela.elaichi.ui.viewmodels.MailBoxViewModel
import kotlinx.coroutines.InternalCoroutinesApi
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import org.dscnitrourkela.elaichi.utils.showSnackbar
import javax.inject.Inject

@AndroidEntryPoint
open class MailBoxFragment : Fragment(R.layout.fragment_mail_box) {

    private var _binding: FragmentMailBoxBinding? = null
    private val binding: FragmentMailBoxBinding get() = _binding!!

    private val viewModel: MailBoxViewModel by activityViewModels()

    private val args: MailBoxFragmentArgs by navArgs()

    private var job: Job? = null

    @Inject
    lateinit var mailBoxAdapter: MailBoxAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)
    }

    @InternalCoroutinesApi
    @ExperimentalPagingApi
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        _binding = FragmentMailBoxBinding.bind(view)

        setupAdapter()
        setupRecyclerView()
        setContent()

        binding.swipeRefreshLayout.setOnRefreshListener {
            getJob()
        }

        binding.floatingActionButtonCompose.setOnClickListener {
            findNavController().navigate(
                NavGraphDirections.actionToComposeFragment(
                    ApiConstants.BASE_URL + ApiConstants.MOBILE_URL + ApiConstants.AUTH_FROM_COOKIE + ApiConstants.COMPOSE_MAIL
                )
            )
        }
    }

    private fun setupAdapter() = mailBoxAdapter.setupOnItemClickListener {
        findNavController().navigate(
            NavGraphDirections.actionToMailItemsFragment(it.conversationId, it.id)
        )
    }

    private fun setupRecyclerView() = binding.recyclerViewMailBox.apply {
        adapter = mailBoxAdapter
        layoutManager = LinearLayoutManager(context)
    }

    @ExperimentalPagingApi
    private fun getJob(query: String = args.request) {
        job?.cancel()
        job = lifecycleScope.launch {
            viewModel.getMails(query).collectLatest {
                mailBoxAdapter.submitData(it)
            }
        }
    }

    @ExperimentalPagingApi
    private fun setContent() {
        lifecycleScope.launchWhenCreated {
            mailBoxAdapter.loadStateFlow.collectLatest { loadStates ->
                binding.swipeRefreshLayout.isRefreshing = loadStates.refresh is LoadState.Loading
            }
        }
        getJob()
        mailBoxAdapter.addLoadStateListener { loadState ->
            val errorState = loadState.source.append as? LoadState.Error
                ?: loadState.source.prepend as? LoadState.Error
                ?: loadState.append as? LoadState.Error
                ?: loadState.prepend as? LoadState.Error
            errorState?.let {
                it.error.message?.let { message -> binding.root.showSnackbar(message) }
            }
        }
    }

    @ExperimentalPagingApi
    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        inflater.inflate(R.menu.search_menu, menu)
        val searchView = menu.findItem(R.id.searchBar).actionView as SearchView
        searchView.queryHint = getString(R.string.search)
        searchView.isSubmitButtonEnabled = true
        searchView.setOnCloseListener {
            getJob()
            false
        }
        searchView.setOnQueryTextListener(object : SearchView.OnQueryTextListener {
            override fun onQueryTextSubmit(query: String): Boolean {
                getJob(query)
                return true
            }

            override fun onQueryTextChange(query: String) = false
        })
        super.onCreateOptionsMenu(menu, inflater)
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}