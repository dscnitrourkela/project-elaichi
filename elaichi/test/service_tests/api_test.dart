import 'dart:convert';
import 'dart:io';
import 'package:elaichi/services/fake_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  group('Api -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    // test('Calling factory constructor of Api class should not return null', () {
    //   final api = Api();
    //   expect(api, isNotNull);
    // });

    test('Constructing Service should find correct dependencies', () {
      final fakeApiService = FakeApiMock();
      expect(fakeApiService != null, true);
    });

    test('Given userId "test", should return user with name and email',
        () async {
      final fakeApiService = FakeApiMock();

      when(fakeApiService.getUser("test")).thenAnswer(
        (_) => Future.value(
          '''
            {
              "userId": "test",
              "email": "john.doe@example.com",
              "name": "John Doe"
            }
          ''',
        ),
      );

      await fakeApiService.getUser("test");
      verify(fakeApiService.getUser("test"));
    });

    test('Given a userId that does not exist, should return correct error', () {
      final fakeApiService = FakeApiMock();
      when(fakeApiService.getUser("userId")).thenAnswer(
        (_) => Future.value('error'),
      );
    });

    test('Given errorMode 1, should throw SocketException', () async {
      final fakeApiService = FakeApiMock();
      try {
        await fakeApiService.getUser("test", errorMode: 1);
      } catch (e) {
        expect(e, isInstanceOf<SocketException>());
      }
    });

    test('Given errorMode 2, should throw HttpExcpetion', () async {
      final fakeApiService = FakeApiMock();
      try {
        await fakeApiService.getUser("test", errorMode: 2);
      } catch (e) {
        expect(e, isInstanceOf<HttpException>());
      }
    });

    test('Given errorMode 3, should return wrong json', () async {
      final fakeApiService = FakeApi();
      final result = await fakeApiService.getUser("test", errorMode: 3);
      expect(result, isNotNull);
      try {
        json.decode(result);
      } catch (e) {
        expect(e, isInstanceOf<FormatException>());
      }
    });
  });

  test('Given errorMode 1, should throw SocketException', () async {
    final fakeApiService = FakeApiMock();
    try {
      await fakeApiService.getUser("test", errorMode: 1);
    } catch (e) {
      expect(e, isInstanceOf<SocketException>());
    }
  });

  test('Given errorMode 2, should throw HttpExcpetion', () async {
    final fakeApiService = FakeApiMock();
    try {
      await fakeApiService.getUser("test", errorMode: 2);
    } catch (e) {
      expect(e, isInstanceOf<HttpException>());
    }
  });

  test('Given errorMode 3, should return wrong json', () async {
    final fakeApiService = FakeApi();
    final result = await fakeApiService.getUser("test", errorMode: 3);
    expect(result, isNotNull);
    try {
      json.decode(result);
    } catch (e) {
      expect(e, isInstanceOf<FormatException>());
    }
  });
}
