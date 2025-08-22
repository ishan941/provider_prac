import 'package:flutter/material.dart';
import 'package:prov/auth/login_auth_provider.dart';
import 'package:prov/enum.dart';
import 'package:prov/login/login_provider.dart';
import 'package:prov/home_page.dart';
import 'package:prov/login/signup_page.dart';
import 'package:prov/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Consumer<LoginAuthProvider>(
        builder: (context, loginProvider, child) {
          if (loginProvider.status == StatusUtils.success) {
            // WidgetsBinding.instance.addPostFrameCallback((_){
            //   ScaffoldMessenger.of(context).showSnackBar(snackBar)
            // })
          }
          return Stack(
            children: [
              loginProvider.status != StatusUtils.loading
                  ? ui(loginProvider, context)
                  : CircularProgressIndicator()
            ],
          );
        },
      ),
    );
  }

  Widget ui(LoginAuthProvider loginProvider, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              hintText: "Enter Email",
              controller: loginProvider.emailController,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              hintText: "Enter Password",
              controller: loginProvider.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginProvider.login();
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
