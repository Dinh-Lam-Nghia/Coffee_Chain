import 'package:coffee_chain/module/Phucvu_provider/order_Provider/order_provider.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/order/dangPhucVu.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/order/mangVe.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/order/yeuCauThanhToan.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPageResponsive extends StatelessWidget {
  const OrderPageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
        small: OrderPage(
          sizeText: width * 0.3 / 15,
          widthButton: width * 0.3,
          heightButton: width * 0.3 / 5,
          small: true,
        ),
        large: OrderPage(
          sizeText: width * 0.2 / 15,
          widthButton: width * 0.2,
          heightButton: width * 0.2 / 6,
          small: false,
        ));
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage(
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
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderProvider _orderProvider = OrderProvider();

  @override
  void initState() {
    super.initState();
    _orderProvider.getListBanHD();
    _orderProvider.getSL();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderProvider>(
      create: (context) => _orderProvider,
      builder: (context, child) {
        return Consumer<OrderProvider>(
          builder: (context, model, child) {
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
                                  color:
                                      (model.clickMnOd == clickMenuOrder.dangpv)
                                          ? AppColors.Sepia
                                          : AppColors.white,
                                  child: InkWell(
                                    onTap: model.clickDPV,
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
                                            "Đang phuc vụ (${model.listDPV.length})",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: widget.sizeText,
                                              color: (model.clickMnOd ==
                                                      clickMenuOrder.dangpv)
                                                  ? AppColors.white
                                                  : AppColors.Sepia,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Material(
                                  elevation: 4,
                                  color: (model.clickMnOd ==
                                          clickMenuOrder.yctramon)
                                      ? AppColors.Sepia
                                      : AppColors.white,
                                  child: InkWell(
                                    onTap: model.clickYCTT,
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
                                            "Yêu cầu thanh toán (${model.listYCTT.length})",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: widget.sizeText,
                                              color: (model.clickMnOd ==
                                                      clickMenuOrder.yctramon)
                                                  ? AppColors.white1
                                                  : AppColors.Sepia,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Material(
                                  elevation: 4,
                                  color:
                                      (model.clickMnOd == clickMenuOrder.mangve)
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
                                              color: (model.clickMnOd ==
                                                      clickMenuOrder.mangve)
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
                      //
                      (model.clickMnOd == clickMenuOrder.dangpv)
                          ? const BodyDangPVResponsive()
                          : (model.clickMnOd == clickMenuOrder.yctramon)
                              ? const YeuCauTTResponsive()
                              : const MangVeResponsive(),
                      //
                    ]),
              ),
            );
          },
        );
      },
    );
  }
}
