import 'package:dartz/dartz.dart';
import 'package:elaichi/core.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/services.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import 'club_viewmodel_test.mocks.dart';

@GenerateMocks([Api, NavigationService])
void main() {
  final clubDetails = Club(
    clubName: 'DesignTab',
    id: '1',
    facAd: 'Prof. ABC',
    society: 'Technical Society',
    domain: 'desgintab.com',
    theme: ViewTheme(
        backgroundColor: '2D3077',
        logo: 'assets/images/dt.png',
        name: 'DesignTab'),
    contactInfo: [],
    description: null,
    members: [],
  );
  final stories = List<CurrentStory>.generate(
    10,
    (index) => CurrentStory(
        asset: '',
        id: '',
        description: '',
        event: null,
        assetType: '',
        createdAt: null,
        club: null),
  );

  final event = Event(
      id: '42',
      organizer: clubDetails,
      eventName: 'Orientation',
      startDateTime: DateTime(2020, 8, 20),
      endDateTime: DateTime(2020, 8, 20),
      registrationPrice: 0,
      registrationCount: 42,
      otherDescription: 'Get to know everything about '
          'DesignTab and why you should be a '
          'part of it.',
      attendees: null,
      announcements: 'None',
      link: 'google.com',
      picture: 'assets/images/dt_1.png',
      location: 'LA-117');
  final failure = Failure(1, 'test failure');
  setUpAll(
    () async {
      // await registerServices();
      clubDetails.events = List<Event>.generate(4, (index) => event);
      final _mockApi = MockApi();
      final _navigationServiceMock = MockNavigationService();
      locator.registerSingleton<Api>(_mockApi);
      locator.registerSingleton<NavigationService>(_navigationServiceMock);
    },
  );
  // tearDown(unregisterServices);

  group(
    'ClubViewmodelTest -',
    () {
      test(
        'initialise viewmodel',
        () async {
          final model = ClubViewModel();
          final mockApi = locator<Api>();

          when(mockApi.fetchClub(clubId: 23)).thenAnswer(
            (_) async => clubDetails,
          );
          when(mockApi.getStoriesByField(clubId: 23)).thenAnswer(
            (_) async => stories,
          );
          await model.initialise(23);
          expect(model.isBusy, false);
          expect(model.club, Right(clubDetails));
          expect(
            model.storiesArchive,
            Right(stories),
          );
        },
      );
    },
  );

  group(
    'API calls -',
    () {
      group(
        'Club -',
        () {
          test(
            'When a [Club] is returned, should assign it to [club] and should '
            'notify listeners',
            () async {
              var called = false;
              final model = ClubViewModel()..addListener(() => called = true);
              final mockApi = locator<Api>();
              when(
                mockApi.fetchClub(clubId: 23),
              ).thenAnswer(
                (_) async => clubDetails,
              );
              expect(model.club, isNull);
              await model.fetchClub(23);
              verify(mockApi.fetchClub(clubId: 23));
              expect(model.club, Right(clubDetails));
              expect(called, true);
            },
          );

          test(
            'when a Failure is returned, should assign it to [club] and '
            'should notify listeners',
            () async {
              var called = false;
              final model = ClubViewModel()
                ..addListener(
                  () => called = true,
                );
              final mockApi = locator<Api>();
              when(
                mockApi.fetchClub(clubId: 23),
              ).thenAnswer(
                ((_) async => throw (failure)),
              );
              expect(model.club, isNull);
              await model.fetchClub(23);
              verify(mockApi.fetchClub(clubId: 23));
              expect(model.club, Left(failure));
              expect(called, true);
            },
          );
        },
      );
      group(
        'Stories -',
        () {
          test(
            'When a list of [CurrentStory] is returned, should assign it to '
            '[storiesArchive] and should notify listeners',
            () async {
              // ignore: unused_local_variable
              var called = false;
              final model = ClubViewModel()
                ..addListener(
                  () => called = true,
                );
              final mockApi = locator<Api>();
              when(
                mockApi.getStoriesByField(clubId: 23),
              ).thenAnswer((realInvocation) async => stories);
              expect(model.storiesArchive, isNull);
              await model.fetchStoriesArchive(23);
              verify(
                mockApi.getStoriesByField(clubId: 23),
              );
              expect(
                model.storiesArchive,
                Right(stories),
              );
              expect(called, true);
            },
          );

          test(
            'when a failure is returned, should assign it to '
            '[storiesArchive] and should notify listeners',
            () async {
              var called = false;
              final model = ClubViewModel()
                ..addListener(() async => called = true);
              final mockApi = locator<Api>();
              when(
                mockApi.getStoriesByField(clubId: 23),
              ).thenAnswer(
                ((_) async => throw (failure)),
              );
              expect(model.storiesArchive, isNull);
              await model.fetchStoriesArchive(23);
              verify(
                mockApi.getStoriesByField(clubId: 23),
              );
              expect(
                model.storiesArchive,
                Left(failure),
              );
              expect(called, true);
            },
          );
        },
      );
    },
  );
}
