import 'package:coffee_chain/module/thuNgan_provider/thanhtoan_Provider/thanhToan_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThanhToanResponsive extends StatelessWidget {
  const ThanhToanResponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
        small: ThanhToanPage(
          sizeText: width * 0.3 / 15,
          widthButton: width * 0.3,
          heightButton: width * 0.3 / 5,
          small: true,
          maNV: maNV,
        ),
        large: ThanhToanPage(
          sizeText: width * 0.2 / 15,
          widthButton: width * 0.2,
          heightButton: width * 0.2 / 6,
          small: false,
          maNV: maNV,
        ));
  }
}

class ThanhToanPage extends StatefulWidget {
  const ThanhToanPage(
      {super.key,
      required this.sizeText,
      required this.widthButton,
      required this.heightButton,
      required this.small,
      required this.maNV});

  final String maNV;
  final bool small;
  final double sizeText;
  final double widthButton;
  final double heightButton;

  @override
  State<ThanhToanPage> createState() => _ThanhToanPageState();
}

class _ThanhToanPageState extends State<ThanhToanPage> {
  final ThanhToanProvider _thanhToanProvider = ThanhToanProvider();

  @override
  void initState() {
    _thanhToanProvider.getAccPQ(widget.maNV);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<ThanhToanProvider>(
      create: (context) => _thanhToanProvider,
      builder: (context, child) {
        return Consumer<ThanhToanProvider>(builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          (widget.small)
                              ? Container()
                              : AccUser(
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 723,
                              height: 900,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 40, left: 30),
                                    width: 723,
                                    height: 80,
                                    decoration: const BoxDecoration(
                                      color: AppColors.Organe,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.card_giftcard,
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("Chương trình khuyến mãi",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 28,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 723,
                                    height: 800,
                                    color: AppColors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          width: 740,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            color: AppColors.Organe1,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  iconSize: 60,
                                                  color: Colors.white,
                                                  onPressed: () {},
                                                  icon: const Icon(Icons
                                                      .check_box_outline_blank)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text("Giảm giá 5% đơn trên 300k",
                                                  style:
                                                      AppStyles.lato.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          width: 740,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            color: AppColors.Organe1,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  iconSize: 60,
                                                  color: Colors.white,
                                                  onPressed: () {},
                                                  icon: const Icon(Icons
                                                      .check_box_outline_blank)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text("Giảm giá 8% đơn trên 450k",
                                                  style:
                                                      AppStyles.lato.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          width: 740,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            color: AppColors.Organe1,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  iconSize: 60,
                                                  color: Colors.white,
                                                  onPressed: () {},
                                                  icon: const Icon(Icons
                                                      .check_box_outline_blank)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text("Giảm giá 10% đơn trên 800k",
                                                  style:
                                                      AppStyles.lato.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 410),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              right: 40, left: 25),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 233,
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                    color: AppColors.Sepia),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("Áp dụng",
                                                        style: AppStyles.lato
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 26,
                                                                color: AppColors
                                                                    .colorButton)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              height: 900,
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 30),
                                  width: 1000,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("HĐ 000.001/1.1 - Bàn 012/Tầng 1",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 400),
                                      Text("30/11/2021",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 50),
                                      Text("8:30 AM",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 30),
                                  width: 1000,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    color: AppColors.colorrow,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Tên món",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 300),
                                      Text("Số lượng",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 15),
                                      Text("Thành tiền",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 25),
                                  width: 1000,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Black Coffee",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 85),
                                      const SizedBox(
                                        width: 80,
                                        height: 64,
                                        child: Card(
                                          color: AppColors.Box,
                                          child: Center(
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("75.000 VND",
                                          style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 30),
                                  width: 1000,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Tổng thanh toán",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 40),
                                      Text("75.0000 VND",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 250),
                                      Text("Thành tiền",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                      const SizedBox(width: 180),
                                      Text("75.000 VND",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 30),
                                  width: 1000,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 180,
                                        height: 58,
                                        decoration: const BoxDecoration(
                                            color: AppColors.Sepia),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.chevron_left,
                                              size: 50,
                                              color: AppColors.colorButton,
                                            ),
                                            Text("Quay lại",
                                                style: AppStyles.lato.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                    color:
                                                        AppColors.colorButton)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 250),
                                      Container(
                                        width: 180,
                                        height: 58,
                                        decoration: const BoxDecoration(
                                            color: AppColors.Sepia),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.attach_money,
                                              size: 50,
                                              color: AppColors.colorButton,
                                            ),
                                            Text("Thanh toán",
                                                style: AppStyles.lato.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                    color:
                                                        AppColors.colorButton)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Container(
                                        width: 277,
                                        height: 58,
                                        decoration: const BoxDecoration(
                                            color: AppColors.Sepia),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.print,
                                              size: 50,
                                              color: AppColors.colorButton,
                                            ),
                                            Text("Thanh toán & In hóa đơn",
                                                style: AppStyles.lato.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                    color:
                                                        AppColors.colorButton)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
