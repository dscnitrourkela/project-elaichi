package org.dscnitrourkela.elaichi.di

import android.content.Context
import android.webkit.WebChromeClient
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ActivityRetainedComponent
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.android.scopes.ActivityRetainedScoped
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.adapters.AttachmentAdapter
import org.dscnitrourkela.elaichi.adapters.MailBoxAdapter
import org.dscnitrourkela.elaichi.adapters.MailItemsAdapter

@Module
@InstallIn(ActivityRetainedComponent::class)
object AdapterModule {

    @ActivityRetainedScoped
    @Provides
    fun provideMailBoxAdapter(@ApplicationContext context: Context, colors: IntArray) =
        MailBoxAdapter(context, colors)

    @ActivityRetainedScoped
    @Provides
    fun provideMailItemsAdapter(
        colors: IntArray,
        attachmentAdapter: AttachmentAdapter
    ) = MailItemsAdapter(
        colors,
//        attachmentAdapter
    )

    @ActivityRetainedScoped
    @Provides
    fun providesAttachmentAdapter() = AttachmentAdapter()

    @ActivityRetainedScoped
    @Provides
    fun provideWebChromeClient() = WebChromeClient()

    @ActivityRetainedScoped
    @Provides
    fun provideColorList(@ApplicationContext context: Context) =
        context.resources.getIntArray(R.array.colors)
}