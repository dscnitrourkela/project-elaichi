package org.dscnitrourkela.elaichi.di

import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import org.dscnitrourkela.elaichi.api.calls.BasicAuthInterceptor
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.others.ApiConstants
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object ApiModule {

    @Singleton
    @Provides
    fun provideBasicAuthInterceptor() = BasicAuthInterceptor()

    @Singleton
    @Provides
    fun provideOkHttpClient(basicAuthInterceptor: BasicAuthInterceptor) = OkHttpClient.Builder()
        .addInterceptor(basicAuthInterceptor)
        .build()

    @Singleton
    @Provides
    fun provideMailApi(
        okHttpClient: OkHttpClient
    ): MailApi = Retrofit.Builder()
        .baseUrl(ApiConstants.BASE_URL)
        .addConverterFactory(GsonConverterFactory.create())
        .client(okHttpClient)
        .build()
        .create(MailApi::class.java)
}