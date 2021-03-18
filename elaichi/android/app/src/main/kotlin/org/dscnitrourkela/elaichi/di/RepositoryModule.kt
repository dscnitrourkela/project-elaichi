package org.dscnitrourkela.elaichi.di

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.createDataStore
import androidx.paging.PagingConfig
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ActivityRetainedComponent
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.android.scopes.ActivityRetainedScoped
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.calls.BasicAuthInterceptor
import org.dscnitrourkela.elaichi.api.calls.MailApi
import org.dscnitrourkela.elaichi.api.database.MailDao
import org.dscnitrourkela.elaichi.api.database.ParsedMailDao
import org.dscnitrourkela.elaichi.repository.DataStoreRepository
import org.dscnitrourkela.elaichi.repository.MailRepository

@Module
@InstallIn(ActivityRetainedComponent::class)
object RepositoryModule {

    @ActivityRetainedScoped
    @Provides
    fun provideDataStore(@ApplicationContext context: Context) =
        context.createDataStore(context.getString(R.string.data_store_name))

    @ActivityRetainedScoped
    @Provides
    fun provideDataStoreRepository(
        @ApplicationContext context: Context,
        dataStore: DataStore<Preferences>
    ) = DataStoreRepository(context, dataStore)

    @ActivityRetainedScoped
    @Provides
    fun providePagerConfig() = PagingConfig(20, 3, false)

    @ActivityRetainedScoped
    @Provides
    fun provideMailRepository(
        @ApplicationContext context: Context,
        basicAuthInterceptor: BasicAuthInterceptor,
        mailApi: MailApi,
        mailDao: MailDao,
        parsedMailDao: ParsedMailDao,
        pagingConfig: PagingConfig
    ) = MailRepository(basicAuthInterceptor, context, mailApi, mailDao, parsedMailDao, pagingConfig)
}