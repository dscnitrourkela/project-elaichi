import 'package:elaichi/app/locator.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

/// Service which handles all `GraphQL` operations including `query` and
/// `mutation`.
///
/// Initialize the client using [initGraphQL] before using.
@singleton
class GraphQL {
  Client _client;

  /// Initializes class variables for further operations
  Future<void> initGraphQL() async {
    final HttpLink httpLink = HttpLink(
        "https://testa.nitrkl.in/"); //TODO: Replace after rebasing with Auth PR

    final LocalDb localDb = locator<LocalDb>();
    localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.cache]);
    final Box box = await localDb.clearAndGetCacheBox();
    final HiveStore hiveStore = HiveStore(box);
    final Cache cache = Cache(store: hiveStore);

    _client = Client(link: httpLink, cache: cache);
  }
}
