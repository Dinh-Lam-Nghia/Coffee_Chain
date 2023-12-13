import 'package:coffee_chain/module/thuNgan_provider/thanhtoan_Provider/thanhToan_provider.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/thanhToan.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/thanhtoan/choThanhToan.dart';
import 'package:coffee_chain/pages/thungan/body_thanhtoan/thanhtoan/mangVe.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThanhToanPageReponsive extends StatelessWidget {
  const ThanhToanPageReponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
        small: BodyThanhtoanPage(
          sizeText: width * 0.3 / 15,
          widthButton: width * 0.3,
          heightButton: width * 0.3 / 5,
          small: true,
          maNV: maNV,
        ),
        large: BodyThanhtoanPage(
          sizeText: width * 0.2 / 15,
          widthButton: width * 0.2,
          heightButton: width * 0.2 / 6,
          small: false,
          maNV: maNV,
        ));
  }
}

class BodyThanhtoanPage extends StatefulWidget {
  const BodyThanhtoanPage({
    super.key,
    required this.sizeText,
    required this.widthButton,
    required this.heightButton,
    required this.small,
    required this.maNV,
  });
  final String maNV;
  final bool small;
  final double sizeText;
  final double widthButton;
  final double heightButton;
  @override
  State<BodyThanhtoanPage> createState() => _BodyThanhtoanPageState();
}

class _BodyThanhtoanPageState extends State<BodyThanhtoanPage> {
  final ThanhToanProvider _thanhtoanProvider = ThanhToanProvider();
  @override
  void initState() {
    super.initState();
    _thanhtoanProvider.getAccPQ(widget.maNV, 'null');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThanhToanProvider>(
      create: (context) => _thanhtoanProvider,
      builder: (context, child) {
        return Consumer<ThanhToanProvider>(
          builder: (context, model, child) {
            return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: (model.XDthanhToan)
                    ? ThanhToanResponsive(
                        maNV: widget.maNV,
                        maBan: model.maBanYctt,
                      )
                    : SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
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
                                                "Yêu cầu thanh toán (${model.listCTT.length})",
                                                style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: widget.sizeText,
                                                  color: (model.clickMnTT ==
                                                          clickMenuThanhToan
                                                              .cttoan)
                                                      ? AppColors.white1
                                                      : AppColors.Sepia,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: Material(
                                      elevation: 4,
                                      color: (model.clickMnTT ==
                                              clickMenuThanhToan.mangve)
                                          ? AppColors.Sepia
                                          : AppColors.white,
                                      child: InkWell(
                                        onTap: model.clickMV,
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
                                                "Mang về (${model.listMV.length})",
                                                style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: widget.sizeText,
                                                  color: (model.clickMnTT ==
                                                          clickMenuThanhToan
                                                              .mangve)
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
                              // (widget.small)
                              //     ? Container()
                              //     :
                              AccUser(
                                maNV: widget.maNV,
                                tenNV: model.tenNV,
                                PQPV: model.PQPV,
                                PQTN: model.PQTN,
                                PQAD: model.PQAD,
                                PQPC: model.PQPC,
                                XDTrang: 'thuNgan',
                              ),
                            ],
                          ),
                          (model.clickMnTT == clickMenuThanhToan.cttoan)
                              ? BodyChoTTResponsive(
                                  model: model, maNV: widget.maNV)
                              : MangVeResponsive(),
                        ],
                      )));
          },
        );
      },
    );
  }
}
