// ignore_for_file: lines_longer_than_80_chars

import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/services/api.dart';
import 'package:elaichi/ui/views/feed/feed_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(unregisterServices);
  group('FeedViewmodel Test - ', () {
    group('API calls - ', () {
      test(
          'When a list of [CurrenStory] is returned, should assign it to [stories] and should notify listeners',
          () async {
        var called = false;
        final model = FeedViewModel()..addListener(() => called = true);
        final mockApi = locator<Api>();
        when(mockApi.getCurrentStories()).thenAnswer((_) async {
          final list = List<CurrentStory>.generate(
              10,
              (index) => CurrentStory(
                  asset: '',
                  id: '',
                  description: '',
                  event: null,
                  assetType: '',
                  createdAt: null,
                  club: null));
          return list;
        });
        expect(model.currentStories, isNull);
        verify(mockApi.getCurrentStories());
        expect(called, true);
        expect(model.currentStories, isNotNull);
        expect(model.currentStories.length, 10);
      });
      test(
        'When a list of schedule fragments is returned, should assign it to scheduleFragments and should notify listeners',
        () async {
          var called = false;
          final model = FeedViewModel()..addListener(() => called = true);
          final mockApi = locator<Api>();
          when(mockApi.fetchSchedule()).thenAnswer(
            (_) async => List<ScheduleEvent>.generate(
                6,
                (index) => ScheduleEvent(
                  time: '4.30 PM',
                  identifier: 'MA-3002',
                  title: 'Computational Mathematics',
                  contact: 'Prof. Nihar Patra',
                ),
              ),
          );
          expect(model.scheduleEvents, isNull);
          model.getSchedule();
          verify(mockApi.fetchSchedule());
          expect(called, true);
          expect(model.scheduleEvents, isNotNull);
          expect(model.scheduleEvents.length, 6);
        },
      );
    });
  });
}
