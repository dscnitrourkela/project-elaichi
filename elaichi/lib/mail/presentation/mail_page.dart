import 'package:elaichi/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

///The Mail Page
class MailPage extends StatelessWidget {
  /// Default constructor
  const MailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Zimbra', context: context),
      body: const Center(
        child: Text('Zimbra Mail Page'),
      ),
    );
  }
}
