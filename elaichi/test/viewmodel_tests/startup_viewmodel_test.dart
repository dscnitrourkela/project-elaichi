import 'package:elaichi/app/router.gr.dart';
import 'package:elaichi/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(unregisterServices);
  group('StartupViewmodelTest -', () {
    group('title - ', () {
      test('When constructed title should not be null', () {
        final model = StartupViewModel();
        expect(model.title != null, true);
      });
    });

    group('navigateToHome -', () {
      test('When called, should navigate to HomeView', () async {
        final navigation = getAndRegisterNavigationServiceMock();
        final model = StartupViewModel();
        await model.navigateToHome();
        verify(navigation.navigateTo(Routes.homeView));
      });
    });

    group('changeTheme -', () {
      test('When called, should call ThemeManager.changeTheme', () {
        final themeService = getAndRegisterThemeServiceMock();
        final model = StartupViewModel()
          ..changeTheme();
        verify(themeService.toggleDarkLightTheme());
      });
    });
  });
}
