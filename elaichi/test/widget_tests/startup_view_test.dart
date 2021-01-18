import 'package:elaichi/ui/views/startup/startup_view.dart';
import 'package:elaichi/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

  // TODO: Implement navigation test - use NavigatorObservers

  // testWidgets("when forward button is tapped, should navigate to home view",
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(Directionality(
  //       textDirection: TextDirection.ltr,
  //       child: MediaQuery(
  //         data: const MediaQueryData(),
  //         child: StartupView(),
  //       )));

  //   final startupViewModel = StartupViewModel();
  //   final homeViewModel = HomeViewModel();

  //   final buttonFinder = find.byIcon(Icons.arrow_forward);

  //   final navigationService = getAndRegisterNavigationServiceMock();

  //   expect(find.text(startupViewModel.title), findsOneWidget);
  //   expect(find.text(homeViewModel.title), findsNothing);
  //   await tester.tap(buttonFinder);
  //   await tester.pumpAndSettle();

  //   expect(find.text(startupViewModel.title), findsNothing);
  //   expect(find.text(homeViewModel.title), findsOneWidget);
  // });
}
