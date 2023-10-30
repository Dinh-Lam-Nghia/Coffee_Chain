import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee_chain/module/Phucvu_provider/order_Provider/ghiOrder_Provider.dart';
import 'package:coffee_chain/pages/PhucVu/phucvu_home.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/image.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order/DSmon.dart';

class BodyGhiOrderResponsive extends StatelessWidget {
  const BodyGhiOrderResponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ResponsiveContainer(
        small: BodyGhiOrderPage(
          small: true,
          maNV: maNV,
          widthRow1: width,
          widthRow2: width,
          height: ((height / 10) * 7.5),
        ),
        large: BodyGhiOrderPage(
          small: false,
          maNV: maNV,
          widthRow1: ((width / 100) * 55),
          widthRow2: ((width / 100) * 40),
          height: ((height / 100) * 70),
        ));
  }
}

class BodyGhiOrderPage extends StatefulWidget {
  const BodyGhiOrderPage({
    super.key,
    required this.small,
    required this.maNV,
    required this.widthRow1,
    required this.widthRow2,
    required this.height,
  });
  final String maNV;
  final bool small;
  final double widthRow1;
  final double widthRow2;
  final double height;

  @override
  State<BodyGhiOrderPage> createState() => _BodyGhiOrderPageState();
}

class _BodyGhiOrderPageState extends State<BodyGhiOrderPage> {
  final GhiorderProvider _ghiorderProvider = GhiorderProvider();

  @override
  void initState() {
    super.initState();
    _ghiorderProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GhiorderProvider>(
      create: (context) => _ghiorderProvider,
      builder: (context, child) {
        return Consumer<GhiorderProvider>(
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      (widget.small)
                          ? Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  row2_1(model, widget.small, widget.widthRow2),
                                  row2_2(model, widget.small, widget.widthRow2)
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       padding: const EdgeInsets.only(
                                    //           top: 5, left: 5),
                                    //       child: Material(
                                    //         color: AppColors.white,
                                    //         child: InkWell(
                                    //           onTap: () =>
                                    //               model.hienTheoNhomThucDon('tc'),
                                    //           child: Container(
                                    //             width: 250,
                                    //             height: 70,
                                    //             decoration: BoxDecoration(
                                    //                 border: Border(
                                    //                     bottom: BorderSide(
                                    //                         color: (model
                                    //                                     .clMenuMon ==
                                    //                                 clickMenuMon
                                    //                                     .tc)
                                    //                             ? AppColors.Sepia
                                    //                             : AppColors.white,
                                    //                         width: 8))),
                                    //             child: Container(
                                    //               alignment: Alignment.center,
                                    //               child: Text("Tất cả",
                                    //                   style: AppStyles.lato
                                    //                       .copyWith(
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w600)),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       padding: const EdgeInsets.only(top: 5),
                                    //       child: Material(
                                    //         color: AppColors.white,
                                    //         child: InkWell(
                                    //           onTap: () => model
                                    //               .hienTheoNhomThucDon('cafe'),
                                    //           child: Container(
                                    //             width: 220,
                                    //             height: 70,
                                    //             decoration: BoxDecoration(
                                    //                 border: Border(
                                    //                     bottom: BorderSide(
                                    //                         color: (model
                                    //                                     .clMenuMon ==
                                    //                                 clickMenuMon
                                    //                                     .coffee)
                                    //                             ? AppColors.Sepia
                                    //                             : AppColors.white,
                                    //                         width: 8))),
                                    //             child: Container(
                                    //               alignment: Alignment.center,
                                    //               child: Text("Coffee",
                                    //                   style: AppStyles.lato
                                    //                       .copyWith(
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w600)),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       padding: const EdgeInsets.only(top: 5),
                                    //       child: Material(
                                    //         color: AppColors.white,
                                    //         child: InkWell(
                                    //           onTap: () => model
                                    //               .hienTheoNhomThucDon('trasua'),
                                    //           child: Container(
                                    //             width: 220,
                                    //             height: 70,
                                    //             decoration: BoxDecoration(
                                    //                 border: Border(
                                    //                     bottom: BorderSide(
                                    //                         color: (model
                                    //                                     .clMenuMon ==
                                    //                                 clickMenuMon
                                    //                                     .tea)
                                    //                             ? AppColors.Sepia
                                    //                             : AppColors.white,
                                    //                         width: 8))),
                                    //             child: Container(
                                    //               alignment: Alignment.center,
                                    //               child: Text("Trà sửa",
                                    //                   style: AppStyles.lato
                                    //                       .copyWith(
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w600)),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       padding: const EdgeInsets.only(top: 5),
                                    //       child: Material(
                                    //         color: AppColors.white,
                                    //         child: InkWell(
                                    //           onTap: () =>
                                    //               model.hienTheoNhomThucDon(
                                    //                   'nuocngot'),
                                    //           child: Container(
                                    //             width: 220,
                                    //             height: 70,
                                    //             decoration: BoxDecoration(
                                    //                 border: Border(
                                    //                     bottom: BorderSide(
                                    //                         color: (model
                                    //                                     .clMenuMon ==
                                    //                                 clickMenuMon
                                    //                                     .nn)
                                    //                             ? AppColors.Sepia
                                    //                             : AppColors.white,
                                    //                         width: 8))),
                                    //             child: Container(
                                    //               alignment: Alignment.center,
                                    //               child: Text("Nước ngọt",
                                    //                   style: AppStyles.lato
                                    //                       .copyWith(
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w600)),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       padding: const EdgeInsets.only(top: 5),
                                    //       child: Material(
                                    //         // elevation: 4,
                                    //         color: AppColors.white,
                                    //         child: InkWell(
                                    //           onTap: () => model
                                    //               .hienTheoNhomThucDon('khac'),
                                    //           child: Container(
                                    //             width: 220,
                                    //             height: 70,
                                    //             decoration: BoxDecoration(
                                    //                 border: Border(
                                    //                     bottom: BorderSide(
                                    //                         color: (model
                                    //                                     .clMenuMon ==
                                    //                                 clickMenuMon
                                    //                                     .more)
                                    //                             ? AppColors.Sepia
                                    //                             : AppColors.white,
                                    //                         width: 8))),
                                    //             child: Container(
                                    //               alignment: Alignment.center,
                                    //               child: Text("Khác",
                                    //                   style: AppStyles.lato
                                    //                       .copyWith(
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w600)),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    AccUser(
                                      maNV: widget.maNV,
                                      tenNV: model.tenNV,
                                      PQPV: model.PQPV,
                                      PQTN: model.PQTN,
                                      PQAD: model.PQAD,
                                      PQPC: model.PQPC,
                                      XDTrang: 'phucVu',
                                      drawer: AppColors.black87,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      const SizedBox(height: 10),
                      //
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        child: (widget.small)
                            ? Column(
                                children: [
                                  row1(context, model, widget.widthRow1,
                                      widget.height, widget.small),
                                  row2(context, model, widget.widthRow2,
                                      widget.height, widget.small),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  row1(context, model, widget.widthRow1,
                                      widget.height, widget.small),
                                  row2(context, model, widget.widthRow2,
                                      widget.height, widget.small),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget row1(BuildContext context, GhiorderProvider model, double widthRow1,
      double height, bool small) {
    return Container(
      width: widthRow1,
      // height: height,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: (widget.small) ? 5 : 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: (widget.small) ? widthRow1 : (widthRow1 / 10) * 9.8,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25)),
            child: TextFormField(
              onChanged: model.timkiem,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 40,
                  ),
                  hintText: 'Nhập mã/Tên món cần tìm',
                  border: InputBorder.none),
            ),
          ),
          //
          Container(
            color: Colors.amberAccent,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: model.ListDSmon.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, index) {
                  return Material(
                    child: InkWell(
                      onTap: () => model
                          .addMonCB(model.ListDSmon[index].maMon.toString()),
                      child: Container(
                        color: AppColors.white,
                        child: (widget.small)
                            ? Column(children: [
                                Expanded(
                                  flex: 3,
                                  child: ImageAll(
                                      imageUrl: model.ListDSmon[index].image
                                          .toString()),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        AutoSizeText(
                                          model.ListDSmon[index].tenMon
                                              .toString(),
                                          style: AppStyles.montserrat.copyWith(
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.black87,
                                          ),
                                          maxFontSize: 20,
                                          minFontSize: 7,
                                          maxLines: 1,
                                        ),
                                        AutoSizeText(
                                          '${double.parse(model.ListDSmon[index].giaTien.toString()).toStringAsFixed(3)} VND',
                                          style: AppStyles.montserrat.copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ])
                            : Column(
                                children: [
                                  row1GridView1(context, model, index, small),
                                  row1GridView2(context, model, index, small),
                                ],
                              ),
                      ),
                    ),
                  );
                }),
          ),
          //
        ],
      ),
    );
  }

  Widget row1GridView1(
      BuildContext context, GhiorderProvider model, int index, bool small) {
    return Expanded(
      flex: 4,
      child: ImageAll(imageUrl: model.ListDSmon[index].image.toString()),
    );
  }

  Widget row1GridView2(
      BuildContext context, GhiorderProvider model, int index, bool small) {
    return Expanded(
      flex: 2,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            AutoSizeText(
              model.ListDSmon[index].tenMon.toString(),
              style: AppStyles.montserrat.copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.black87,
              ),
              maxFontSize: 20,
              minFontSize: 15,
              maxLines: 1,
            ),
            AutoSizeText(
              '${double.parse(model.ListDSmon[index].giaTien.toString()).toStringAsFixed(3)} VND',
              style: AppStyles.montserrat.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget row2(BuildContext context, GhiorderProvider model, double widthRow2,
      double height, bool small) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        alignment: Alignment.topCenter,
        width: widthRow2,
        // height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (widget.small)
                ? Container()
                : Row(
                    children: [
                      row2_1(model, small, widthRow2),
                      row2_2(model, small, widthRow2)
                    ],
                  ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              // height: (widget.small) ? (height / 10) * 9.5 : (height / 10) * 9.1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppColors.white,
                      child: SizedBox(
                        width: double.infinity,
                        child: DataTable(
                            dataRowHeight: (widget.small) ? 120 : 80,
                            columns: [
                              DataColumn(
                                  label: Expanded(
                                      child: Text(
                                "Tên món",
                                style: AppStyles.lato.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(
                                          child: Text(
                                "Số lượng",
                                style: AppStyles.lato.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(
                                          child: Text(
                                "Thành tiền",
                                style: AppStyles.lato.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )))),
                            ],
                            rows: [
                              for (int i = 0;
                                  i < model.ListDSmonHien.length;
                                  i++)
                                DataRow(cells: [
                                  DataCell(Text(
                                    model.ListDSmonHien[i].tenMon.toString(),
                                    style: AppStyles.lato.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )),
                                  DataCell(Center(
                                      child: Text(
                                    model.ListDSmonHien[i].slMon.toString(),
                                    style: AppStyles.lato.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ))),
                                  DataCell(Center(
                                      child: Text(
                                    model
                                        .tinhtien(
                                            model.ListDSmonHien[i].maMon
                                                .toString(),
                                            model.ListDSmonHien[i].slMon
                                                .toString())
                                        .toString(),
                                    style: AppStyles.lato.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ))),
                                ])
                            ]),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 25),
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(Icons.info_outline),
                          Text("Tổng tiền: ",
                              style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                          Text("${model.tongTien.toStringAsFixed(3)} VND",
                              style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.red)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                model.luuOrder();
                                if (model.KTluu) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PhucVuHomeScreen(
                                                  maNV: widget.maNV)),
                                      (route) => false);
                                }
                              },
                              child: Container(
                                width: 126,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.local_dining,
                                      size: 70,
                                      color: Colors.blue,
                                    ),
                                    Container(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'Gửi',
                                          style: AppStyles.lato.copyWith(
                                              fontSize: 18, color: Colors.blue),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PhucVuHomeScreen(
                                            maNV: widget.maNV)),
                                    (route) => false);
                              },
                              child: Container(
                                width: 121,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.cancel,
                                      size: 70,
                                      color: Colors.red,
                                    ),
                                    Container(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'hủy bỏ',
                                          style: AppStyles.lato.copyWith(
                                              fontSize: 18, color: Colors.red),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget row2_1(GhiorderProvider model, bool small, double widthRow2) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(25)),
      width: (widget.small)
          ? widthRow2
          : (widthRow2 / 5) * 3.3, //((width / 5) * 4) / 3,
      height: 50,
      child: DropdownButton(
        borderRadius: BorderRadius.circular(25),
        elevation: 16,
        value: model.vl,
        items: [
          const DropdownMenuItem(
            value: "chonban",
            child: Text('Chọn bàn'),
          ),
          for (int i = 0; i < model.banModel.length; i++)
            DropdownMenuItem(
              value: model.banModel[i].maBan,
              child: Text(model.banModel[i].tenBan.toString()),
            ),
        ],
        onChanged: (value) {
          model.nhanBan(value.toString());
        },
      ),
    );
  }

  Widget row2_2(GhiorderProvider model, bool small, double widthRow2) {
    return Container(
      margin: EdgeInsets.only(top: (widget.small) ? 10 : 0),
      width: (widget.small) ? widthRow2 : (widthRow2 / 5) * 1.6,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: (widget.small) ? 5 : 0),
            width: (widget.small)
                ? ((widthRow2 / 10) * 3.2)
                : ((widthRow2 / 10) * 1.2),
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.people),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: model.slN, border: InputBorder.none),
                    onChanged: (value) => model.sluongnguoi(value.toString()),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: (widget.small) ? 5 : 0),
            width: (widget.small)
                ? ((widthRow2 / 10) * 3.25)
                : ((widthRow2 / 10) * 1),
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    color: Colors.red,
                    onPressed: () {},
                    icon: const Icon(Icons.house)),
              ],
            ),
          ),
          Container(
            width: (widget.small)
                ? ((widthRow2 / 10) * 3.2)
                : ((widthRow2 / 10) * 1),
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.coffee)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
