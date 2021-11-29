import 'package:dartz/dartz.dart';
import 'package:elaichi/auth/domain/auth_failure.dart';

/// Authentication interface with all possible sign in methods.
// ignore: one_member_abstracts
abstract class IAuthFacade {
  /// A future that returns an [AuthFailure] if the sign in wasn't possible or
  /// returns Unit(void) if it is a success.
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
