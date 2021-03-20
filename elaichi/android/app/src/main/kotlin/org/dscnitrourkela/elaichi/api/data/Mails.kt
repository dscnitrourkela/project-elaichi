package org.dscnitrourkela.elaichi.api.data

import com.google.gson.annotations.SerializedName

data class Mails(
    @SerializedName("m") val mails: List<Mail>? = null,
)