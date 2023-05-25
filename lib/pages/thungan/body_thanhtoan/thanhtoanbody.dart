import 'package:coffee_chain/module/thuNgan_provider/thungan_Provider.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/body_thanhtoan.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/thanhToan.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThanhToanBodyPage extends StatefulWidget {
  const ThanhToanBodyPage({super.key, required this.maNV});
  final String maNV;

  @override
  State<ThanhToanBodyPage> createState() => _ThanhToanBodyPageState();
}

class _ThanhToanBodyPageState extends State<ThanhToanBodyPage> {
  final ThunganProvider _thunganProvider = ThunganProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThunganProvider>(
        create: (context) => _thunganProvider,
        builder: (context, child) {
          return Consumer<ThunganProvider>(builder: (context, model, child) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: (!model.thanhToan)
                  ? ThanhToanPageReponsive(maNV: widget.maNV)
                  : ThanhToanResponsive(maNV: widget.maNV),
            );
          });
        });
  }
}
