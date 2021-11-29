import 'package:dartz/dartz.dart';
import 'package:elaichi/auth/domain/auth_failure.dart';
import 'package:elaichi/auth/domain/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@Injectable(as: IAuthFacade)

/// A class for [FirebaseAuth] Service that implements [IAuthFacade]
class FirebaseAuthFacade implements IAuthFacade {
  /// Constructor for [FirebaseAuthFacade].
  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;

      final authCrendential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );

      return _firebaseAuth
          .signInWithCredential(authCrendential)
          .then((value) => right(unit));
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }
}
