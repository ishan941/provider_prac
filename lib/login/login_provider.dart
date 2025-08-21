import 'package:flutter/material.dart';
import 'package:prov/enum.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String _email = "ishan";
  final String _password = "1234";

  StatusUtils status = StatusUtils.idle;
  String? errorMessage;

  /// Simulate login
  Future<void> login() async {
    // Set loading state
    status = StatusUtils.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    // Check credentials
    if (emailController.text == _email &&
        passwordController.text == _password) {
      status = StatusUtils.success;
      errorMessage = null;
    } else {
      status = StatusUtils.error;
      errorMessage = "Invalid email or password";
    }

    notifyListeners();
  }

  /// Reset state (optional helper)
  void reset() {
    status = StatusUtils.idle;
    errorMessage = null;
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }
}
