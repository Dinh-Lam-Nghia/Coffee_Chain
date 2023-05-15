import 'package:coffee_chain/module/phaChe_provider/quanLykho_provider/quanLyKho_provider.dart';
import 'package:coffee_chain/pages/phache/quanlykho/phieu_nhap_xuat/them_phieuxuatkho.dart';
import 'package:coffee_chain/pages/phache/quanlykho/phieu_nhap_xuat/them_phieunhapkho.dart';
import 'package:coffee_chain/pages/phache/quanlykho/table_data.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuanLyKhoPage extends StatefulWidget {
  const QuanLyKhoPage({super.key, required this.maNV});
  final String maNV;
  @override
  State<QuanLyKhoPage> createState() => _QuanLyKhoPageState();
}

enum listthem { nhapkho, xuatkho }

class _QuanLyKhoPageState extends State<QuanLyKhoPage> {
  final QuanLyKhoProvider _quanLyKhoProvider = QuanLyKhoProvider();

  listthem? selectedMenu;
  @override
  void initState() {
    super.initState();
    _quanLyKhoProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuanLyKhoProvider>(
      create: (context) => _quanLyKhoProvider,
      builder: (context, child) {
        return Consumer<QuanLyKhoProvider>(
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 289,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            width: 2, color: AppColors.Sepia)),
                                    child: PopupMenuButton<listthem>(
                                      initialValue: selectedMenu,
                                      child: Center(
                                        child: Text("Thêm",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      onSelected: (value) {
                                        setState(() {
                                          selectedMenu = value;
                                        });

                                        if (selectedMenu == listthem.nhapkho) {
                                          themphieunhapkho(context, widget.maNV);
                                        } else {
                                          themphieuxuatkho(context, widget.maNV);
                                        }
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<listthem>>[
                                        PopupMenuItem<listthem>(
                                          value: listthem.nhapkho,
                                          child: Text('Phiếu nhập kho',
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        PopupMenuItem<listthem>(
                                          value: listthem.xuatkho,
                                          child: Text('Phiếu xuất kho',
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  InkWell(
                                    onTap: model.clickThongkeNVL,
                                    child: Container(
                                      width: 289,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          color: (model.thongKe)
                                              ? AppColors.Sepia
                                              : AppColors.white,
                                          border: Border.all(
                                              width: 2,
                                              color: AppColors.Sepia)),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text("Thống kê NVL tồn kho",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: (model.thongKe)
                                                  ? AppColors.white
                                                  : AppColors.brownBlack,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AccUser(
                              maNV: widget.maNV,
                              tenNV: model.tenNV,
                              PQPV: model.PQPV,
                              PQTN: model.PQTN,
                              PQAD: model.PQAD,
                              PQPC: model.PQPC,
                              XDTrang: 'phaChe',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: (model.thongKe)
                            ? TableData2(maNV: widget.maNV)
                            : TableData1(maNV: widget.maNV),
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
}
