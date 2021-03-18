package org.dscnitrourkela.elaichi.adapters

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Typeface
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.view.isVisible
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.RecyclerView
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.databinding.MailItemBinding
import org.dscnitrourkela.elaichi.utils.getDateFormat
import java.text.SimpleDateFormat

class MailBoxAdapter(private val context: Context, private val colors: IntArray) :
    PagingDataAdapter<Mail, MailBoxAdapter.MailBoxViewHolder>(
        object : DiffCallBack<Mail>() {
            override fun areItemsTheSame(oldItem: Mail, newItem: Mail) =
                oldItem.id == newItem.id
        }) {

    private var onItemClickListener: ((Mail) -> Unit)? = null

    private val colorsLength = colors.lastIndex

    class MailBoxViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int) =
        MailBoxViewHolder(
            LayoutInflater.from(parent.context).inflate(R.layout.mail_item, parent, false)
        )

    override fun onBindViewHolder(holderBox: MailBoxViewHolder, position: Int) {
        getItem(position)?.let { mail ->
            val binding = MailItemBinding.bind(holderBox.itemView)
            val sender =
                if (mail.flag?.contains('s') == true) mail.addresses?.first() else mail.addresses?.last()

            @SuppressLint("SimpleDateFormat")
            val dateFormat = SimpleDateFormat(getDateFormat(mail.time, context))

            val color = colors[mail.size % colorsLength]

            binding.apply {
                textViewDate.text = dateFormat.format(mail.time)
                textViewMailBody.text = mail.body
                textViewMailSubject.text = mail.subject
                textViewSenderEmail.text = sender?.firstName
                if (mail.flag?.contains('u') == true) {
                    textViewSenderEmail.typeface = Typeface.DEFAULT_BOLD
                    textViewMailSubject.typeface = Typeface.DEFAULT_BOLD
                    textViewDate.typeface = Typeface.DEFAULT_BOLD
                    textViewMailBody.typeface = Typeface.DEFAULT_BOLD
                }
                if (mail.flag?.contains('f') == true) {
                    imageViewStared.isVisible = true
                }
                if (mail.flag?.contains('a') == true) {
                    imageViewAttachment.isVisible = true
                }
//            if (mail.flag.contains('r')) {
//                imageViewReply.isVisible = true
//            }
                if (position == itemCount - 1) {
                    divider.isVisible = false
                }
            }
            holderBox.itemView.setOnClickListener {
                onItemClickListener?.let { onClick -> onClick(mail) }
            }
        }
    }

    fun setupOnItemClickListener(onClick: ((Mail) -> Unit)) {
        onItemClickListener = onClick
    }
}