import 'package:coffee_chain/values/app_colors.dart';
import 'package:flutter/material.dart';

class TextInputLogin extends StatelessWidget {
  const TextInputLogin(
      {super.key,
      required this.controller,
      this.obscureText,
      this.sizeTextIntput});
  final TextEditingController controller;
  final bool? obscureText;
  final double? sizeTextIntput;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        style: TextStyle(fontSize: sizeTextIntput),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
