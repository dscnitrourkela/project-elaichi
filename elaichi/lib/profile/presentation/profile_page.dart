import 'package:flutter/material.dart';

///The Profile Page
class ProfilePage extends StatelessWidget {
  /// Default constructor
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Test Data'),
      ),
    );
  }
}
