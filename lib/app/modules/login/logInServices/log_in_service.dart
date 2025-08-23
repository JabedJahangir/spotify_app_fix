import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _google = GoogleSignIn.instance;
  static bool _initialized = false;

  static Future<void> _initialize() async {
    if (!_initialized) {
      await _google.initialize();
      _initialized = true;
    }
  }

  static Future<User?> signInWithGoogle() async {
  await _initialize();

  final googleUser = await GoogleSignIn.instance.authenticate();
  if (googleUser == null) return null; // user cancelled

  final googleAuth = googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,
    // Note: no accessToken here
  );
  
  final userCredential =
      await _auth.signInWithCredential(credential);
  final firebaseUser = userCredential.user;

  // If you need an accessToken (e.g. for additional scopes):
  const scopes = ['email']; // or more scopes
  final authz = await googleUser.authorizationClient
      .authorizationForScopes(scopes);
  final accessToken = authz?.accessToken;
  // use accessToken as needed

  return firebaseUser;
}


  static Future<void> signOut() async {
    await _auth.signOut();
    await _google.signOut();
  }
}
