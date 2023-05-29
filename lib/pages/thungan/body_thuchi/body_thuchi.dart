import 'package:coffee_chain/module/thuNgan_provider/quanlythuChi_provider/quanLyThuChi_provider.dart';
import 'package:coffee_chain/pages/thungan/quanlythuchi/phieu_thu_chi/them_phieuchi.dart';
import 'package:coffee_chain/pages/thungan/quanlythuchi/phieu_thu_chi/them_phieuthu.dart';
import 'package:coffee_chain/pages/thungan/tableThuChi.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ThuchiPageReponsive extends StatefulWidget {
  const ThuchiPageReponsive({super.key, required this.maNV});
  final String maNV;

  @override
  State<ThuchiPageReponsive> createState() => _ThuchiPageReponsiveState();
}

enum listthem { phieuthu, phieuchi }

class _ThuchiPageReponsiveState extends State<ThuchiPageReponsive> {
  final QuanLyThuChiProvider _quanLyThuChiProvider = QuanLyThuChiProvider();

  listthem? selectedMenu;
  @override
  void initState() {
    super.initState();
    _quanLyThuChiProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuanLyThuChiProvider>(
        create: (context) => _quanLyThuChiProvider,
        builder: (context, child) {
          return Consumer<QuanLyThuChiProvider>(
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
                                                width: 2,
                                                color: AppColors.Sepia)),
                                        child: PopupMenuButton<listthem>(
                                          initialValue: selectedMenu,
                                          child: Center(
                                            child: Text("Thêm",
                                                style: AppStyles.lato.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          onSelected: (value) {
                                            setState(() {
                                              selectedMenu = value;
                                            });

                                            if (selectedMenu ==
                                                listthem.phieuthu) {
                                              themphieuthu(
                                                  context, widget.maNV);
                                            } else {
                                              themphieuchi(
                                                  context, widget.maNV);
                                            }
                                          },
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<listthem>>[
                                            PopupMenuItem<listthem>(
                                              value: listthem.phieuthu,
                                              child: Text('Tạo phiếu thu',
                                                  style: AppStyles.lato
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            PopupMenuItem<listthem>(
                                              value: listthem.phieuchi,
                                              child: Text('Tạo phiếu chi',
                                                  style: AppStyles.lato
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 1550),
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
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            width: double.infinity,
                            child: TableThuChi(maNV: widget.maNV),
                          ),
                        ],
                      )),
                ));
          });
        });
  }
}
