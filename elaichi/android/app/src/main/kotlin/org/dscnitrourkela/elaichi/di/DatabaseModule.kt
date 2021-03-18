package org.dscnitrourkela.elaichi.di

import android.content.Context
import androidx.room.Room
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ActivityRetainedComponent
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.android.scopes.ActivityRetainedScoped
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.api.database.MailDatabase

@Module
@InstallIn(ActivityRetainedComponent::class)
object DatabaseModule {

    @ActivityRetainedScoped
    @Provides
    fun provideMailDatabase(
        @ApplicationContext context: Context
    ) = Room.databaseBuilder(
        context,
        MailDatabase::class.java,
        context.getString(R.string.database_name)
    ).fallbackToDestructiveMigration().build()

    @ActivityRetainedScoped
    @Provides
    fun provideMailDao(mailDatabase: MailDatabase) = mailDatabase.getMailDao()

    @ActivityRetainedScoped
    @Provides
    fun provideParsedMailDao(mailDatabase: MailDatabase) =
        mailDatabase.getParsedMailDao()
}