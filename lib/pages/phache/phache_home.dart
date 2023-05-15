import 'package:coffee_chain/module/phaChe_provider/phacheHome_provider.dart';
import 'package:coffee_chain/pages/login.dart';
import 'package:coffee_chain/pages/phache/DS_monCheBien/body_DSmonchebien.dart';
import 'package:coffee_chain/pages/phache/quanlykho/body_Qlykho.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhaCheHomePage extends StatefulWidget {
  const PhaCheHomePage({super.key, required this.maNV});
  final String maNV;

  @override
  State<PhaCheHomePage> createState() => _PhaCheHomePageState();
}

class _PhaCheHomePageState extends State<PhaCheHomePage> {
  final PhaCheHomeProvider _phaCheHomeProvider = PhaCheHomeProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhaCheHomeProvider>(
      create: (context) => _phaCheHomeProvider,
      builder: (context, child) {
        return Consumer<PhaCheHomeProvider>(
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
                        onTap: model.onClickDSMonCheBien,
                        child: BottonMenuDSMCB(
                            menuClick: model.menuClick,
                            text: "DS món chế biến"),
                      ),
                      InkWell(
                        onTap: model.onClickQuanLyKho,
                        child: ButtonMenuQLK(
                            menuClick: model.menuClick, text: "Quản lý kho"),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Icon(
                      Icons.power_settings_new,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 10)
                ],
              ),
              body: (model.menuClick == "DSmonchebien")
                  ? DSMCheBienPage(maNV: widget.maNV)
                  : QuanLyKhoPage(maNV: widget.maNV),
            );
          },
        );
      },
    );
  }
}
