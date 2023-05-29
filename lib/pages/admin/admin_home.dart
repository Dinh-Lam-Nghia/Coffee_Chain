import 'package:coffee_chain/module/admin_provider/adminHome_provider.dart'; 
import 'package:coffee_chain/pages/admin/khuyenMaiPage/khuyenMaiPage.dart';
import 'package:coffee_chain/pages/admin/nhanVienPage/nhanVienPage.dart';
import 'package:coffee_chain/pages/admin/thucDonPage/thucDonPage.dart';
import 'package:coffee_chain/pages/login.dart'; 
import 'package:coffee_chain/pages/phache/quanlykho/body_Qlykho.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/widgets/admin_widgets.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomeResponsive extends StatelessWidget {
  const AdminHomeResponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    return AdminhomePage(
      maNV: maNV,
    );
  }
}

class AdminhomePage extends StatefulWidget {
  const AdminhomePage({super.key, required this.maNV});
  final String maNV;

  @override
  State<AdminhomePage> createState() => _AdminhomePageState();
}

class _AdminhomePageState extends State<AdminhomePage> {
  final AdminHomeProvider _adminHomeProvider = AdminHomeProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdminHomeProvider>(
      create: (context) => _adminHomeProvider,
      builder: (context, child) {
        return Consumer<AdminHomeProvider>(
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
                        onTap: () => model.menu(1),
                        child: BottonMenuTD(
                            menuClick: model.menuClick, text: 'Thực đơn'),
                      ),
                      InkWell(
                        onTap: () => model.menu(2),
                        child: BottonMenuNV(
                            menuClick: model.menuClick, text: 'Nhân viên'),
                      ),
                      InkWell(
                        onTap: () => model.menu(31),
                        child: BottonMenuBC(
                            menuClick: model.menuClick, text: 'Báo cáo'),
                      ),
                      InkWell(
                        onTap: () => model.menu(4),
                        child: BottonMenuKM(
                            menuClick: model.menuClick, text: 'Khuyến mãi'),
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
              body: (model.menuClick == "thucdon")
                  ? ThucDonPageReponsive(maNV: widget.maNV)
                  : (model.menuClick == "nhanvien")
                      ? NhanVienPageReponsive(maNV: widget.maNV)
                      : (model.menuClick == "khuyenmai")
                          ? KhuyenMaiPageReponsive(maNV: widget.maNV)
                          : QuanLyKhoPage(maNV: widget.maNV),
            );
          },
        );
      },
    );
  }
}
