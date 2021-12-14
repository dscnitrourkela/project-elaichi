import 'package:flutter/material.dart';

///The Mail Page
class MailPage extends StatelessWidget {
  /// Default constructor
  const MailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail'),
      ),
      body: const Center(
        child: Text('Test Data'),
      ),
    );
  }
}
