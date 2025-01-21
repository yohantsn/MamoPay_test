import 'package:firebase_auth/firebase_auth.dart';
import 'package:mamopay_test/repository/auth/auth.dart';

class AuthService implements AuthContract {
  UserCredential? _userCredential;
  @override
  Future<void> signInAnonymously() async {
    try {
      _userCredential = await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          throw AuthException(AuthExceptionType.dontAllowed);
        default:
          throw AuthException(AuthExceptionType.uknown);
      }
    }
  }

  @override
  String? get uid => _userCredential?.user?.uid;
}
