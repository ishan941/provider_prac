import 'package:flutter/material.dart';
import 'package:prov/enum.dart';
import 'package:prov/login/login_provider.dart';
import 'package:prov/home_page.dart';
import 'package:prov/login/signup_page.dart';
import 'package:prov/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          // Show loader when logging in
          if (loginProvider.status == StatusUtils.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle error snackbar
          if (loginProvider.status == StatusUtils.error) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(loginProvider.errorMessage ?? "Invalid login"),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating, // ✅ floats above bottom
                ),
              );
              loginProvider.reset(); // optional → reset status after showing
            });
          }

          // Handle success snackbar
          if (loginProvider.status == StatusUtils.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Login Successful"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );

              // Navigate to home page after successful login
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
              loginProvider.reset();
            });
          }

          // Default = show form
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
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    child: const Text("Don't have an account? Sign Up"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
