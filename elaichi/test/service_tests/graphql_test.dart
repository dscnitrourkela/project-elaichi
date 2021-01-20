import 'dart:io';

import 'package:elaichi/datamodels/auth_user.dart';
import 'package:elaichi/services/graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../setup/http_helpers.dart';
import '../setup/test_helpers.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  final GraphQL _graphQL = GraphQL();
  final MockHttpClient _mockHttpClient = MockHttpClient();

  setUp(() async {
    await registerServices();

    final directory = await Directory.systemTemp.createTemp();
    final store = await HiveStore.open(path: directory.path);

    await _graphQL.initGraphQL(
        getToken: () async {
          return 'dummy token';
        },
        httpClient: _mockHttpClient,
        hiveStore: store);
  });
  tearDown(() {
    unregisterServices();
    _graphQL.removeClient();
  });

  group("AuthUser test -", () {
    test("Simple request", () async {
      when(_mockHttpClient.send(any)).thenAnswer((_) async {
        // ignore: unnecessary_raw_strings
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

      final AuthUser authUser = await _graphQL.authUser(
          username: "test 2",
          name: "test 1",
          mobile: "+91",
          email: "a@b.c",
          displayPicture: "hsuih.jpg");

      expect(authUser.name, "test 1");
    });

    test("Invalid token", () async {
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

      expectLater(() async {
        await _graphQL.authUser(
            username: "test 2",
            name: "test 1",
            mobile: "+91",
            email: "a@b.c",
            displayPicture: "hsuih.jpg");
      }, throwsA(isA<GraphQLException>()));
    });
  });
}
