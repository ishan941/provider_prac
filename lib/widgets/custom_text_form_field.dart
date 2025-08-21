import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  bool obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;
  CustomTextFormField({
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      controller: controller,
    );
  }
}
