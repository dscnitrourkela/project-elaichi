import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

///The Mail Page
class MailPage extends StatelessWidget {
  /// Default constructor
  const MailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Zimbra'),
      body: Center(
        child: Text('Zimbra Mail Page'),
      ),
    );
  }
}
