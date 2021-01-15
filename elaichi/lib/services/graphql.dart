import 'dart:io';

import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/logger.dart';
import 'package:elaichi/datamodels/auth_user.dart';
import 'package:elaichi/datamodels/data.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:elaichi/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

/// Service which handles all `GraphQL` operations including `query` and
/// `mutation`.
///
/// Initialize the client using [initGraphQL] before using.
@singleton
class GraphQL {
  final Logger _logger = getLogger("GraphQL");
  GraphQLClient _client;

  /// Initializes class variables for further operations
  ///
  /// String `getToken` is JWT token from Firebase.user.getIdToken.
  ///
  /// IMPORTANT: Pass hiveStore only from test files, don't use in production.
  Future<void> initGraphQL(
      {@required Function getToken,
      http.Client httpClient,
      HiveStore hiveStore}) async {
    final HttpLink httpLink =
        HttpLink(Strings.GRAPHQL_URL, httpClient: httpClient);

    final AuthLink authLink = AuthLink(
      getToken: getToken,
    );

    final Link link = authLink.concat(httpLink);

    HiveStore _hiveStore;
    if (hiveStore != null) {
      final LocalDb localDb = locator<LocalDb>();
      localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.cache]);
      final Box box = await localDb.clearAndGetCacheBox();
      _hiveStore = HiveStore(box);
    } else {
      _hiveStore = hiveStore;
    }
    final GraphQLCache cache = GraphQLCache(store: _hiveStore);

    _client = GraphQLClient(link: link, cache: cache);
  }

  /// Authorize or sign in the user at graphql endpoint.
  Future<AuthUser> authUser(
      {@required String username,
      @required String name,
      @required String email,
      @required String mobile,
      @required String displayPicture}) async {
    const String mutation = r'''
      mutation AuthUsers($userInput: UserInputType) {
        __typename
        authUser(user: $userInput) {
          __typename
          id
          name
          username
          gmailAuthMail
          mobile
          displayPicture
        }
      }
    ''';
    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: <String, dynamic>{
        "userInput": {
          "name": name,
          "username": username,
          "gmailAuthMail": email,
          "mobile": mobile,
          "displayPicture": displayPicture
        }
      },
    );

    try {
      final QueryResult result = await _client.mutate(options);

      if (result.hasException) {
        _logger.e("GraphQl error", result.exception);
        throw Exception("Failed to connect to web endpoint");
      }

      return Data.fromJson(result.data).authUser;
    } catch (e) {
      _logger.e("HTTP Error", e);
      throw Exception("Failed to connect to web endpoint");
    }
  }
}
