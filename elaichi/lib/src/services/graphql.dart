import 'package:elaichi/core.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/services.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Throw any exception from [GraphQL] class.
class GraphQLException implements Exception {
  /// Constructor of [GraphQLException]
  GraphQLException(
      {@required this.code, @required this.message, this.description});

  /// Unique codes for referring error
  String code;

  /// One line description of Exception.
  String message;

  /// Complete description of Exception.
  String description;
}

/// Service which handles all `GraphQL` operations including `query` and
/// `mutation`.
///
/// Initialize the client using [initGraphQL] before using.
@singleton
class GraphQL {
  final Logger _logger = getLogger('GraphQL');
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
    final httpLink = HttpLink(Strings.GRAPHQL_URL, httpClient: httpClient);

    final authLink = AuthLink(
      getToken: getToken,
    );

    final link = authLink.concat(httpLink);

    HiveStore _hiveStore;
    if (hiveStore != null) {
      final localDb = locator<LocalDb>();
      await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.cache]);
      final box = await localDb.clearAndGetCacheBox();
      _hiveStore = HiveStore(box);
    } else {
      _hiveStore = hiveStore;
    }
    final cache = GraphQLCache(store: _hiveStore);

    _client = GraphQLClient(link: link, cache: cache);
  }

  /// If user is signed out then client request should start failing.
  void removeClient() {
    _client = null;
  }

  void _handleErrors(QueryResult result) {
    if (result.hasException) {
      if (result.exception.linkException != null) {
        _logger.e('HTTP Error', result.exception.linkException.toString());
        throw GraphQLException(
            code: Strings.HTTP_ERROR, message: 'Failed to connect to server!');
      } else if (result.exception.graphqlErrors != null) {
        _logger.e('GraphQl error', result.exception.graphqlErrors.toString());
        throw GraphQLException(
            code: Strings.GRAPHQL_ERROR,
            message:
                // ignore: lines_longer_than_80_chars
                'Server response: ${result.exception.graphqlErrors[0].extensions['code']}');
      }
    }
  }

  /// Authorize or sign in the user at graphql endpoint.
  Future<AuthUser> authUser(
      {@required String name,
      @required String email,
      @required String displayPicture}) async {
    const mutation = r'''
    mutation AuthUsers($userInput: UserInputType) {
      __typename
      authUser(user: $userInput) {
        __typename
        ... on User{
          __typename
          id
          name
          username
          gmailAuthMail
          mobile
          displayPicture
        }

        ... on ErrorClass{
          __typename
          code
          message
        }
      }
    }
    ''';
    final options = MutationOptions(
      document: gql(mutation),
      variables: <String, dynamic>{
        'userInput': {
          'name': name,
          'gmailAuthMail': email,
          'displayPicture': displayPicture
        }
      },
    );

    final result = await _client.mutate(options);

    _handleErrors(result);
    return Data.fromJson(result.data).authUser;
  }

  /// Updates user info on web endpoint.
  ///
  /// *Important:* Don't use directly, use [Auth.updateUser()] to update user
  /// info.
  Future<AuthUser> updateUser(
      {String name,
      String username,
      String mobile,
      String instituteId,
      String emergencyContact,
      String displayPictureUrl}) async {
    const mutation = r'''
    mutation UpdateUsers($userInput: UserInputType) {
      __typename
      updateUser(user: $userInput) {
        __typename
        ... on User {
          __typename
          id
          name
          username
          gmailAuthMail
          mobile
          displayPicture
        }

        ... on ErrorClass {
          __typename
          code
          message
        }
      }
    }
    ''';

    final options = MutationOptions(
      document: gql(mutation),
      variables: <String, dynamic>{
        'userInput': {
          'name': name,
          'username': username,
          'mobile': mobile,
          'instituteId': instituteId,
          'emergencyContact': emergencyContact,
          'displayPicture': displayPictureUrl
        }
      },
    );

    final result = await _client.mutate(options);

    _handleErrors(result);
    return Data.fromJson(result.data).authUser;
  }
}
