import 'package:elaichi/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

///The Browse Page
class BrowsePage extends StatelessWidget {
  /// Default constructor
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Browse'),
      body: Center(
        child: Text('Browse Page'),
      ),
    );
  }
}
