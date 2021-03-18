package org.dscnitrourkela.elaichi.adapters

import androidx.recyclerview.widget.DiffUtil

abstract class DiffCallBack<T> : DiffUtil.ItemCallback<T>() {
    override fun areContentsTheSame(oldItem: T, newItem: T) =
        oldItem.hashCode() == newItem.hashCode()
}