import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/custom_exception.dart';
import '../../../utils/utils.dart';
import '../auth_data.dart';

class EmailPasswordAuthData extends AuthData {
  signUpUsingEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      setBusy();
      User user = await authService.signUp(email: email, password: password);

      print("Signed up user's uid : ${user.uid}");

      setFree();
    } on CustomException catch (e) {
      Utils.errorSnackbar(e.message);
      setFree();
    }
  }
}
