import 'package:coffee_chain/module/login_provider.dart';
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
          sizeText: (width / 200) * 7,
          sizeTextIntput: 15,
          sizeTextButton: (width / 200) * 7,
          sizeHeightButton: 60,
          paddingtop: 20,
          widthImg: (width / 100) * 50,
        ),
        medium: LoginPage(
          padingWidth: width * 0.25,
          sizeText: (width / 200) * 3.5,
          sizeTextIntput: 10,
          sizeTextButton: (width / 200) * 5,
          sizeHeightButton: 70,
          paddingtop: 30,
          widthImg: (width / 100) * 30,
        ),
        large: LoginPage(
          padingWidth: width * 0.3,
          sizeText: (width / 200) * 3,
          sizeTextIntput: (width / 100) * 1,
          sizeTextButton: (width / 200) * 4.5,
          sizeHeightButton: 80,
          paddingtop: 30,
          widthImg: (width / 100) * 20,
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
    required this.widthImg,
  });
  final double padingWidth;
  final double sizeText;
  final double sizeTextIntput;
  final double sizeTextButton;
  final double sizeHeightButton;
  final double paddingtop;
  final double widthImg;

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
                            Image.asset(AppAssetImages.logo, width: widthImg),
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
                                            height: 50,
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
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceAround,
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Row(
                                      //         children: [
                                      //           Radio(
                                      //             fillColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             focusColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             value: Radiobutton.phucVu,
                                      //             groupValue: model.radio,
                                      //             onChanged: model.getRadio,
                                      //           ),
                                      //           Text(
                                      //             'Phục vụ',
                                      //             style: AppStyles.montserrat
                                      //                 .copyWith(
                                      //               fontWeight: FontWeight.w100,
                                      //               fontSize: sizeText,
                                      //             ),
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Row(
                                      //         children: [
                                      //           Radio(
                                      //             fillColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             focusColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             value: Radiobutton.thuNgan,
                                      // groupValue: model.radio,
                                      //             onChanged: model.getRadio,
                                      //           ),
                                      //           Text(
                                      //             'Thu ngân',
                                      //             style: AppStyles.montserrat
                                      //                 .copyWith(
                                      //               fontWeight: FontWeight.w100,
                                      //               fontSize: sizeText,
                                      //             ),
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // const SizedBox(
                                      //   height: 14,
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceAround,
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Row(
                                      //         children: [
                                      //           Radio(
                                      //             fillColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             focusColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             value: Radiobutton.admin,
                                      //             groupValue: model.radio,
                                      //             onChanged: model.getRadio,
                                      //           ),
                                      //           Text(
                                      //             'Admin',
                                      //             style: AppStyles.montserrat
                                      //                 .copyWith(
                                      //               fontWeight: FontWeight.w100,
                                      //               fontSize: sizeText,
                                      //             ),
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Row(
                                      //         children: [
                                      //           Radio(
                                      //             fillColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             focusColor: MaterialStateColor
                                      //                 .resolveWith((states) =>
                                      //                     AppColors.Sepia),
                                      //             value: Radiobutton.phaChe,
                                      //             groupValue: model.radio,
                                      //             onChanged: model.getRadio,
                                      //           ),
                                      //           Text(
                                      //             'Pha chế',
                                      //             style: AppStyles.montserrat
                                      //                 .copyWith(
                                      //               fontWeight: FontWeight.w100,
                                      //               fontSize: sizeText,
                                      //             ),
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),

                                      //

                                      const SizedBox(height: 20),
                                      Material(
                                        color: AppColors.brownBlack,
                                        child: InkWell(
                                          splashColor: AppColors.grey,
                                          onTap: () {
                                            model.DangNhap(context);
                                            if (model.err == true) {
                                              _showMaterialDialog(context);
                                            }
                                          },
                                          child: Container(
                                            height: sizeHeightButton,
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: Text("ĐĂNG NHẬP",
                                                style: AppStyles.dmSans
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            sizeTextButton)),
                                          ),
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

void _showMaterialDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
              width: 300,
              height: 200,
              child: Image.asset(AppAssetImages.dnerr)),
        );
      });
}
