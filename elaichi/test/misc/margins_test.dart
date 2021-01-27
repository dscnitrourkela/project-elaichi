import 'package:elaichi/app/config/display.dart';
import 'package:elaichi/app/config/margins.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Margins - ',
    () {
      test(
        'Margins are 8 for small displays',
        () {
          final margins = Margins(Display(size: DisplaySize.small));
          final marginValue = margins.small;
          expect(marginValue, 8.0);
        },
      );
      test(
        'Margins are 8 for xsmall displays',
        () {
          final margins = Margins(Display(size: DisplaySize.xsmall));
          expect(margins.small, 8.0);
        },
      );
    },
  );
}
