import 'package:elaichi/core.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/services.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/views.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

class FeedViewModelMock extends Mock implements FeedViewModel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(registerServices);
  group('FeedView - ', () {
    testWidgets('Constructing FeedView renders feed view correctly',
        (WidgetTester tester) async {
      final model = FeedViewModelMock();
      final mockApi = locator<Api>();
      final stories = List<CurrentStory>.generate(
        10,
        (index) => CurrentStory(
          asset: '',
          id: '',
          description: '',
          event: Event(
              announcements: '',
              organizer: Club(
                logo: '',
                society: '',
                clubName: '',
                id: '',
                domain: '',
                facAd: '',
              ),
              endDateTime: '',
              registrationPrice: 20,
              registrationCount: 20,
              link: '',
              otherDescription: '',
              picture: '',
              id: '',
              attendees: [],
              startDateTime: '',
              eventName: ''),
          assetType: '',
          createdAt: DateTime(2021),
          club: Club(
            logo: '',
            society: '',
            clubName: '',
            id: '',
            domain: '',
            facAd: '',
          ),
        ),
      );
      final events = List<ScheduleEvent>.generate(
          4,
          (index) => ScheduleEvent(
              time: 'testTime',
              contact: 'testContact',
              title: 'testTitle',
              identifier: 'test'));
      when(mockApi.fetchSchedule()).thenAnswer((_) async => events);
      when(mockApi.getCurrentStories()).thenAnswer((_) async => stories);
      await tester.runAsync(
        () async {
          await tester.pumpWidget(
            wrappedWidget(
              const FeedView(),
            ),
          );
          await tester.pumpAndSettle();
          await tester.idle();
          model.setInitialised(true);
          await tester.pump();
          expect(find.byType(ElaichiAppbar), findsOneWidget);
        },
      );
    });
  });
}
