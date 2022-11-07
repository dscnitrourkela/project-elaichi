import 'dart:async';

import 'package:elaichi/data/local/local_storage_service.dart';
import 'package:elaichi/data/remote/api_service.dart';
import 'package:elaichi/data/remote/graphql/graphql_service.dart';
import 'package:elaichi/domain/exceptions/auth_failure.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Repository which manages user authentication.
class UserRepository {
  /// Constructor for authentication repository
  UserRepository({
    required LocalStorageService localStorageService,
    required APIService apiService,
  })  : _apiService = apiService,
        _localStorageService = localStorageService,
        _firebaseAuth = firebase_auth.FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn.standard() {
    setRollNumber();
  }

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final LocalStorageService _localStorageService;
  final APIService _apiService;
  final GraphQLService _graphQLService = GraphQLService();

  String? rollNumber;

  String? zsToken;

  firebase_auth.User get firebaseUser => _firebaseAuth.currentUser!;

  /// Handles the sign in process with [firebase_auth.FirebaseAuth] and [GoogleSignIn].
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      final googleAuthentication = await googleUser!.authentication;

      final authCrendential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      await _firebaseAuth.signInWithCredential(authCrendential);

      await initializeGraphQL();
    } on firebase_auth.FirebaseException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithGoogleFailure();
    }
  }

  Future<void> googleAuthenticated() async {
    try {
      await initializeGraphQL();
      await logInToWebMail();
      await getUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initializeGraphQL() async {
    try {
      final token = await _firebaseAuth.currentUser!.getIdToken(true);

      firebaseToken = token;

      await _graphQLService.init(token);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getUser() async {
    try {
      final user =
          await _graphQLService.getUser(_firebaseAuth.currentUser!.uid);

      _localStorageService.currentUser = user;

      if (user.college == 'National Institute of Technology, Rourkela' &&
          user.rollNumber != null) {
        _localStorageService.rollNumber = user.rollNumber;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getOrCreateUser() async {
    try {
      if (user == null) {
        final fbUser = _firebaseAuth.currentUser;
        await getUser();

        if (user == null) {
          await createUser(
            uid: fbUser!.uid,
            email: fbUser.email!,
            name: fbUser.displayName!,
            photo: fbUser.photoURL,
            rollNumber: rollNumber!,
            college: 'National Institute of Technology, Rourkela',
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createUser({
    required String uid,
    required String email,
    required String name,
    required String rollNumber,
    required String college,
    String? photo,
  }) async {
    try {
      final user = await _graphQLService.createUser(
        uid: uid,
        email: email,
        name: name,
        photo: photo,
        rollNumber: rollNumber,
        college: college,
      );

      _localStorageService.currentUser = user;
    } catch (e) {
      rethrow;
    }
  }

  User? get user => _localStorageService.currentUser;

  Stream<firebase_auth.User?> get firebaseAuthStream {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> saveWebMailDetails({
    required String rollNumber,
    required String password,
  }) async {
    _localStorageService.saveWebMailDetails(
      rollNumber: rollNumber,
      password: password,
    );
    this.rollNumber = rollNumber;
  }

  Future<void> logInToWebMail({String? rollNumber, String? password}) async {
    final roll = rollNumber ?? _localStorageService.rollNumber;
    final pass = password ?? _localStorageService.password;
    if (roll != null && pass != null) {
      try {
        final result = await _apiService.logInToWebMail(
          rollNumber: roll,
          password: pass,
        );
        zsToken = result;

        if (rollNumber != null) {
          await saveWebMailDetails(
            rollNumber: roll,
            password: pass,
          );
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        rethrow;
      }
    }
  }

  void setRollNumber() {
    rollNumber = _localStorageService.rollNumber;
  }

  set firebaseToken(String token) => _localStorageService.firebaseToken = token;

  String get firebaseToken => _localStorageService.firebaseToken;

  void deleteWebMailDetails() {
    zsToken = null;
    rollNumber = null;
    _localStorageService.deleteWebmailDetails();
  }

  /// Logs out the user from the account.
  Future<void> appLogOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      deleteWebMailDetails();
    } catch (error) {
      rethrow;
    }
  }
}
