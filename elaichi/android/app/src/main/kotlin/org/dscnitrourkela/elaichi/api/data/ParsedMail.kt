package org.dscnitrourkela.elaichi.api.data

import android.annotation.SuppressLint
import androidx.room.Entity
import androidx.room.PrimaryKey
import org.jsoup.nodes.Document

@Entity(tableName = "parsed_mails")
data class ParsedMail(

    @PrimaryKey(autoGenerate = false)
    val id: Int,

    val conversationId: Int,
    val time: String?,
    val from: String?,
    val subject: String?,
    val address: List<String>?,
    val body: String?,
    val attachments: String?,
) {

    @SuppressLint("SimpleDateFormat")
    constructor(
        id: Int,
        conversationId: Int,
        mail: Document,
    ) : this(
        id,
        conversationId,
        mail.select(".small-gray-text").text(),
        mail.select("#d_from").text(),
        mail.select(".zo_unread").text(),
        mail.select("#d_div .View.address").eachText(),
        mail.select(".msgwrap").toString(),
        mail.select(".View.attachments").toString()
    )
}
