import 'package:flutter/material.dart';
import 'package:prov/auth/login_auth_provider.dart';
import 'package:provider/provider.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({super.key});

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Home"),
      ),
      body: Center(
        child: Consumer<LoginAuthProvider>(
          builder: (context, loginProvider, child) {
            return Text(loginProvider.emailController.text ?? "No Email");
          },
        ),
      ),
    );
  }
}
