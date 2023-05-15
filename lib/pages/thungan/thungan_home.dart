import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
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
      body: AccUser(
        maNV: 't1',
        tenNV: 'A',
        PQPV: 1,
        PQTN: 1,
        PQAD: 0,
        PQPC: 1,
        XDTrang: 'thuNgan',
      ),
    );
  }
}
