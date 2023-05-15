import 'package:coffee_chain/module/login_provider.dart';
import 'package:coffee_chain/pages/PhucVu/phucvu_home.dart';
import 'package:coffee_chain/pages/admin/admin_home.dart';
import 'package:coffee_chain/pages/phache/phache_home.dart';
import 'package:coffee_chain/pages/thungan/thungan_home.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/text.inpput.login.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
        small: LoginPage(
          padingWidth: width * 0.03,
          sizeText: 18,
          sizeTextIntput: 15,
          sizeTextButton: 25,
          sizeHeightButton: 60,
          paddingtop: 20,
        ),
        medium: LoginPage(
          padingWidth: width * 0.25,
          sizeText: 22,
          sizeTextIntput: 24,
          sizeTextButton: 40,
          sizeHeightButton: 80,
          paddingtop: 30,
        ),
        large: LoginPage(
          padingWidth: width * 0.3,
          sizeText: 25,
          sizeTextIntput: 27,
          sizeTextButton: 60,
          sizeHeightButton: 100,
          paddingtop: 45,
        ));
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
    required this.padingWidth,
    required this.sizeText,
    required this.sizeTextIntput,
    required this.sizeTextButton,
    required this.sizeHeightButton,
    required this.paddingtop,
  });
  final double padingWidth;
  final double sizeText;
  final double sizeTextIntput;
  final double sizeTextButton;
  final double sizeHeightButton;
  final double paddingtop;

  final LoginProvider _loginProvider = LoginProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => _loginProvider,
        builder: (context, child) {
          return Consumer<LoginProvider>(
            builder: (context, model, child) {
              return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: SingleChildScrollView(
                    child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height: paddingtop),
                            Image.asset(AppAssetImages.logo, width: 540),
                            const SizedBox(height: 47),
                            Form(
                              key: model.form,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: padingWidth),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tên đăng nhập",
                                        style: AppStyles.montserrat.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: sizeText,
                                        ),
                                      ),
                                      TextInputLogin(
                                        controller: model.nameController,
                                        sizeTextIntput: sizeTextIntput,
                                      ),
                                      const SizedBox(height: 35),
                                      Text(
                                        "Mật khẩu",
                                        style: AppStyles.montserrat.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: sizeText,
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          TextInputLogin(
                                            controller: model.passController,
                                            obscureText: model.isShow,
                                            sizeTextIntput: sizeTextIntput,
                                          ),
                                          Container(
                                            height: 65,
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: model.getIsShow,
                                              child: (model.isShow)
                                                  ? const Icon(
                                                      Icons.visibility_off,
                                                      size: 30,
                                                    )
                                                  : const Icon(
                                                      Icons.visibility,
                                                      size: 30,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 14),

                                      //
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  focusColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  value: Radiobutton.phucVu,
                                                  groupValue: model.radio,
                                                  onChanged: model.getRadio,
                                                ),
                                                Text(
                                                  'Phục vụ',
                                                  style: AppStyles.montserrat
                                                      .copyWith(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: sizeText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  focusColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  value: Radiobutton.thuNgan,
                                                  groupValue: model.radio,
                                                  onChanged: model.getRadio,
                                                ),
                                                Text(
                                                  'Thu ngân',
                                                  style: AppStyles.montserrat
                                                      .copyWith(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: sizeText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  focusColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  value: Radiobutton.admin,
                                                  groupValue: model.radio,
                                                  onChanged: model.getRadio,
                                                ),
                                                Text(
                                                  'Admin',
                                                  style: AppStyles.montserrat
                                                      .copyWith(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: sizeText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  focusColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          AppColors.Sepia),
                                                  value: Radiobutton.phaChe,
                                                  groupValue: model.radio,
                                                  onChanged: model.getRadio,
                                                ),
                                                Text(
                                                  'Pha chế',
                                                  style: AppStyles.montserrat
                                                      .copyWith(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: sizeText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      //

                                      const SizedBox(height: 60),
                                      InkWell(
                                        splashColor: AppColors.grey,
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => (model
                                                              .radio ==
                                                          Radiobutton.phucVu)
                                                      ? const PhucVuHomeScreen()
                                                      : (model.radio ==
                                                              Radiobutton
                                                                  .phaChe)
                                                          ? const PhaCheHomePage()
                                                          : (model.radio ==
                                                                  Radiobutton
                                                                      .admin)
                                                              ? const AdminHomePage()
                                                              : const ThuNganHomeScreen()),
                                              (route) => false);
                                        },
                                        child: Container(
                                          height: sizeHeightButton,
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: AppColors.brownBlack,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Text("ĐĂNG NHẬP",
                                              style: AppStyles.dmSans.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: sizeTextButton)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: paddingtop),
                          ],
                        ))),
              );
            },
          );
        });
  }
}
