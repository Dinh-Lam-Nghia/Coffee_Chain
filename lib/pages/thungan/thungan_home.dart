import 'package:coffee_chain/values/app_colors.dart';
import 'package:flutter/material.dart';

class ThuNganHomePage extends StatefulWidget {
  const ThuNganHomePage({super.key});

  @override
  State<ThuNganHomePage> createState() => _ThuNganHomePageState();
}

class _ThuNganHomePageState extends State<ThuNganHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
