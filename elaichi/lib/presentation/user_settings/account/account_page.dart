import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

///The Profile Page
class ProfilePage extends StatelessWidget {
  /// Default constructor
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
