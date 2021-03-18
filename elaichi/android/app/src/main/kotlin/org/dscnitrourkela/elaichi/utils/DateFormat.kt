package org.dscnitrourkela.elaichi.utils

import android.content.Context
import android.text.format.DateUtils
import org.dscnitrourkela.elaichi.R

@Suppress("DEPRECATION")
fun getDateFormat(time: Long, context: Context) = when {
    (System.currentTimeMillis() - time) < DateUtils.DAY_IN_MILLIS -> context.getString(R.string.day_format)
    (System.currentTimeMillis() - time) < DateUtils.YEAR_IN_MILLIS -> context.getString(R.string.month_format)
    else -> context.getString(R.string.year_format)
}