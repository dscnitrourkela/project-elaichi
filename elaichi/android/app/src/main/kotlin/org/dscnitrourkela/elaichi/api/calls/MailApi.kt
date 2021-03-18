package org.dscnitrourkela.elaichi.api.calls

import org.dscnitrourkela.elaichi.api.data.Mails
import org.dscnitrourkela.elaichi.others.ApiConstants
import okhttp3.ResponseBody
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface MailApi {

    @GET(ApiConstants.HOME_URL + ApiConstants.AUTH_SET_COOKIE + ApiConstants.JSON_FORMAT + ApiConstants.NONE_ITEM_QUERY)
    suspend fun login(): Response<Mails>

    @GET(ApiConstants.HOME_URL + "{request}" + ApiConstants.AUTH_FROM_COOKIE + ApiConstants.JSON_FORMAT)
    suspend fun getMails(
        @Path("request") request: String,
        @Query("query") month: String,
    ): Response<Mails>

    @GET(ApiConstants.MOBILE_URL + ApiConstants.ACTION_VIEW + ApiConstants.LOAD_IMAGES)
    suspend fun getParsedMail(
        @Query("id") id: Int,
    ): ResponseBody

//    @GET(ApiConstants.HTML_URL + ApiConstants.AUTH_FROM_COOKIE + ApiConstants.LOAD_IMAGES)
//    suspend fun getParsedMail(
//        @Query("id") id: Int,
//    ): ResponseBody

    @GET(ApiConstants.HOME_URL + ApiConstants.AUTH_FROM_COOKIE + ApiConstants.JSON_FORMAT)
    suspend fun searchMails(
        @Query("query") query: String,
    ): Response<Mails>
}