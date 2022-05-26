import 'package:firebase_auth/firebase_auth.dart';
import '../utils/custom_exception.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> authChanges() => _auth.authStateChanges();

  Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (_userCredential.user != null) {
        return _userCredential.user!;
      }

      throw CustomException("User was null");
    } on FirebaseException catch (err) {
      throw CustomException(err.message!);
    }
  }
}
