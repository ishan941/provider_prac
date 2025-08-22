import 'package:flutter/material.dart';
import 'package:prov/auth/auth_home.dart';
import 'package:prov/auth/dispose_demo.dart';
import 'package:prov/auth/login_auth_provider.dart';
import 'package:prov/enum.dart';
import 'package:prov/home_page.dart';
import 'package:prov/login/login_provider.dart';
import 'package:prov/widgets/custom_elevated_button.dart';
import 'package:prov/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginAuth extends StatelessWidget {
  const LoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Consumer<LoginAuthProvider>(
            builder: (context, loginProvider, child) {
              if (loginProvider.getStatus == StatusUtils.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (loginProvider.getStatus == StatusUtils.error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(loginProvider.errorMessage)),
                  );
                  loginProvider.reset();
                });
              }
              if (loginProvider.getStatus == StatusUtils.success) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Login Successfull"),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                  ));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DemoPage()));
                  loginProvider.reset();
                });
              }
              return Column(
                children: [
                  ui(loginProvider),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget ui(LoginAuthProvider loginProvider) {
    return Column(
      children: [
        CustomTextFormField(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email),
            controller: loginProvider.emailController),
        CustomTextFormField(
            hintText: 'Password',
            obscureText: true,
            prefixIcon: Icon(Icons.lock),
            controller: loginProvider.passwordController),
        CustomElevatedButton(
          onPressed: () {
            loginProvider.login();
          },
          text: "Login",
        ),
      ],
    );
  }
}
