import 'package:coffee_chain/module/thuNgan_provider/thanhtoan_Provider/thanhToan_provider.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/thanhtoan/choThanhToan.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/thanhtoan/mangVe.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ThanhToanPageReponsive extends StatelessWidget {
  const ThanhToanPageReponsive({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
        small: ThanhtoanPage(
          sizeText: width * 0.3 / 15,
          widthButton: width * 0.3,
          heightButton: width * 0.3 / 5,
          small: true,
        ),
        large: ThanhtoanPage(
          sizeText: width * 0.2 / 15,
          widthButton: width * 0.2,
          heightButton: width * 0.2 / 6,
          small: false,
        ));
  }
}

class ThanhtoanPage extends StatefulWidget {
  const ThanhtoanPage(
      {super.key,
      required this.sizeText,
      required this.widthButton,
      required this.heightButton,
      required this.small});
  final bool small;
  final double sizeText;
  final double widthButton;
  final double heightButton;
  @override
  State<ThanhtoanPage> createState() => _ThanhToanPageState();
}

class _ThanhToanPageState extends State<ThanhtoanPage> {
  ThanhToanProvider _ThanhToanProvider = ThanhToanProvider();

  @override
  void initState() {
    super.initState();
    _ThanhToanProvider.getListBanHD();
    _ThanhToanProvider.getSL();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThanhToanProvider>(
        create: (context) => _ThanhToanProvider,
        builder: (context, child) {
          return Consumer<ThanhToanProvider>(builder: (context, model, child) {
            return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: Material(
                                elevation: 4,
                                color: (model.clickMnTT ==
                                        clickMenuThanhToan.cttoan)
                                    ? AppColors.Sepia
                                    : AppColors.white,
                                child: InkWell(
                                    onTap: model.clickCTT,
                                    splashColor: Colors.black26,
                                    child: Container(
                                      width: widget.widthButton,
                                      height: widget.heightButton,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: AppColors.Sepia)),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Chờ thanh toán (${model.listYCTT.length})",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: widget.sizeText,
                                              color: (model.clickMnTT ==
                                                      clickMenuThanhToan.cttoan)
                                                  ? AppColors.white
                                                  : AppColors.Sepia,
                                            )),
                                      ),
                                    )),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: Material(
                                elevation: 4,
                                color: (model.clickMnTT ==
                                        clickMenuThanhToan.mangve)
                                    ? AppColors.Sepia
                                    : AppColors.white,
                                child: InkWell(
                                  onTap: model.clickCTT,
                                  splashColor: Colors.black26,
                                  child: Container(
                                    width: widget.widthButton,
                                    height: widget.heightButton,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: AppColors.Sepia)),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                          "Mang về (${model.listMV.length})",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: widget.sizeText,
                                            color: (model.clickMnTT ==
                                                    clickMenuThanhToan.mangve)
                                                ? AppColors.white1
                                                : AppColors.Sepia,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        (widget.small)
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          Text("Đinh Lâm Nghĩa ",
                                              style: AppStyles.montserrat
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20)),
                                          const Icon(Icons.person, size: 40)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                      ],
                    ),
                    (model.clickMnTT == clickMenuThanhToan.cttoan)
                        ? const MangVeResponsive()
                        : const BodyChoTTResponsive(),
                  ],
                )));
          });
        });
  }
}
