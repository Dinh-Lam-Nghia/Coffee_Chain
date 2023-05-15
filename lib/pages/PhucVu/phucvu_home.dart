import 'package:coffee_chain/module/Phucvu_provider/phucvu_Provider.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/orderbody.dart';
import 'package:coffee_chain/pages/PhucVu/body_tramon/body_tramon.dart';
import 'package:coffee_chain/pages/admin/admin_home.dart';
import 'package:coffee_chain/pages/login.dart';
import 'package:coffee_chain/pages/phache/phache_home.dart';
import 'package:coffee_chain/pages/thungan/thungan_home.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhucVuHomeScreen extends StatelessWidget {
  const PhucVuHomeScreen({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
        small: PhucVuHomePage(
          maNV: maNV,
          small: true,
        ),
        large: PhucVuHomePage(
          maNV: maNV,
          small: false,
        ));
  }
}

class PhucVuHomePage extends StatefulWidget {
  const PhucVuHomePage({super.key, required this.small, required this.maNV});
  final String maNV;
  final bool small;

  @override
  State<PhucVuHomePage> createState() => _PhucVuHomePageState();
}

enum listthem { thanhToan, admin, phaChe }

class _PhucVuHomePageState extends State<PhucVuHomePage> {
  PhucvuProvider _orderProvider = PhucvuProvider();

  @override
  void initState() {
    super.initState();
    _orderProvider.getAccPQ(widget.maNV);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  listthem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhucvuProvider>(
      create: (context) => _orderProvider,
      builder: (context, child) {
        return Consumer<PhucvuProvider>(
          builder: (context, model, child) {
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.Sepia,
                elevation: 0,
                leading: InkWell(
                  onTap: (widget.small)
                      ? () {
                          _scaffoldKey.currentState?.openDrawer();
                        }
                      : () {},
                  child: const Icon(
                    Icons.menu,
                    size: 50,
                  ),
                ),
                title: (widget.small)
                    ? const Text("Phục vụ")
                    : SizedBox(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: model.clickOrder,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: (model.chonBody == menuPV.order)
                                    ? AppColors.white1
                                    : AppColors.Sepia,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                                            color:
                                                (model.chonBody == menuPV.order)
                                                    ? AppColors.Sepia
                                                    : AppColors.white1))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: model.clickTramon,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: (model.chonBody == menuPV.tramon)
                                    ? AppColors.white1
                                    : AppColors.Sepia,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAssetIcon.iconChuong,
                                      width: 40,
                                    ),
                                    Text(" Trả món",
                                        style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: (model.chonBody ==
                                                    menuPV.tramon)
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
                  (widget.small)
                      ? Container()
                      : Row(
                          children: [
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
                                      builder: (context) =>
                                          const LoginScreen()),
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
                ],
              ),
              body: (model.chonBody == menuPV.tramon)
                  ? const TramonPageResponsive()
                  : OrderBodyPage(maNV: widget.maNV),
              drawer: Drawer(
                child: Container(
                  color: AppColors.Sepia,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 30),
                            Text(
                              "NHÂN VIÊN PHỤC VỤ",
                              style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white1),
                            ),
                            const SizedBox(height: 50),
                            InkWell(
                              onTap: model.clickOrder,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: (model.chonBody == menuPV.order)
                                    ? AppColors.white1
                                    : AppColors.Sepia,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                                            color:
                                                (model.chonBody == menuPV.order)
                                                    ? AppColors.Sepia
                                                    : AppColors.white1))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            InkWell(
                              onTap: model.clickTramon,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: (model.chonBody == menuPV.tramon)
                                    ? AppColors.white1
                                    : AppColors.Sepia,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAssetIcon.iconChuong,
                                      width: 40,
                                    ),
                                    Text(" Trả món",
                                        style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: (model.chonBody ==
                                                    menuPV.tramon)
                                                ? AppColors.Sepia
                                                : AppColors.white1))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AccUser(
                                    maNV: widget.maNV,
                                    tenNV: model.tenNV,
                                    PQPV: model.PQPV,
                                    PQTN: model.PQTN,
                                    PQAD: model.PQAD,
                                    PQPC: model.PQPC,
                                    XDTrang: 'phucVu',
                                    drawer: AppColors.white1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.wifi,
                                    size: 30,
                                    color: AppColors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.help_outline,
                                    size: 30,
                                    color: AppColors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.power_settings_new,
                                    size: 30,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
