package org.dscnitrourkela.elaichi.api.data

import androidx.room.Entity
import androidx.room.PrimaryKey
import com.google.gson.annotations.SerializedName

@Entity(tableName = "mails")
data class Mail(

    @PrimaryKey(autoGenerate = false)
    @SerializedName("id") val id: Int,

    @SerializedName("cid") val conversationId: Int,
    @SerializedName("d") val time: Long,
    @SerializedName("e") val addresses: List<Address>?,
    @SerializedName("f") val flag: String?,
    @SerializedName("fr") val body: String?,
    @SerializedName("l") val box: Byte,
    @SerializedName("rev") val rev: Int,
    @SerializedName("s") val size: Int,
    @SerializedName("su") val subject: String?,
) {
    constructor(
        id: String,
        conversationId: String,
        time: Long,
        addresses: List<Address>?,
        flag: String?,
        body: String,
        box: String,
        rev: Int,
        size: Int,
        subject: String,
    ) : this(
        id.toInt(),
        conversationId.toInt(),
        time,
        addresses,
        flag,
        if (body.isEmpty()) null else body.replace("...", ""),
        box.toByte(),
        rev,
        size,
        if (subject.isEmpty()) null else subject,
    )
}