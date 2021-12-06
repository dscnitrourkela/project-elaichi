import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:elaichi/auth/presentation/sign_in_view.dart';
import 'package:flutter/material.dart';

/// The main app.
class ElaichiApp extends StatelessWidget {
  /// Constructor of [ElaichiApp].
  ElaichiApp({Key? key}) : super(key: key);

  /// An instance of [AuthenticationRepository]
  final authenticationRepository = AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avenue For NITR',
      debugShowCheckedModeBanner: false,
      home: SignInPage(
        authenticationRepository: authenticationRepository,
      ),
    );
  }
}
