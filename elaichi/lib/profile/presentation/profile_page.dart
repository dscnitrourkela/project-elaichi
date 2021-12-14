import 'package:elaichi/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

///The Profile Page
class ProfilePage extends StatelessWidget {
  /// Default constructor
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Profile', context: context),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
