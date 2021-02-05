// ignore_for_file: lines_longer_than_80_chars
import 'package:dartz/dartz.dart';
import 'package:elaichi/core.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/services.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(unregisterServices);
  group('FeedViewmodel Test - ', () {
    test(
      'Intialise -',
      () async {
        final model = FeedViewModel();
        final mockApi = locator<Api>();
        final stories = List<CurrentStory>.generate(
          10,
          (index) => CurrentStory(
            asset: '',
            id: '',
            description: '',
            event: null,
            assetType: '',
            createdAt: null,
            club: null,
          ),
        );
        when(mockApi.getCurrentStories()).thenAnswer((_) async => stories);
        final events = List<ScheduleEvent>.generate(
          6,
          (index) => ScheduleEvent(
            time: '4.30 PM',
            identifier: 'MA-3002',
            title: 'Computational Mathematics',
            contact: 'Prof. Nihar Patra',
          ),
        );
        when(mockApi.fetchSchedule()).thenAnswer(
          (_) async => events,
        );
        await model.initialise();
        expect(model.isBusy, false);
        expect(model.currentStories, Right(stories));
      },
    );
    group('API calls - ', () {
      group('Stories', () {
        test(
            'When a list of [CurrenStory] is returned, should assign it to [stories] and should notify listeners',
            () async {
          var called = false;
          final model = FeedViewModel()..addListener(() => called = true);
          final mockApi = locator<Api>();
          final stories = List<CurrentStory>.generate(
              10,
              (index) => CurrentStory(
                  asset: '',
                  id: '',
                  description: '',
                  event: null,
                  assetType: '',
                  createdAt: null,
                  club: null));
          when(mockApi.getCurrentStories()).thenAnswer((_) async => stories);
          expect(model.currentStories, isNull);
          await model.fetchCurrentStories();
          verify(mockApi.getCurrentStories());
          expect(model.currentStories, Right(stories));
          expect(called, true);
        });

        test(
            'When a Failure is returned, should assign it to [stories] and should notify listeners',
            () async {
          var called = false;
          final model = FeedViewModel()..addListener(() => called = true);
          final mockApi = locator<Api>();
          final failure = Failure(1, 'test failure');
          when(mockApi.getCurrentStories())
              .thenAnswer((_) async => throw (failure));
          expect(model.currentStories, isNull);
          await model.fetchCurrentStories();
          verify(mockApi.getCurrentStories());
          expect(model.currentStories, Left(failure));
          expect(called, true);
        });
      });
      test(
        'When a list of schedule fragments is returned, should assign it to scheduleFragments and should notify listeners',
        () async {
          var called = false;
          final model = FeedViewModel()..addListener(() => called = true);
          final mockApi = locator<Api>();
          final events = List<ScheduleEvent>.generate(
            6,
            (index) => ScheduleEvent(
              time: '4.30 PM',
              identifier: 'MA-3002',
              title: 'Computational Mathematics',
              contact: 'Prof. Nihar Patra',
            ),
          );
          when(mockApi.fetchSchedule()).thenAnswer(
            (_) async => events,
          );
          expect(model.scheduleEvents, isNull);
          await model.getSchedule();
          verify(mockApi.fetchSchedule());
          expect(model.scheduleEvents, Right(events));
          expect(called, true);
        },
      );
    });
  });
}
