package org.dscnitrourkela.elaichi.utils

import kotlinx.coroutines.flow.*
import org.dscnitrourkela.elaichi.others.Resource
import org.dscnitrourkela.elaichi.others.debugLog

inline fun <ResultType, RequestType> networkBoundResource(
    crossinline query: () -> Flow<ResultType>,
    crossinline fetch: suspend () -> RequestType,
    crossinline saveFetchResult: suspend (RequestType) -> Unit,
    crossinline onFetchFailed: (Throwable) -> Unit = { },
    crossinline shouldFetch: (ResultType) -> Boolean = { true },
) = flow {
    emit(Resource.loading(null))
    val data = query().first()
    val flow = when {
        shouldFetch(data) -> {
            emit(Resource.loading(data))
            try {
                val fetchedResult = fetch()
                saveFetchResult(fetchedResult)
                debugLog("Network $fetchedResult")
                query().map { Resource.success(it) }
            } catch (t: Throwable) {
                onFetchFailed(t)
                query().map {
                    Resource.error(
                        t.localizedMessage ?: "Couldn't reach server. It might be down",
                        it
                    )
                }
            }
        }
        else -> {
            query().map { Resource.success(it) }
        }
    }
    emitAll(flow)
}