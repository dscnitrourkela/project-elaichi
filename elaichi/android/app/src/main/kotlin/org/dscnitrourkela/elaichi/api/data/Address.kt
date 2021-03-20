package org.dscnitrourkela.elaichi.api.data

import com.google.gson.annotations.SerializedName

data class Address(
    @SerializedName("a") val email: String,
    @SerializedName("d") val firstName: String,
    @SerializedName("p") val name: String,
    @SerializedName("t") val isReceiver: Boolean,
) {
    constructor(email: String, firstName: String, name: String?, isReceiver: String) : this(
        email,
        firstName,
        name ?: firstName,
        isReceiver.contains('t')
    )
}