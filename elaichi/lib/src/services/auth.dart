import 'package:elaichi/core.dart';
import 'package:elaichi/datamodels.dart' hide User;
import 'package:elaichi/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
// import 'graphql.dart';
// import 'local_db.dart';

/// A single point authentication service
@lazySingleton
class Auth {
  /// Contructor for [Auth].
  Auth() {
    _firebaseAuth = FirebaseAuth.instance;
    _googleAuthService = _GoogleAuthService();
    _firebaseAuthService = _FirebaseAuthService(firebaseAuth: _firebaseAuth);

    _localDb.openBox(LocalDbBoxes.userData);
  }

  final Logger _logger = getLogger('Auth Service');
  final LocalDb _localDb = locator<LocalDb>();

  FirebaseAuth _firebaseAuth;

  // Create default instances of _GoogleAuthService and _FirebaseAuthService
  // for in app use.
  _GoogleAuthService _googleAuthService;
  _FirebaseAuthService _firebaseAuthService;

  User _user;
  AuthUser _authUser;

  /// `_email` is used for meditating email between [sendVerificationMail] and
  /// [verifyAndSignIn]
  String _email;

  /// User info fetched from web endpoint.
  ///
  /// Can be `null` if user hasn't signed in.
  AuthUser get user => _authUser;

  /// Check if the user is signed
  bool isSignedIn() {
    _user = _firebaseAuthService.user;
    if (_user == null) {
      return false;
    } else if (_authUser == null) {
      final id = _localDb.getValue(LocalDbBoxes.userData, Strings.AUTH_USER_ID);
      final name =
          _localDb.getValue(LocalDbBoxes.userData, Strings.AUTH_USER_NAME);
      final username =
          _localDb.getValue(LocalDbBoxes.userData, Strings.AUTH_USER_USERNAME);
      final email =
          _localDb.getValue(LocalDbBoxes.userData, Strings.AUTH_USER_EMAIL);
      final mobile =
          _localDb.getValue(LocalDbBoxes.userData, Strings.AUTH_USER_MOBILE);
      final dp = _localDb.getValue(LocalDbBoxes.userData, Strings.AUTH_USER_DP);

      _authUser = AuthUser(
          id: id,
          name: name,
          username: username,
          gmailAuthMail: email,
          mobile: mobile,
          displayPicture: dp);
      return true;
    } else {
      return true;
    }
  }

  /// Send passwordless verification email to user. Call [verifyAndSignIn] after
  /// retriving email link from deep links.
  ///
  /// Use following code in a [StatefulWidget] to retrieve email link
  /// ```dart
  /// @override
  /// void didChangeAppLifecycleState(AppLifecycleState state) {
  ///   if (state == AppLifecycleState.resumed) {
  ///     emailLink = retrieveEmailLink();
  ///     Auth.verifyAndSignIn(emailLink: emailLink);
  ///   }
  /// }
  /// ```
  ///
  /// A [FirebaseAuthException] maybe thrown with the following error code:
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **user-not-found**:
  ///  - Thrown if there is no user corresponding to the email address.
  Future<void> sendVerificationMail({@required String email}) async {
    await _firebaseAuthService.sendSignInLinkToEmail(email: email);
    _email = email;
  }

  /// `googleSignIn` and `firebaseAuth` can be used to pass the mock instances
  /// for further functions. If not provided then default instances are used.
  void setMockInstances(
      {GoogleSignIn googleSignIn, FirebaseAuth firebaseAuth}) {
    _firebaseAuth = firebaseAuth;
    _firebaseAuthService = _FirebaseAuthService(firebaseAuth: firebaseAuth);
    _googleAuthService = _GoogleAuthService(googleSignIn: googleSignIn);
  }

  /// Opens a dialog which let's the user to signin to their Google account.
  ///
  /// Throws [Exception], [GraphQLException] and [FirebaseAuthException]
  /// with error codes like:
  /// - `Exception('Signin process was aborted')`
  ///   - Thrown if user aborts signin process.
  /// - `GraphQLException` - `Strings.HTTP_ERROR`:
  ///   - Thrown if the HTTP response status is != 200
  /// - `GraphQLException` - `Strings.GRAPHQL_ERROR`:
  ///   - Thrown if GraphQL response contains 'errors' or
  ///    response.hasException == true, eg. `CacheError`.
  /// - `FirebaseAuthException` - `user-disable`:
  ///   - Thrown if user is disabled from firebase.
  Future<void> signIn() async {
    await _signInToGoogle().then((_) => _signInToWebpoint());
  }

  /// Sign out from all the accounts
  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
    await _googleAuthService.signOut();
    _authUser = null;
    _user = null;
    _localDb.deleteValue(LocalDbBoxes.userData, Strings.AUTH_USER_ID);
    _localDb.deleteValue(LocalDbBoxes.userData, Strings.AUTH_USER_NAME);
    _localDb.deleteValue(LocalDbBoxes.userData, Strings.AUTH_USER_USERNAME);
    _localDb.deleteValue(LocalDbBoxes.userData, Strings.AUTH_USER_EMAIL);
    _localDb.deleteValue(LocalDbBoxes.userData, Strings.AUTH_USER_MOBILE);
    _localDb.deleteValue(LocalDbBoxes.userData, Strings.AUTH_USER_DP);
    final _graphQL = locator<GraphQL>();
    _graphQL.removeClient();
  }

  /// Updates user info on web endpoint.
  ///
  /// Throws [GraphQLException] with error codes like:
  /// - `GraphQLException` - `Strings.HTTP_ERROR`:
  ///   - Thrown if the HTTP response status is != 200
  /// - `GraphQLException` - `Strings.GRAPHQL_ERROR`:
  ///   - Thrown if GraphQL response contains 'errors' or
  ///    response.hasException == true, eg. `CacheError`.
  Future<void> updateUser(
      {String name,
      String username,
      String mobile,
      String instituteId,
      String emergencyContact,
      String displayPictureUrl}) async {
    final graphQl = locator<GraphQL>();
    _authUser = await graphQl.updateUser(
        name: name,
        username: username,
        mobile: mobile,
        instituteId: instituteId,
        emergencyContact: emergencyContact,
        displayPictureUrl: displayPictureUrl);

    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_ID, _authUser.id);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_NAME, _authUser.name);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_USERNAME, _authUser.username);
    _localDb.putValue(LocalDbBoxes.userData, Strings.AUTH_USER_EMAIL,
        _authUser.gmailAuthMail);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_MOBILE, _authUser.mobile);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_DP, _authUser.displayPicture);

    return _authUser;
  }

  /// After retrival of email link from deep link
  ///
  /// *Important:* Call [sendVerificationMail] before calling this function.
  Future<void> verifyAndSignIn({@required String emailLink}) async {
    await _firebaseAuthService.verifyEmailLink(
        email: _email, emailLink: emailLink);
  }

  /// Opens a dialog which let's the user to signin to their Google account.
  Future<void> _signInToGoogle() async {
    _firebaseAuth.authStateChanges().listen((User user) {
      if (user == null) {
        _logger.i('Sign out due to authStateChanges');
        signOut();
      }
    });

    final credential = await _googleAuthService.signIn();
    return _firebaseAuthService
        .signInWithCredenials(credential: credential)
        .then((user) async {
      _user = user;
    });
  }

  /// Sign in or sign up to the GraphQL webpoint.
  ///
  /// Throws [GraphQLException] with error code:
  /// - **Strings.HTTP_ERROR**:
  ///  - Thrown if the HTTP response status is != 200
  /// - **Strings.GRAPHQL_ERROR**:
  ///  - Thrown if GraphQL response contains 'errors' or
  ///    response.hasException == true, eg. `CacheError`.
  Future<AuthUser> _signInToWebpoint() async {
    final graphQl = locator<GraphQL>();
    await graphQl.initGraphQL(getToken: _user.getIdToken);
    _authUser = await graphQl.authUser(
        email: _user.email,
        name: _user.displayName,
        displayPicture: _user.photoURL);

    // Since web endpoint needs different JWT token after login
    await graphQl.initGraphQL(getToken: () => _user.getIdToken(true));

    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_ID, _authUser.id);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_NAME, _authUser.name);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_USERNAME, _authUser.username);
    _localDb.putValue(LocalDbBoxes.userData, Strings.AUTH_USER_EMAIL,
        _authUser.gmailAuthMail);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_MOBILE, _authUser.mobile);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_DP, _authUser.displayPicture);

    return _authUser;
  }
}

/// Handle all the Firebase login related functions
class _FirebaseAuthService {
  /// Constructor of [_FirebaseAuthService]
  _FirebaseAuthService({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final Logger _logger = getLogger('Authentication');
  final FirebaseAuth _firebaseAuth;

  /// User details if sign in was successful.
  User get user => _firebaseAuth.currentUser;

  /// Send email for firebase passwordless login
  ///
  /// A [FirebaseAuthException] maybe thrown with the following error code:
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **user-not-found**:
  ///  - Thrown if there is no user corresponding to the email address.
  Future<void> sendSignInLinkToEmail({@required String email}) {
    final actionCodeSettings = ActionCodeSettings(
        url: Strings.BASE_URL,
        dynamicLinkDomain: Strings.DYNAMIC_LINK_DOMAIN,
        androidPackageName: Strings.PACKAGE_NAME,
        androidInstallApp: true,
        androidMinimumVersion: '16',
        iOSBundleId: Strings.IOS_BUNDLE_ID,
        handleCodeInApp: true);

    return _firebaseAuth
        .sendSignInLinkToEmail(
            email: email, actionCodeSettings: actionCodeSettings)
        .then((_) {
      _logger.i('Verification email sent');
    });
  }

  /// Sign in user with `credential` (like Google, Twitter, Microsoft)
  Future<User> signInWithCredenials({@required AuthCredential credential}) =>
      _firebaseAuth.signInWithCredential(credential).then((userCredential) {
        _logger.i('Firebase login successful');
        return userCredential.user;
      });

  Future<void> signOut() => _firebaseAuth.signOut();

  /// Verify the retrieved link is valid. The email should be same as provided
  /// to [sendSignInLinkToEmail]
  Future<User> verifyEmailLink(
      {@required String email, @required String emailLink}) {
    if (_firebaseAuth.isSignInWithEmailLink(emailLink)) {
      return _firebaseAuth
          .signInWithEmailLink(email: email, emailLink: emailLink)
          .then((userCredential) {
        _logger.i('Login with email link successful');
        return userCredential.user;
      });
    } else {
      _logger.i('Email link provided is not a firebase email link');
      throw Exception('Login failed');
    }
  }
}

/// Google Authentication manager
class _GoogleAuthService {
  /// Contructor of Service
  _GoogleAuthService({GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn {
    _googleSignIn ??= GoogleSignIn();
  }

  GoogleSignIn _googleSignIn;

  /// Signin by creating a google interactive dialog
  Future<AuthCredential> signIn() async {
    final googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) {
      throw Exception('Signin process was aborted');
    }
    final googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    return credential;
  }

  /// Sign out from google
  Future<GoogleSignInAccount> signOut() => _googleSignIn.signOut();
}
