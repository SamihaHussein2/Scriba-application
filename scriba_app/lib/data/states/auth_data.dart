import 'package:flutter/material.dart';
import 'package:scriba_app/services/auth_service.dart';

class AuthData extends ChangeNotifier {
  bool _isBusy = false;
  bool get isBusy => _isBusy;

  AuthService authService = AuthService();

  setBusy() {
    _isBusy = true;
    notifyListeners();
  }

  setFree() {
    _isBusy = false;
    notifyListeners();
  }
}
