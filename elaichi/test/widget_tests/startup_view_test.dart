import 'package:elaichi/app/router.gr.dart';
import 'package:elaichi/ui/views/startup/startup_view.dart';
import 'package:elaichi/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(unregisterServices);

  testWidgets('when intialised, should display title and button',
      (WidgetTester tester) async {
    await tester.pumpWidget(wrappedWidget(StartupView()));

    final model = StartupViewModel();

    final titleFinder = find.text(model.title);
    final buttonFinder = find.byIcon(Icons.arrow_forward);

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets(
    'When forward button is tapped, should navigate to home view',
    (WidgetTester tester) async {
      final navigationService = getAndRegisterNavigationServiceMock();
      await tester.pumpWidget(wrappedWidget(StartupView()));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.arrow_forward));
      verify(navigationService.navigateTo(Routes.homeView));
      // await tester.pumpAndSettle();
      // expect(find.byType(ElaichiAppbar), findsOneWidget);
    },
  );
}
