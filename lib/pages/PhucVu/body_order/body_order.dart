import 'package:coffee_chain/module/Phucvu_provider/order_Provider/order_provider.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/order/dangPhucVu.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/order/mangVe.dart';
import 'package:coffee_chain/pages/PhucVu/body_order/order/yeuCauThanhToan.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPageResponsive extends StatelessWidget {
  const OrderPageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderPage();
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

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
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: Material(
                              elevation: 4,
                              color: (model.clickMnOd == clickMenuOrder.dangpv)
                                  ? AppColors.Sepia
                                  : AppColors.white,
                              child: InkWell(
                                onTap: model.clickDPV,
                                splashColor: Colors.black26,
                                child: Container(
                                  width: 289,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: AppColors.Sepia)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                        "Đang phuc vụ (${model.listDPV.length})",
                                        style: AppStyles.lato.copyWith(
                                          fontWeight: FontWeight.w600,
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
                              color:
                                  (model.clickMnOd == clickMenuOrder.yctramon)
                                      ? AppColors.Sepia
                                      : AppColors.white,
                              child: InkWell(
                                onTap: model.clickYCTT,
                                splashColor: Colors.black26,
                                child: Container(
                                  width: 289,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: AppColors.Sepia)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                        "Yêu cầu thanh toán (${model.listYCTT.length})",
                                        style: AppStyles.lato.copyWith(
                                          fontWeight: FontWeight.w600,
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
                              color: (model.clickMnOd == clickMenuOrder.mangve)
                                  ? AppColors.Sepia
                                  : AppColors.white,
                              child: InkWell(
                                onTap: model.clickMV,
                                splashColor: Colors.black26,
                                child: Container(
                                  width: 289,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: AppColors.Sepia)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child:
                                        Text("Mang về (${model.listMV.length})",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
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
                      //
                      (model.clickMnOd == clickMenuOrder.dangpv)
                          ? const BodyDangPVPage()
                          : (model.clickMnOd == clickMenuOrder.yctramon)
                              ? const YeuCauTTPage()
                              : const MangVePage(),
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
