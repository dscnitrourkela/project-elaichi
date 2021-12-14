import 'package:elaichi/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

///The Browse Page
class BrowsePage extends StatelessWidget {
  /// Default constructor
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Browse', context: context),
      body: const Center(
        child: Text('Browse Page'),
      ),
    );
  }
}
