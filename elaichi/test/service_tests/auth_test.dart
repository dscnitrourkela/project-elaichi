import 'package:elaichi/datamodels/auth_user.dart';
import 'package:elaichi/services/graphql.dart';
import 'package:elaichi/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elaichi/services/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

import '../setup/firebase_test_setup.dart';
import '../setup/test_helpers.dart';

// ignore_for_file: avoid_redundant_argument_values

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockUserCredential extends Mock implements UserCredential {}

// ignore: avoid_implementing_value_types
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockAuthCredential extends Mock implements AuthCredential {}

class MockUser extends Mock implements User {}

void main() {
  final MockFirebaseAuth _firebaseAuthMock = MockFirebaseAuth();
  final MockGoogleSignIn _googleSignInMock = MockGoogleSignIn();
  final AuthUser _mockAuthUser = AuthUser(
      id: "dummy id",
      name: "dummy name",
      username: "dummy username",
      mobile: "dummy mobile");
  final User _mockUser = MockUser();
  final UserCredential _mockUserCredential = MockUserCredential();

  GraphQL _graphQL;
  Auth _auth;

  setUpAll(() async {
    getAndRegisterLocalDbMock();
    _graphQL = getAndRegisterGraphQLMock();

    setupFirebaseAuthMocks();
    await Firebase.initializeApp();
    when(_firebaseAuthMock.authStateChanges())
        .thenAnswer((_) => Stream.value(_mockUser));
  });
  tearDownAll(() => unregisterServices());

  group("General properties - ", () {
    group("If not logged in - ", () {
      test("isSignedIn()", () {
        _auth = Auth();
        _auth.setMockInstances(
            firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

        expect(_auth.isSignedIn(), false);
      });

      test("Auth.user", () {
        _auth = Auth();
        _auth.setMockInstances(
            firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

        expect(_auth.user, isNull);
      });
    });

    // isSignedIn with signed in state is tested in signInWithGoogle() successfully.

    test("signOut()", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      await _auth.signOut();
      verify(_firebaseAuthMock.signOut());
      verify(_googleSignInMock.signOut());
    });
  });

  group("Passwordless signin test - ", () {
    test("sentVerificationMail() with valid email", () async {
      const String mockEmail = "ankesh@anku.com";
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      when(_firebaseAuthMock.sendSignInLinkToEmail(
              email: mockEmail,
              actionCodeSettings: captureAnyNamed('actionCodeSettings')))
          .thenAnswer((_) => Future.value(null));
      await _auth.sendVerificationMail(email: mockEmail);

      final capturedArgument = verify(_firebaseAuthMock.sendSignInLinkToEmail(
              email: mockEmail,
              actionCodeSettings: captureAnyNamed('actionCodeSettings')))
          .captured[0];
      expect(capturedArgument, isA<ActionCodeSettings>());
      expect(capturedArgument.url, Strings.BASE_URL);
      expect(capturedArgument.handleCodeInApp, true);
      expect(capturedArgument.dynamicLinkDomain, Strings.DYNAMIC_LINK_DOMAIN);
    });

    test("sentVerificationMail() with invalid email", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      const String mockEmail = "aa.com";
      when(_firebaseAuthMock.sendSignInLinkToEmail(
              email: mockEmail,
              actionCodeSettings: captureAnyNamed('actionCodeSettings')))
          .thenAnswer((_) => throw FirebaseAuthException(
              message: "Thrown if the email address is not valid",
              code: "invalid-email"));

      expectLater(() => _auth.sendVerificationMail(email: mockEmail),
          throwsA(isA<FirebaseAuthException>()));

      final ActionCodeSettings capturedArgument = verify(
              _firebaseAuthMock.sendSignInLinkToEmail(
                  email: mockEmail,
                  actionCodeSettings: captureAnyNamed('actionCodeSettings')))
          .captured[0] as ActionCodeSettings;
      expect(capturedArgument.url, Strings.BASE_URL);
      expect(capturedArgument.handleCodeInApp, true);
      expect(capturedArgument.dynamicLinkDomain, Strings.DYNAMIC_LINK_DOMAIN);
    });

    test("verifyAndSignIn() with valid link", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      const mockEmail = "ankesh@anku.com";

      when(_firebaseAuthMock.sendSignInLinkToEmail(
              email: mockEmail,
              actionCodeSettings: anyNamed("actionCodeSettings")))
          .thenAnswer((_) => Future.value(null));
      when(_firebaseAuthMock.isSignInWithEmailLink(any))
          .thenAnswer((_) => true);
      when(_firebaseAuthMock.signInWithEmailLink(
              email: anyNamed("email"), emailLink: anyNamed("emailLink")))
          .thenAnswer((_) => Future.value(_mockUserCredential));

      await _auth.sendVerificationMail(email: mockEmail);
      await _auth.verifyAndSignIn(emailLink: "DummyLink");

      verify(_firebaseAuthMock.sendSignInLinkToEmail(
              email: anyNamed("email"),
              actionCodeSettings: anyNamed("actionCodeSettings")))
          .called(1);
      verify(_firebaseAuthMock.isSignInWithEmailLink(any)).called(1);
      verify(_firebaseAuthMock.signInWithEmailLink(
              email: anyNamed("email"), emailLink: anyNamed("emailLink")))
          .called(1);
    });

    test(
        "sendSignInLinkToEmail() throws error, THEN verifyAndSignIn() with invalid link",
        () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      const mockEmail = "ankesh@anku.com";

      when(_firebaseAuthMock.sendSignInLinkToEmail(
              email: mockEmail,
              actionCodeSettings: anyNamed("actionCodeSettings")))
          .thenAnswer((_) => throw FirebaseAuthException(
              message: "Thrown if the email address is not valid",
              code: "invalid-email"));
      when(_firebaseAuthMock.isSignInWithEmailLink(any))
          .thenAnswer((_) => true);
      when(_firebaseAuthMock.signInWithEmailLink(
              email: anyNamed("email"), emailLink: anyNamed("emailLink")))
          .thenAnswer((_) => Future.value(_mockUserCredential));

      expectLater(() => _auth.sendVerificationMail(email: mockEmail),
          throwsA(isA<FirebaseAuthException>()));
    });

    test("verifyAndSignIn() with invalid link", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      const mockEmail = "ankesh@anku.com";

      when(_firebaseAuthMock.sendSignInLinkToEmail(
              email: mockEmail,
              actionCodeSettings: anyNamed("actionCodeSettings")))
          .thenAnswer((_) => Future.value(null));
      when(_firebaseAuthMock.isSignInWithEmailLink(any))
          .thenAnswer((_) => false);
      when(_firebaseAuthMock.signInWithEmailLink(
              email: anyNamed("email"), emailLink: anyNamed("emailLink")))
          .thenAnswer((_) => Future.value(_mockUserCredential));

      await _auth.sendVerificationMail(email: mockEmail);

      expectLater(() => _auth.verifyAndSignIn(emailLink: "DummyLink"),
          throwsA(isA<Exception>()));
    });

    test("verifyAndSignIn() with expired link", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      const mockEmail = "ankesh@anku.com";

      when(_firebaseAuthMock.sendSignInLinkToEmail(
              email: mockEmail,
              actionCodeSettings: anyNamed("actionCodeSettings")))
          .thenAnswer((_) => Future.value(null));
      when(_firebaseAuthMock.isSignInWithEmailLink(any))
          .thenAnswer((_) => true);
      when(_firebaseAuthMock.signInWithEmailLink(
              email: anyNamed("email"), emailLink: anyNamed("emailLink")))
          .thenAnswer((_) => throw FirebaseAuthException(
              code: "expired-action-code",
              message: "Thrown if OTP in email link expires"));

      await _auth.sendVerificationMail(email: mockEmail);

      expectLater(() => _auth.verifyAndSignIn(emailLink: "DummyLink"),
          throwsA(isA<FirebaseAuthException>()));
    });
  });

  group("Google Signin - ", () {
    test("signInWithGoogle() successfully", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      final GoogleSignInAccount mockGoogleSignInAccount =
          MockGoogleSignInAccount();
      final GoogleSignInAuthentication mockGoogleSignInAuthentication =
          MockGoogleSignInAuthentication();

      when(_googleSignInMock.signIn())
          .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));
      when(mockGoogleSignInAuthentication.idToken)
          .thenAnswer((_) => "Dummy Token");
      when(mockGoogleSignInAuthentication.accessToken)
          .thenAnswer((_) => "Access Token");
      when(_firebaseAuthMock.signInWithCredential(captureAny))
          .thenAnswer((_) => Future.value(_mockUserCredential));
      when(_mockUserCredential.user).thenAnswer((_) => _mockUser);
      when(_mockUser.getIdToken())
          .thenAnswer((_) => Future.value("dummy token"));
      when(_graphQL.authUser(
              name: anyNamed("name"),
              username: anyNamed("username"),
              mobile: anyNamed("mobile"),
              displayPicture: anyNamed("displayPicture"),
              email: anyNamed("email")))
          .thenAnswer((_) => Future.value(_mockAuthUser));

      await _auth.signInToGoogleAndIsFirstTimeUser();

      verify(_googleSignInMock.signIn());
      verify(mockGoogleSignInAccount.authentication);
      final authCredential =
          verify(_firebaseAuthMock.signInWithCredential(captureAny))
              .captured[0];
      expect(authCredential, isA<AuthCredential>());
      expect(_auth.isSignedIn(), true);
    });

    test("signInWithGoogle() aborted", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      final GoogleSignInAccount mockGoogleSignInAccount =
          MockGoogleSignInAccount();
      final GoogleSignInAuthentication mockGoogleSignInAuthentication =
          MockGoogleSignInAuthentication();

      when(_googleSignInMock.signIn()).thenAnswer((_) => Future.value(null));
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));

      expectLater(
          _auth.signInToGoogleAndIsFirstTimeUser(), throwsA(isA<Exception>()));

      verify(_googleSignInMock.signIn());
    });

    test("signInWithGoogle() firebase error", () async {
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      final GoogleSignInAccount mockGoogleSignInAccount =
          MockGoogleSignInAccount();
      final GoogleSignInAuthentication mockGoogleSignInAuthentication =
          MockGoogleSignInAuthentication();

      final Exception e = Exception("Test Exception");
      when(_googleSignInMock.signIn())
          .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));
      when(mockGoogleSignInAuthentication.idToken)
          .thenAnswer((_) => "Dummy Token");
      when(mockGoogleSignInAuthentication.accessToken)
          .thenAnswer((_) => "Access Token");
      when(_firebaseAuthMock.signInWithCredential(any))
          .thenAnswer((_) => throw e);

      try {
        await _auth.signInToGoogleAndIsFirstTimeUser();
      } catch (thrownException) {
        verify(_googleSignInMock.signIn());
        verify(mockGoogleSignInAccount.authentication);
        expect(thrownException, e);
      }
    });
  });

  group("Web endpoint - ", () {
    test("signInToWebpoint()", () async {
      const String username = "username", mobile = "mobile";
      _auth = Auth();
      _auth.setMockInstances(
          firebaseAuth: _firebaseAuthMock, googleSignIn: _googleSignInMock);

      final GoogleSignInAccount mockGoogleSignInAccount =
          MockGoogleSignInAccount();
      final GoogleSignInAuthentication mockGoogleSignInAuthentication =
          MockGoogleSignInAuthentication();

      when(_googleSignInMock.signIn())
          .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));
      when(mockGoogleSignInAuthentication.idToken)
          .thenAnswer((_) => "Dummy Token");
      when(mockGoogleSignInAuthentication.accessToken)
          .thenAnswer((_) => "Access Token");
      when(_firebaseAuthMock.signInWithCredential(captureAny))
          .thenAnswer((_) => Future.value(_mockUserCredential));
      when(_mockUserCredential.user).thenAnswer((_) => _mockUser);
      when(_graphQL.authUser(
              name: anyNamed("name"),
              username: anyNamed("username"),
              mobile: anyNamed("mobile"),
              displayPicture: anyNamed("displayPicture"),
              email: anyNamed("email")))
          .thenAnswer((_) => Future.value(_mockAuthUser));

      await _auth.signInToGoogleAndIsFirstTimeUser();

      _auth.signInToWebpoint(username: username, mobile: mobile);
      verify(_graphQL.authUser(
          name: anyNamed("name"),
          username: anyNamed("username"),
          mobile: anyNamed("mobile"),
          displayPicture: anyNamed("displayPicture"),
          email: anyNamed("email")));
      verify(_graphQL.initGraphQL(getToken: anyNamed("getToken")));
    });
  });
}
