import 'package:elaichi/core.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() {
  setUpAll(() {
    final themeService = ThemeService();
    final navService = NavigationService();
    locator.registerSingleton(themeService);
    locator.registerSingleton(navService);
  });

  group('StartupViewmodelTest -', () {
    group('title - ', () {
      test('When constructed title should not be null', () {
        final model = StartupViewModel();
        expect(model.title, isNotNull);
      });
    });
  });
}
