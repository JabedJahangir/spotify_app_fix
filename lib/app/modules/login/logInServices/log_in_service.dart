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

    const scopes = ['email'];
    GoogleSignInAccount user;
    try {
      user = await _google.authenticate(scopeHint: scopes);
    } on GoogleSignInException catch (e) {
      print('GoogleSignIn canceled or failed: ${e.code}');
      return null;
    }

    // For Firebase login — no need to fetch access token
    final auth = user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.idToken,
      idToken: auth.idToken,
    );
    return (await _auth.signInWithCredential(credential)).user;
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    await _google.signOut();
  }
}
