import 'package:flutter/material.dart';

/// The Landing Page of the app.
class HomePage extends StatelessWidget {
  /// Constructor for [HomePage].
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
