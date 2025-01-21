enum AuthExceptionType {
  dontAllowed,
  uknown,
}

abstract interface class AuthContract {
  Future<void> signInAnonymously();
  String? get uid;
}

class AuthException implements Exception {
  AuthException(this.type);
  final AuthExceptionType type;
}
