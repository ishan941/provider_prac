import 'package:flutter/material.dart';
import 'package:prov/enum.dart';

class LoginAuthProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Demo credentials
  final String _demoEmail = "ishan";
  final String _demoPassword = "1234";

  StatusUtils status = StatusUtils.idle;
  String? errorMessage;

  Future<void> login() async {
    status = StatusUtils.loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      if (emailController.text == _demoEmail &&
          passwordController.text == _demoPassword) {
        status = StatusUtils.success;
        errorMessage = null;
      } else {
        status = StatusUtils.error;
        errorMessage = "Invalid Email or Password";
      }
    } catch (e) {
      errorMessage = "Error: ${e.toString()}";
    }
    notifyListeners();
  }

  void reset() {
    status = StatusUtils.idle;
    errorMessage = null;
    notifyListeners();
  }
}
