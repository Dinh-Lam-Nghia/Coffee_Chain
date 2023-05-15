import 'package:coffee_chain/module/thuNgan_provider/thungan_Provider.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/thanhtoanbody.dart';
import 'package:coffee_chain/pages/thungan/body_thuchi/body_thuchi.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_chain/pages/login.dart';

class ThuNganHomeScreen extends StatelessWidget {
  const ThuNganHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveContainer(
        small: ThuNganHomePage(small: true),
        large: ThuNganHomePage(small: false));
  }
}

class ThuNganHomePage extends StatefulWidget {
  const ThuNganHomePage({super.key, required this.small});
  final bool small;

  @override
  State<ThuNganHomePage> createState() => _ThuNganHomePageState();
}

class _ThuNganHomePageState extends State<ThuNganHomePage> {
  final ThunganProvider _thanhtoanProvider = ThunganProvider();
  void initStack() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThunganProvider>(
      create: (context) => _thanhtoanProvider,
      builder: (context, child) {
        return Consumer<ThunganProvider>(
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
                    ? const Text("Thu ngân")
                    : SizedBox(
                        child: Row(children: [
                          InkWell(
                            onTap: model.clickThanhtoan,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              color: (model.chonBody == menuTN.thanhtoan)
                                  ? AppColors.white1
                                  : AppColors.Sepia,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    size: 45,
                                    color: (model.chonBody == menuTN.thanhtoan)
                                        ? AppColors.Sepia
                                        : AppColors.white1,
                                  ),
                                  Text("Thanh toán",
                                      style: AppStyles.lato.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: (model.chonBody ==
                                                  menuTN.thanhtoan)
                                              ? AppColors.Sepia
                                              : AppColors.white1))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: model.clickThuchi,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              color: (model.chonBody == menuTN.thuchi)
                                  ? AppColors.white1
                                  : AppColors.Sepia,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.work,
                                    size: 45,
                                    color: (model.chonBody == menuTN.thuchi)
                                        ? AppColors.Sepia
                                        : AppColors.white1,
                                  ),
                                  Text(" Thu chi",
                                      style: AppStyles.lato.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              (model.chonBody == menuTN.thuchi)
                                                  ? AppColors.Sepia
                                                  : AppColors.white1))
                                ],
                              ),
                            ),
                          )
                        ]),
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
              body: (model.chonBody == menuTN.thuchi)
                  ? const ThuchiPageReponsive()
                  : const ThanhtoanPage(),
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
                              "NHÂN VIÊN THU NGÂN",
                              style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white1),
                            ),
                            const SizedBox(height: 50),
                            InkWell(
                              // onTap: model.clickThanhtoan(),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: (model.chonBody == menuTN.thanhtoan)
                                    ? AppColors.white1
                                    : AppColors.Sepia,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.list_alt_rounded,
                                      size: 45,
                                      color:
                                          (model.chonBody == menuTN.thanhtoan)
                                              ? AppColors.Sepia
                                              : AppColors.white1,
                                    ),
                                    Text(" Thanh toán",
                                        style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: (model.chonBody ==
                                                    menuTN.thanhtoan)
                                                ? AppColors.Sepia
                                                : AppColors.white1))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            InkWell(
                              // onTap: model.clickThuchi(),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: (model.chonBody == menuTN.thuchi)
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
                                    Text(" Thu chi",
                                        style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: (model.chonBody ==
                                                    menuTN.thuchi)
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
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 40,
                                          color: AppColors.white,
                                        ),
                                        Text("Đinh Lâm Nghĩa ",
                                            style:
                                                AppStyles.montserrat.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: AppColors.white,
                                            )),
                                      ],
                                    ),
                                  )
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
