import 'package:elaichi/home/view/home_page.dart';
import 'package:flutter/material.dart';

/// The main app.
class ElaichiApp extends StatelessWidget {
  /// Constructor of [ElaichiApp].
  const ElaichiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Avenue For NITR',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
