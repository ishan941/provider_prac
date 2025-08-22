import 'package:flutter/material.dart';
import 'package:prov/enum.dart';

class LoginAuthProvider with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  StatusUtils _statusUtils = StatusUtils.idle;
  final Auth _auth = Auth();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  StatusUtils get getStatus => _statusUtils;
  Auth get getAuth => _auth;

  String defEmail = "ishan";
  String password = '123';
  String errorMessage = '';

  void disposeControllers() {
    _passwordController.dispose();
    _emailController.dispose();
  }

  void login() async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 2));
      if (emailController.text.trim() == defEmail &&
          passwordController.text.trim() == password) {
        _statusUtils = StatusUtils.success;
        errorMessage = '';
      } else {
        _statusUtils = StatusUtils.error;
        errorMessage = 'Invalid email or password';
        passwordController.clear();
      }
    } catch (e) {
      errorMessage = 'An error occurred';
      passwordController.clear();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void reset() {
    _statusUtils = StatusUtils.idle;
    _emailController.text = "Helo";

    notifyListeners();
  }
}

class Auth {
  String? email;
  String? password;
  String? phone;
  String? name;
  Auth({this.email, this.password, this.phone, this.name});
}
