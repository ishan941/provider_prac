import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prov/enum.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  StatusUtils status = StatusUtils.idle;
  String? errorMessage;

  /// Firebase login
  Future<void> login() async {
    // Set loading state
    status = StatusUtils.loading;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      status = StatusUtils.success;
      errorMessage = null;
    } catch (e) {
      status = StatusUtils.error;
      errorMessage = "Login failed: ${e.toString()}";
    }

    notifyListeners();
  }

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Check if user is logged in
  bool get isLoggedIn => _auth.currentUser != null;

  /// Reset state (optional helper)
  void reset() {
    status = StatusUtils.idle;
    errorMessage = null;
    notifyListeners();
  }

  /// Logout
  Future<void> logout() async {
    await _auth.signOut();
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }
}
