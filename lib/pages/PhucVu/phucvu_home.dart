import 'package:coffee_chain/module/Phucvu_provider/phucvu_Provider.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/body_ghiorder.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/orderbody.dart';
import 'package:coffee_chain/pages/PhucVu/body_tramon/body_tramon.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhucVuHomePage extends StatefulWidget {
  const PhucVuHomePage({super.key});

  @override
  State<PhucVuHomePage> createState() => _PhucVuHomePageState();
}

class _PhucVuHomePageState extends State<PhucVuHomePage> {
  PhucvuProvider _orderProvider = PhucvuProvider();

  @override
  void initStack() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhucvuProvider>(
      create: (context) => _orderProvider,
      builder: (context, child) {
        return Consumer<PhucvuProvider>(
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.Sepia,
                elevation: 0,
                leading: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.menu,
                    size: 50,
                  ),
                ),
                title: SizedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: model.clickOrder,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: (model.chonBody == menuPV.order)
                              ? AppColors.white1
                              : AppColors.Sepia,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.list_alt_rounded,
                                size: 45,
                                color: (model.chonBody == menuPV.order)
                                    ? AppColors.Sepia
                                    : AppColors.white1,
                              ),
                              Text(" Order",
                                  style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: (model.chonBody == menuPV.order)
                                          ? AppColors.Sepia
                                          : AppColors.white1))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: model.clickTramon,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: (model.chonBody == menuPV.tramon)
                              ? AppColors.white1
                              : AppColors.Sepia,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Image.asset(
                                AppAssetIcon.iconChuong,
                                width: 40,
                              ),
                              Text(" Trả món",
                                  style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: (model.chonBody == menuPV.tramon)
                                          ? AppColors.Sepia
                                          : AppColors.white1))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.wifi,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 50),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.help_outline,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 50),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.power_settings_new,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 10)
                ],
              ),
              body: (model.chonBody == menuPV.tramon)
                  ? const TramonPageResponsive()
                  : const OrderBodyPage(),
            );
          },
        );
      },
    );
  }
}
