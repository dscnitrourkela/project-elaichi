package org.dscnitrourkela.elaichi.api.data

open class MailTemplate(
    val id: Int,
    val conversationId: Int,
    val subject: String?,
    val body: String?,
)
