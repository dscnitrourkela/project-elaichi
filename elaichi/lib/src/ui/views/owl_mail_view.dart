import 'package:elaichi/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

/// Invokes native android method to start Owl Mail.
void startOwlMail() async {
  final logger = getLogger('OWl-Mail-');
  const platform = MethodChannel('org.dscnitourkela.elaichi');
  try {
    await platform.invokeMethod('startOwlMail');
  } on PlatformException catch (e) {
    logger.log(Level.info, e.toString());
  }
}

/// Owl Mail UI.
class OwlMailView extends StatelessWidget {
  /// Constructor for OwlMailView.
  const OwlMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async => startOwlMail,
        child: const Text('Start Owl Mail'),
      ),
    );
  }
}
