import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuthException _getError(e) {
  return FirebaseAuthException(
    code: e.code,
    message: e.message,
    credential: e.credential,
    email: e.email,
    phoneNumber: e.phoneNumber,
    tenantId: e.tenantId,
  );
}

/// A service that provides access to Firebase Authentication.
class FirebaseAuthService {
  /// The Firebase Authentication instance.
  final FirebaseAuth _firebaseAuth;

  /// Creates a new instance of the FirebaseAuthService.
  FirebaseAuthService({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  /// Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Gets the current user.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Checks if the current user is signed in.
  bool get isSignedIn => _firebaseAuth.currentUser != null;

  /// Checks if the current signed in user is verified.
  bool? get isVerified => _firebaseAuth.currentUser?.emailVerified;

  /// If the current user is signed in, it refreshes
  Future<void> reload() async {
    try {
      await _firebaseAuth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    }
  }

  /// Sends a password reset email to the given email address.
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    }
  }

  /// Signs in the user with the given email and password.
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    }
  }

  /// Signs in the user with the given Google credentials.
  Future<UserCredential> signInWithGoogle() async {
    try {
      return await _firebaseAuth.signInWithProvider(GoogleAuthProvider());
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    }
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    }
  }
}
