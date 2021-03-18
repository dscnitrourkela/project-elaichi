package org.dscnitrourkela.elaichi.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.appcompat.app.AppCompatDelegate
import androidx.core.view.isVisible
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.RecyclerView
import androidx.webkit.WebSettingsCompat
import androidx.webkit.WebViewFeature
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.data.ParsedMail
import org.dscnitrourkela.elaichi.databinding.MailItemsBinding
import org.dscnitrourkela.elaichi.others.ApiConstants
import org.dscnitrourkela.elaichi.utils.showToast

class MailItemsAdapter(
    private val colors: IntArray,
//    private val attachmentAdapter: AttachmentAdapter,
) : PagingDataAdapter<ParsedMail, MailItemsAdapter.MailItemsViewHolder>(
    object : DiffCallBack<ParsedMail>() {
        override fun areItemsTheSame(oldItem: ParsedMail, newItem: ParsedMail) =
            oldItem.id == newItem.id
    }) {

    private val colorsLength = colors.lastIndex

    class MailItemsViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)

    var id = 0
    var token: String? = null
    var css: String? = null
    var view: TextView? = null

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int) =
        MailItemsViewHolder(
            LayoutInflater.from(parent.context).inflate(R.layout.mail_items, parent, false)
        )

    override fun onBindViewHolder(holder: MailItemsViewHolder, position: Int) {
        val binding = MailItemsBinding.bind(holder.itemView)
        getItem(position)?.let { mail ->
            if (position == itemCount - 1) {
                binding.divider.isVisible = false
            }
            view?.text = mail.subject
            setupWebView(binding)
            setContent(binding, mail)
            holder.itemView.setOnClickListener {
                binding.apply {
                    webView.isVisible = !webView.isVisible
//                    recyclerViewAttachments.isVisible = webView.isVisible
                    textViewEmailDetails.isVisible =
                        webView.isVisible && textViewMailBody.isVisible
                    textViewMailBody.setOnClickListener {
                        textViewEmailDetails.isVisible = !textViewEmailDetails.isVisible
                    }
                }
            }
        }
    }

    @SuppressLint("SimpleDateFormat")
    private fun setContent(binding: MailItemsBinding, mail: ParsedMail) {
        val color = colors[mail.id % colorsLength]
        val sender = mail.from?.split(' ')
        val body =
            (mail.body + mail.attachments).replace("auth=co", "auth=qp&amp;zauthtoken=$token") + css
        var address = ""
        val mailBody = "${sender?.last()}\n${mail.time}"
        mail.address?.forEach {
            address += it
        }
        binding.apply {
            textViewSenderName.text = sender?.first()
            textViewMailBody.text = mailBody
            textViewEmailDetails.text = address
//            if (mail.flag?.contains('f') == true) {
//                imageViewStared.isVisible = true
//            }
            if (mail.attachments?.isEmpty() == true) {
                imageViewAttachment.isVisible = false
            }
//            if (mail.flag?.contains('r') == true) {
//                imageViewReply.isVisible = true
//            }
            webView.loadDataWithBaseURL(ApiConstants.BASE_URL, body, "text/html", "utf-8", null)
//            recyclerViewAttachments.apply {
//                attachmentAdapter.attachmentsName = mail.attachmentsName
//                attachmentAdapter.attachmentsLink = mail.attachmentsLink ?: emptyList()
//                adapter = attachmentAdapter
//                layoutManager =
//                    LinearLayoutManager(context, LinearLayoutManager.HORIZONTAL, false)
//            }
            if (mail.id == id) {
//                recyclerViewAttachments.isVisible = true
                if (mail.body.isNullOrEmpty()) {
                    root.showToast("This mail has no content")
                }
            } else {
                webView.isVisible = false
            }
        }
    }


    @SuppressLint("SetJavaScriptEnabled")
    private fun setupWebView(binding: MailItemsBinding) {
        binding.webView.apply {
            if (WebViewFeature.isFeatureSupported(WebViewFeature.FORCE_DARK)) {
                val darkMode = when (AppCompatDelegate.getDefaultNightMode()) {
                    AppCompatDelegate.MODE_NIGHT_NO -> WebSettingsCompat.FORCE_DARK_OFF
                    else -> WebSettingsCompat.FORCE_DARK_ON
                }
                WebSettingsCompat.setForceDark(this.settings, darkMode)
            }
            isVerticalScrollBarEnabled = false
            settings.javaScriptEnabled = true
            settings.loadsImagesAutomatically = true
        }
    }

    fun setupOnItemClickListener(onClick: ((String) -> Unit)) {
//        attachmentAdapter.onItemClickListener = onClick
    }
}