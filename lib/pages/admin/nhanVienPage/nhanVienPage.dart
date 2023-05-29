import 'package:coffee_chain/module/admin_provider/phanQuyenNV_provider.dart';
import 'package:coffee_chain/pages/admin/nhanVienPage/phanQuyenNV.dart';
import 'package:coffee_chain/pages/admin/nhanVienPage/themNV.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../module/admin_provider/nhanVienPage_provider.dart';

class NhanVienPageReponsive extends StatelessWidget {
  const NhanVienPageReponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    return NhanVienPage(maNV: maNV);
  }
}

class NhanVienPage extends StatefulWidget {
  const NhanVienPage({super.key, required this.maNV});
  final String maNV;
  @override
  State<NhanVienPage> createState() => _NhanVienPageState();
}

class _NhanVienPageState extends State<NhanVienPage> {
  final NhanVienPageProvider _nhanVienPageProvider = NhanVienPageProvider();
  @override
  void initState() {
    super.initState();
    _nhanVienPageProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NhanVienPageProvider>(
      create: (context) => _nhanVienPageProvider,
      builder: (context, child) {
        return Consumer<NhanVienPageProvider>(
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
                                  Material(
                                    color: AppColors.white,
                                    child: InkWell(
                                      onTap: () => themNV(context, widget.maNV),
                                      child: Container(
                                        width: 289,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: AppColors.Sepia)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Thêm",
                                              style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.brownBlack,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Material(
                                    color: AppColors.white,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: 400,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: AppColors.Sepia)),
                                        child: TextFormField(
                                          onChanged: (value) =>
                                              model.timKiem(value),
                                          style: const TextStyle(
                                              fontSize: 25, height: 2),
                                          decoration: const InputDecoration(
                                              hintText: 'Nhập tên nhân viên',
                                              icon: Icon(
                                                Icons.search,
                                                size: 30,
                                              ),
                                              border: InputBorder.none),
                                        )),
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
                              XDTrang: 'Admin',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: (model.nhanVienModel != null)
                            ? DataTable(columns: [
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Mã nhân viên", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Tên đăng nhập", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Tên nhân viên", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Ngày sinh", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Giới tính", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Ca làm việc", color: 0))),
                                DataColumn(
                                    label: Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.brightPink,
                                        border: Border.all(
                                            width: 2, color: AppColors.white)),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () =>
                                            model.getAccPQ(widget.maNV),
                                        child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              // color: AppColors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: const Icon(
                                              Icons.restart_alt_outlined,
                                              color: AppColors.white,
                                            )),
                                      ),
                                    ),
                                  ),
                                )),
                              ], rows: [
                                for (int i = 0;
                                    i < model.nhanVienModel.length;
                                    i++)
                                  DataRow(cells: [
                                    DataCell(TextTable(
                                        text: model.nhanVienModel[i].maNV
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.getTenDangNhap(model
                                            .nhanVienModel[i].maNV
                                            .toString()),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.nhanVienModel[i].tenNV
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.nhanVienModel[i].ngaySinh
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.nhanVienModel[i].gioiTinh
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.nhanVienModel[i].caLamViec
                                            .toString(),
                                        color: 1)),
                                    DataCell(Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          border: Border.all(
                                              width: 2,
                                              color: AppColors.white)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {},
                                              child: const EditDeleteOnlyTable(
                                                  loai: 'edit')),
                                          const SizedBox(width: 30),
                                          InkWell(
                                              onTap: () => model.delete(
                                                  model.nhanVienModel[i].maNV
                                                      .toString(),
                                                  model.nhanVienModel[i].coSo
                                                      .toString()),
                                              child: const EditDeleteOnlyTable(
                                                  loai: 'delete')),
                                          const SizedBox(width: 30),
                                          InkWell(
                                              onTap: () => phanQuyenNV(
                                                    context,
                                                    widget.maNV,
                                                    model.nhanVienModel[i].maNV
                                                        .toString(),
                                                    model.nhanVienModel[i].coSo
                                                        .toString(),
                                                    // model.nhanVienModel[i].tenNV.toString(),
                                                  ),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.amber[700],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: const Icon(
                                                    Icons
                                                        .admin_panel_settings_rounded,
                                                    color: AppColors.white,
                                                  ))),
                                        ],
                                      ),
                                    )),
                                  ])
                              ])
                            : Container(),
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
