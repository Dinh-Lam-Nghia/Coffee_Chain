// ignore_for_file: sort_child_properties_last

import 'package:coffee_chain/module/Phucvu_provider/phucvu_Provider.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/body_ghiorder.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/body_order.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderBodyPage extends StatefulWidget {
  const OrderBodyPage({super.key, required this.maNV});
  final String maNV;

  @override
  State<OrderBodyPage> createState() => _OrderBodyPageState();
} 

class _OrderBodyPageState extends State<OrderBodyPage> {
  final PhucvuProvider _orderProvider = PhucvuProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhucvuProvider>(
      create: (context) => _orderProvider,
      builder: (context, child) {
        return Consumer<PhucvuProvider>(
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: (!model.themOrder)
                  ? OrderPageResponsive(maNV: widget.maNV)
                  : BodyGhiOrderResponsive(maNV: widget.maNV),
              floatingActionButton: (!model.themOrder)
                  ? FloatingActionButton(
                      foregroundColor: AppColors.backgroundColor,
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.add_outlined),
                      onPressed: model.onClickThemOrder,
                    )
                  : Container(),
            );
          },
        );
      },
    );
  }
}
