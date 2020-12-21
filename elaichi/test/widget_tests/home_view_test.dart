import 'package:elaichi/ui/views/home/home_view.dart';
import 'package:elaichi/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(() => unregisterServices());

  testWidgets('when initialised, should display message with counter set to 0',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(),
          child: HomeView(),
        )));

    final model = HomeViewModel();

    final titleFinder = find.text(model.title);
    final counterTextFinder = find.text('0');
    final buttonFinder = find.byIcon(Icons.add);

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(counterTextFinder, findsOneWidget);
  });

  testWidgets("when '+' button is tapped, should update counter",
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(),
          child: HomeView(),
        )));

    final buttonFinder = find.byIcon(Icons.add);

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(buttonFinder);
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
