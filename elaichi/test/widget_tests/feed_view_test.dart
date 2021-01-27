import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/services/api.dart';
import 'package:elaichi/ui/views/feed/feed_view.dart';
import 'package:elaichi/ui/views/feed/feed_viewmodel.dart';
import 'package:elaichi/ui/widgets/appbar.dart';
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
