package org.dscnitrourkela.elaichi.api.calls

import okhttp3.Interceptor
import okhttp3.Response

class BasicAuthInterceptor : Interceptor {

    var credential = ""
    var token = ""

    override fun intercept(chain: Interceptor.Chain): Response {

        var response = request(chain)

        if (response.code == 401) {
            response.close()
            token = ""
            response = request(chain)
        }

        if (token.isEmpty() && response.headers("Set-Cookie").isNotEmpty()) {
            token = response.headers("Set-Cookie").first().substringBefore(';')
        }

        return response
    }

    private fun request(chain: Interceptor.Chain) = chain.proceed(
        when (token.isEmpty()) {
            true -> chain.request().newBuilder().header("Authorization", credential).build()
            else -> chain.request().newBuilder().header("Cookie", token).build()
        }
    )
}