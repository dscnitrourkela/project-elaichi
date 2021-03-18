package org.dscnitrourkela.elaichi.api.database

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import org.dscnitrourkela.elaichi.api.data.Mail
import org.dscnitrourkela.elaichi.api.data.ParsedMail

@Database(
    entities = [Mail::class, ParsedMail::class],
    version = 1,
    exportSchema = false
)

@TypeConverters(Converters::class)
abstract class MailDatabase : RoomDatabase() {
    abstract fun getMailDao(): MailDao
    abstract fun getParsedMailDao(): ParsedMailDao
}