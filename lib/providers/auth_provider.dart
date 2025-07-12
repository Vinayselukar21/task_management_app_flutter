import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login(String email, String password) {
    // hardcoded credentials for now
    if (email == 'test@test.com' && password == 'password123') {
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
