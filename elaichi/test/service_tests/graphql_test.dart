import 'dart:io';

import 'package:elaichi/core.dart';
import 'package:elaichi/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../setup/http_helpers.dart';
import 'graphql_test.mocks.dart';

@GenerateMocks([http.Client, Box, LocalDb])
void main() {
  final _graphQL = GraphQL();
  final _mockHttpClient = MockClient();

  setUpAll(() async {
    final _mockLocalDb = MockLocalDb();
    locator.registerSingleton<LocalDb>(_mockLocalDb);

    final directory = await Directory.systemTemp.createTemp();
    final store = await HiveStore.open(path: directory.path);

    when(_mockLocalDb.getCacheBox()).thenAnswer((_) async => MockBox());

    await _graphQL.initGraphQL(
        getToken: () async {
          return 'dummy token';
        },
        httpClient: _mockHttpClient,
        hiveStore: store);
  });
  tearDown(_graphQL.removeClient);

  group('AuthUser test -', () {
    test('Simple request', () async {
      when(_mockHttpClient.send(any)).thenAnswer((_) async {
        return response(body: r'''
          {
            "data": {
              "__typename": "Mutation",
              "authUser": {
                "__typename": "User",
                "id": "5ffc93b4f44bfe29dbba99cf",
                "name": "test 1",
                "username": "test 2",
                "gmailAuthMail": "a@b.c",
                "mobile": null,
                "displayPicture": "hsuih.jpg"
              }
            }
          }
        ''');
      });

      final authUser = await (_graphQL.authUser(
          name: 'test 1', email: 'a@b.c', displayPicture: 'hsuih.jpg'));

      expect(authUser?.name, 'test 1');
    });

    test('Invalid token', () async {
      when(_mockHttpClient.send(any)).thenAnswer((_) async {
        // ignore: unnecessary_raw_strings
        return response(body: r'''
          {
            "errors": [
              {
                "message": "Firebase ID token has invalid signature. See https://firebase.google.com/docs/auth/admin/verify-id-tokens for details on how to retrieve an ID token.",
                "extensions": {
                  "code": "UNAUTHORIZED"
                }
              }
            ],
            "data": {
              "__typename": "Mutation",
              "authUser": null
            }
          }
        ''');
      });

      await expectLater(() async {
        await _graphQL.authUser(
            name: 'test 1', email: 'a@b.c', displayPicture: 'hsuih.jpg');
      }, throwsA(isA<GraphQLException>()));
    });
  });

  group('UpdateUser test', () {
    test('Valid token', () async {
      when(_mockHttpClient.send(any)).thenAnswer((_) async {
        // ignore: unnecessary_raw_strings
        return response(body: r'''
          {
            "data": {
              "__typename": "Mutation",
              "updateUser": {
                "__typename": "User",
                "id": "5ffc93b4f44bfe29dbba99cf",
                "name": "test 1",
                "username": "test 3",
                "gmailAuthMail": "a@b.c",
                "mobile": null,
                "displayPicture": null
              }
            }
          }
        ''');
      });
      final authUser = await (_graphQL.updateUser(
          name: 'test 1', username: 'test 3', displayPictureUrl: null));

      expect(authUser?.name, 'test 1');
      expect(authUser?.username, 'test 3');
      expect(authUser?.displayPicture, null);
    });

    test('Valid token', () async {
      when(_mockHttpClient.send(any)).thenAnswer((_) async {
        // ignore: unnecessary_raw_strings
        return response(body: r'''
        {
          "errors": [
            {
              "message": "Decoding Firebase ID token failed. Make sure you passed the entire string JWT which represents an ID token. See https://firebase.google.com/docs/auth/admin/verify-id-tokens for details on how to retrieve an ID token.",
              "extensions": {
                "code": "UNAUTHORIZED"
              }
            }
          ],
          "data": {
            "__typename": "Mutation",
            "updateUser": null
          }
        }
        ''');
      });

      await expectLater(
          _graphQL.updateUser(
              name: 'test 1', username: 'test 3', displayPictureUrl: null),
          throwsA(isA<GraphQLException>()));
    });

    test('Valid token', () async {
      when(_mockHttpClient.send(any)).thenAnswer((_) async {
        // ignore: unnecessary_raw_strings
        return response(body: r'''
        {
          "errors": [
            {
              "message": "Decoding Firebase ID token failed. Make sure you passed the entire string JWT which represents an ID token. See https://firebase.google.com/docs/auth/admin/verify-id-tokens for details on how to retrieve an ID token.",
              "extensions": {
                "code": "UNAUTHORIZED"
              }
            }
          ],
          "data": {
            "__typename": "Mutation",
            "updateUser": null
          }
        }
        ''', status: 403);
      });

      await expectLater(
          _graphQL.updateUser(
              name: 'test 1', username: 'test 3', displayPictureUrl: null),
          throwsA(isA<GraphQLException>()));
    });
  });
}
