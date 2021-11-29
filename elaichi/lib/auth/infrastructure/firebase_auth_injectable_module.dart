import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

/// A module that injects Firebase service as a third party dependency with
/// injectable.
@module
abstract class FirebaseAuthInjectableModule {
  /// Registers googleSignIn as a lazySingleton.
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  /// Registers firebaseAUth as a lazySingleton.
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
