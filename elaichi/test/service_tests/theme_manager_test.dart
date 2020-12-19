import 'package:elaichi/services/theme_manager.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(() => unregisterServices());
  group('ThemeManagerTest -', () {
    test(
        'When constructed for first time isCurrentThemeDark should return true -',
        () {
      final themeManager = ThemeManager();
      expect(themeManager.isCurrentThemeDark, true);
    });

    test('When changeTheme is called stream should emit non-null BaseTheme',
        () {
      final themeManager = ThemeManager();
      themeManager.changeTheme();
      expect(themeManager.theme, emits(isNotNull));
    });

    test('When changeTheme is called isCurrentThemeDark changes', () {
      final themeManager = ThemeManager();
      final isDark = themeManager.isCurrentThemeDark;
      themeManager.changeTheme();
      expect(themeManager.isCurrentThemeDark != isDark, true);
    });
  });
}
