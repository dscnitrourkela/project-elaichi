package org.dscnitrourkela.elaichi.utils

import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.snackbar.Snackbar

fun View.showToast(message: String) = Toast.makeText(context, message, Toast.LENGTH_SHORT).show()

fun View.showSnackbar(message: String) = Snackbar.make(this, message, Snackbar.LENGTH_LONG).show()

fun View.hideKeyBoard() =
    (context.getSystemService(AppCompatActivity.INPUT_METHOD_SERVICE) as InputMethodManager)
        .hideSoftInputFromWindow(windowToken, 0)