import 'package:coffee_chain/module/thuNgan_provider/thanhtoan_Provider/thanhToan_provider.dart';
import 'package:coffee_chain/pages/thungan/thungan_home.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThanhToanResponsive extends StatelessWidget {
  const ThanhToanResponsive({
    super.key,
    required this.maNV,
    required this.maBan,
  });
  final String maNV;
  final String maBan;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ResponsiveContainer(
        small: ThanhToanPage(
          small: true,
          maNV: maNV,
          maBan: maBan,
          width: (width * 0.8),
          height: (height * 0.8),
          fontSize: (width / 200) * 3,
          btnHeight: (height / 2) * 0.2,
          btnWidth: (width / 2) * 0.5,
        ),
        large: ThanhToanPage(
          small: false,
          maNV: maNV,
          maBan: maBan,
          width: (width * 0.8),
          height: (height * 0.8),
          fontSize: (width / 200) * 2,
          btnHeight: (height / 2) * 0.2,
          btnWidth: (width / 2) * 0.5,
        ));
  }
}

class ThanhToanPage extends StatefulWidget {
  const ThanhToanPage({
    super.key,
    required this.small,
    required this.maNV,
    required this.maBan,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.btnHeight,
    required this.btnWidth,
  });
  final String maNV;
  final bool small;
  final String maBan;
  final double width;
  final double height;
  final double btnWidth;
  final double btnHeight;
  final double fontSize;

  @override
  State<ThanhToanPage> createState() => _ThanhToanPageState();
}

class _ThanhToanPageState extends State<ThanhToanPage> {
  final ThanhToanProvider _thanhToanProvider = ThanhToanProvider();

  @override
  void initState() {
    _thanhToanProvider.getAccPQ(widget.maNV, widget.maBan);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
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
                    // Container(
                    //   width: double.infinity,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //             width: double.infinity,
                    //             height: 70,
                    //             color: Colors.blue),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           width: double.infinity,
                    //           height: 100,
                    //           color: Colors.amber,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              color: AppColors.white,
                              // height: widget.height,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(15),
                                    decoration: const BoxDecoration(
                                      color: AppColors.Organe,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.card_giftcard,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("Chương trình khuyến mãi",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: widget.fontSize,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      for (int i = 0;
                                          i < model.listKhuyenMai.length;
                                          i++)
                                        InkWell(
                                          onTap: () => model.chonKM(model
                                              .listKhuyenMai[i].maKM
                                              .toString()),
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            width: double.infinity,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              color: AppColors.Organe1,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.check_box_outlined,
                                                  size: 30,
                                                  color: (model.xetChon(model
                                                          .listKhuyenMai[i].maKM
                                                          .toString()))
                                                      ? AppColors.red
                                                      : AppColors.Organe1,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      model
                                                          .listKhuyenMai[i].moTa
                                                          .toString(),
                                                      style: AppStyles.lato
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            widget.fontSize,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 15),
                                          // width: 233,
                                          // height: 100,
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
                                                              FontWeight.w700,
                                                          fontSize:
                                                              widget.fontSize,
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
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  width: widget.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${model.maHD}/${model.banHoatDong!.order} - ${model.banHoatDong!.tenBan}",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          )),
                                      Text(model.ngay,
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                      Text(model.gioi,
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: widget.width,
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
                                      Text("Số lượng",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          )),
                                      Text("Thành tiền",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                for (int i = 0; i < model.listMonCB.length; i++)
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    width: widget.width,
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                              model.listMonCB[i].tenMon
                                                  .toString(),
                                              style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: widget.fontSize,
                                              )),
                                        ),
                                        Card(
                                          color: AppColors.Box,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: Text(
                                                model.listMonCB[i].slMon
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: widget.fontSize,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                '${model.getGiaMon(model.listMonCB[i].maMon.toString(), model.listMonCB[i].slMon.toString())} VND',
                                                style: AppStyles.lato.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: widget.fontSize)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: widget.width,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Thành tiền",
                                          style: AppStyles.lato.copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: widget.fontSize,
                                          )),
                                      Text(
                                          "${model.banHoatDong!.tongTien.toString()} VND",
                                          style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: widget.fontSize * 1.3,
                                              color: AppColors.red)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: widget.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ThuNganHomeScreen(
                                                          maNV: widget.maNV)),
                                              (route) => false);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: const BoxDecoration(
                                              color: AppColors.Sepia),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.chevron_left,
                                                size: widget.fontSize * 2,
                                                color: AppColors.colorButton,
                                              ),
                                              Text("Quay lại",
                                                  style: AppStyles.lato
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              widget.fontSize,
                                                          color: AppColors
                                                              .colorButton)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          model.thanhToanAndInHoaDon();

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ThuNganHomeScreen(
                                                          maNV: widget.maNV)),
                                              (route) => false);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: const BoxDecoration(
                                              color: AppColors.Sepia),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.attach_money,
                                                size: widget.fontSize * 2,
                                                color: AppColors.colorButton,
                                              ),
                                              Text("Thanh toán & In hóa đơn",
                                                  style: AppStyles.lato
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              widget.fontSize,
                                                          color: AppColors
                                                              .colorButton)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ],
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
