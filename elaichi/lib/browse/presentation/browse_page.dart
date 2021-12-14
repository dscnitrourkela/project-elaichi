import 'package:flutter/material.dart';

///The Browse Page
class BrowsePage extends StatelessWidget {
  /// Default constructor
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse'),
      ),
      body: const Center(
        child: Text('Test Data'),
      ),
    );
  }
}
