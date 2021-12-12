import 'package:dartz/dartz.dart';
import 'package:elaichi/auth/domain/datamodel/user_model.dart';
import 'package:elaichi/auth/domain/repository/auth_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Repository which manages user authentication.
class AuthenticationRepository {
  /// constructor for authentication repository
  AuthenticationRepository({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// Returns the signed in user if any
  Future<Option<User?>> getSignedInUser() async =>
      optionOf<User?>(_firebaseAuth.currentUser);

  /// Handles the sign in process with [FirebaseAuth] and [GoogleSignIn].
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      final googleAuthentication = await googleUser!.authentication;

      final authCrendential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      await _firebaseAuth.signInWithCredential(authCrendential);
      UserData.instance().user = _firebaseAuth.currentUser;
    } on FirebaseException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  /// Logs out the user from the account.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (error) {
      rethrow;
    }
  }
}
