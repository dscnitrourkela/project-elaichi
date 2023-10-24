import 'dart:developer';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:flutter/material.dart';

/// App Page Route for the App.
class AppPageRoute<T> extends MaterialPageRoute<T> {
  /// Construct a MaterialPageRoute whose contents are defined by [builder].
  ///
  /// The values of [builder], [maintainState], and [PageRoute.fullscreenDialog]
  /// must not be null.
  AppPageRoute({
    required WidgetBuilder builder,
    super.settings,
    super.fullscreenDialog,
  }) : super(
          builder: (BuildContext context) {
            log('added ${settings?.name}');
            ToastUtil.getInstance()
                .add(settings?.name ?? 'default-route', context);
            return builder(context);
          },
          maintainState: true,
        ) {
    // ignore: prefer_asserts_with_message
    assert(opaque);
  }

  @override
  void dispose() {
    log('disposing ${settings.name}');
    ToastUtil.getInstance().remove(settings.name ?? 'default-route');
    super.dispose();
  }
}
