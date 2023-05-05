import 'package:coffee_chain/module/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../values/app_colors.dart';

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
    final LoginProvider _loginProvider = LoginProvider();
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => _loginProvider,
      builder: (context, child) {
        return Consumer<LoginProvider>(
          builder: (context, model, child) {
            return SizedBox(
              child: TextFormField(
                controller: controller,
                obscureText: obscureText ?? false,
                style: TextStyle(fontSize: sizeTextIntput ?? 27),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
