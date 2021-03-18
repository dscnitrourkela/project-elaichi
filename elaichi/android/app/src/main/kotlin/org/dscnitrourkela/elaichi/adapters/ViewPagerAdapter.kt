package org.dscnitrourkela.elaichi.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import org.dscnitrourkela.elaichi.R
import org.dscnitrourkela.elaichi.utils.showSnackbar

class ViewPagerAdapter(private val tabs: List<String>) :
    RecyclerView.Adapter<ViewPagerAdapter.ViewPagerHolder>() {

    class ViewPagerHolder(view: View) : RecyclerView.ViewHolder(view)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int) =
        ViewPagerHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.fragment_auth, parent, false
            )
        )

    override fun onBindViewHolder(holder: ViewPagerHolder, position: Int) {
        holder.itemView.showSnackbar("Hello $position")
    }

    override fun getItemCount() = tabs.size
}