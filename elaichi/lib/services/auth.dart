import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/logger.dart';
import 'package:elaichi/datamodels/auth_user.dart';
import 'package:elaichi/services/graphql.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:elaichi/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// A single point authentication service
@singleton
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

  /// `_email` and `isVerificationMailSent` is used for meditating email between
  /// [sendVerificationMail] and [verifyAndSignIn]
  String _email;

  /// User info fetched from web endpoint.
  ///
  /// Can be `null` if user hasn't signed in.
  AuthUser get user => _authUser;

  /// Check if the user is signed in sucessfully.
  bool isSignedIn() {
    if (_user == null) {
      return false;
    } else {
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
  Future<void> sendVerificationMail({@required String email}) async {
    await _firebaseAuthService.sendSignInLinkToEmail(email: email);
    _email = email;
  }

  /// `googleSignIn` and `firebaseAuth` can be used to pass the mock instances
  /// for further functions. If not provided then default instances are used.
  void setMockInstances(
      {GoogleSignIn googleSignIn, FirebaseAuth firebaseAuth}) {
    _firebaseAuthService = _FirebaseAuthService(firebaseAuth: firebaseAuth);
    _googleAuthService = _GoogleAuthService(googleSignIn: googleSignIn);
    _firebaseAuth = firebaseAuth;
  }

  /// Opens a dialog which let's the user to signin to their Google account.
  ///
  /// Returns true if user is first time user else returns false.
  ///
  /// In case user first time user, use following code after getting username
  /// ```dart
  /// Auth.signInToWebpoint(username: '', mobile: '');
  /// ```
  Future<bool> signInToGoogleAndIsFirstTimeUser() async {
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
      await signInToWebpoint();
      return false;
    }).catchError((error) {
      return true;
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
  Future<AuthUser> signInToWebpoint({String username, String mobile}) async {
    final graphQl = locator<GraphQL>();
    await graphQl.initGraphQL(getToken: _user.getIdToken);
    final authUser = await graphQl.authUser(
        username: username,
        email: _user.email,
        name: _user.displayName,
        mobile: _user.phoneNumber,
        displayPicture: _user.photoURL);

    // Since web endpoint needs different JWT token after login
    await graphQl.initGraphQL(getToken: () => _user.getIdToken(true));

    _localDb.putValue(LocalDbBoxes.userData, Strings.AUTH_USER_ID, authUser.id);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_NAME, authUser.name);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_USERNAME, authUser.username);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_EMAIL, authUser.gmailAuthMail);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_MOBILE, authUser.mobile);
    _localDb.putValue(
        LocalDbBoxes.userData, Strings.AUTH_USER_DP, authUser.displayPicture);

    return authUser;
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

  /// After retrival of email link from deep link
  ///
  /// *Important:* Call [sendVerificationMail] before calling this function.
  Future<void> verifyAndSignIn({@required String emailLink}) async {
    await _firebaseAuthService.verifyEmailLink(
        email: _email, emailLink: emailLink);
  }
}

/// Handle all the Firebase login related functions
class _FirebaseAuthService {
  
  /// Constructor of [_FirebaseAuthService]
  _FirebaseAuthService({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final Logger _logger = getLogger('Authentication');
  final FirebaseAuth _firebaseAuth;
  User _user;

  /// User details if sign in was successful.
  User get user => _user;

  /// Send email for firebase passwordless login
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
    }).catchError((error, stackTrace) {
      _logger.e(
          'Failed to send verification email since $error', error, stackTrace);
      throw Exception('Failed to send email.');
    });
  }

  /// Sign in user with `credential` (like Google, Twitter, Microsoft)
  Future<User> signInWithCredenials({@required AuthCredential credential}) =>
      _firebaseAuth.signInWithCredential(credential).then((userCredential) {
        _logger.i('Firebase login successful');
        _user = userCredential.user;
        return userCredential.user;
      }).catchError((error, stackTrace) {
        _logger.e('Failed to send verification email', error, stackTrace);
        throw Exception('Unable to sign in with credentials');
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
      }).catchError((error, stackTrace) {
        _logger.e('Email link verification failed', error, stackTrace);
        throw Exception('Login failed');
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
