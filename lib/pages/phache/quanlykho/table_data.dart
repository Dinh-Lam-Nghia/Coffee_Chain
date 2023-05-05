import 'package:coffee_chain/module/phaChe_provider/quanLykho_provider/table1QLK_Provider.dart';
import 'package:coffee_chain/module/phaChe_provider/quanLykho_provider/table2TK_QLK_Provider.dart';
import 'package:coffee_chain/pages/phache/quanlykho/phieu_nhap_xuat/edit_phieunhapkho.dart';
import 'package:coffee_chain/pages/phache/quanlykho/phieu_nhap_xuat/edit_phieuxuatkho.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableData1 extends StatefulWidget {
  const TableData1({super.key});

  @override
  State<TableData1> createState() => _TableData1State();
}

class _TableData1State extends State<TableData1> {
  final TablePhieuProvider _phieuProvider = TablePhieuProvider();

  @override
  void initState() {
    super.initState();
    _phieuProvider.getTablePhieu();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TablePhieuProvider>(
      create: (context) => _phieuProvider,
      builder: (context, child) {
        return Consumer<TablePhieuProvider>(
          builder: (context, model, child) {
            return model.TablePhieu.isNotEmpty
                ? DataTable(columns: const [
                    DataColumn(
                        label:
                            Expanded(child: TextTable(text: "Ngày", color: 0))),
                    DataColumn(
                        label: Expanded(
                            child: TextTable(text: "Mã phiếu", color: 0))),
                    DataColumn(
                        label: Expanded(
                            child: TextTable(text: "Loại phiếu", color: 0))),
                    DataColumn(
                        label: Expanded(
                            child: TextTable(text: "Số tiền", color: 0))),
                    DataColumn(
                        label: Expanded(
                            child:
                                TextTable(text: "Người tạo phiếu", color: 0))),
                    DataColumn(label: Text('')),
                  ], rows: [
                    for (int i = 0; i < model.TablePhieu.length; i++)
                      DataRow(cells: [
                        DataCell(TextTable(
                            text: model.TablePhieu[i].ngayTao.toString(),
                            color: 1)),
                        DataCell(TextTable(
                            text: model.TablePhieu[i].maPhieu.toString(),
                            color: 1)),
                        DataCell(TextTable(
                            text: model.TablePhieu[i].loaiPhieu.toString(),
                            color: 1)),
                        DataCell(TextTable(
                            text: model.TablePhieu[i].soTien.toString(),
                            color: 1)),
                        DataCell(TextTable(
                            text: model.TablePhieu[i].nguoiTaoPhieu.toString(),
                            color: 1)),
                        DataCell(Center(
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    String text =
                                        model.TablePhieu[i].maPhieu.toString();
                                    // print(text[1]);
                                    (text[1] == 'n' || text[1] == 'N')
                                        ? editphieunhapkho(
                                            context,
                                            model.TablePhieu[i].maPhieu
                                                .toString())
                                        : editphieuxuatkho(
                                            context,
                                            model.TablePhieu[i].maPhieu
                                                .toString());
                                  },
                                  child:
                                      const EditDeleteOnlyTable(loai: 'edit')),
                              const SizedBox(width: 30),
                              InkWell(
                                  onTap: () {},
                                  child:
                                      const EditDeleteOnlyTable(loai: 'delete'))
                            ],
                          ),
                        )),
                      ])
                  ])
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        );
      },
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
class TableData2 extends StatefulWidget {
  const TableData2({super.key});

  @override
  State<TableData2> createState() => _TableData2State();
}

class _TableData2State extends State<TableData2> {
  final ThongKeKhoProvider _thongKeKhoProvoder = ThongKeKhoProvider();

  @override
  void initState() {
    super.initState();
    _thongKeKhoProvoder.getlistThongKeKho();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThongKeKhoProvider>(
      create: (context) => _thongKeKhoProvoder,
      builder: (context, child) {
        return Consumer<ThongKeKhoProvider>(
          builder: (context, model, child) {
            return Column(children: [
              Container(
                height: 80,
                color: AppColors.grey,
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: Container(
                          width: 260,
                          height: 50,
                          color: AppColors.white,
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text("Tháng này ",
                                    style: AppStyles.lato
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: const Icon(Icons.keyboard_arrow_down,
                                    size: 40, color: AppColors.Sepia),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "Từ ngày: ",
                              style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.Sepia),
                            ),
                            Container(
                              width: 260,
                              height: 50,
                              color: AppColors.white,
                              child: SizedBox(
                                child: DateInputPhaChe(
                                  dateInput: model.stackDateInput,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(children: [
                          Text(
                            "Đến ngày: ",
                            style: AppStyles.lato.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.Sepia),
                          ),
                          Container(
                            width: 260,
                            height: 50,
                            color: AppColors.white,
                            child: SizedBox(
                              child: DateInputPhaChe(
                                dateInput: model.endDateInput,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        width: 450,
                        height: 50,
                        color: AppColors.white,
                        child: TextFormField(
                          controller: model.timKiem,
                          style: const TextStyle(
                              fontSize: 20, color: AppColors.black87),
                          decoration: const InputDecoration(
                              hintText: "Lấy dữ liệu",
                              icon: Icon(Icons.search, size: 40),
                              filled: true,
                              fillColor: AppColors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Material(
                        color: AppColors.white,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.black26,
                          child: SizedBox(
                            width: 218,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppAssetIcon.iconExcel,
                                  width: 40,
                                ),
                                Text("Xuất file Excel",
                                    style: AppStyles.lato
                                        .copyWith(fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: DataTable(columns: const [
                  DataColumn(label: Expanded(child: Text(''))),
                  DataColumn(
                      label:
                          Expanded(child: TextTable(text: "Mã NVL", color: 0))),
                  DataColumn(
                      label: Expanded(
                          child: TextTable(text: "Tên NVL", color: 0))),
                  DataColumn(
                      label: Expanded(
                          child: TextTable(text: "Đơn vị tính", color: 0))),
                  DataColumn(
                      label: Expanded(
                          child: TextTable(text: "Số lượng tồn", color: 0))),
                  DataColumn(
                      label: Expanded(
                          child: TextTable(text: "Tồn đầu kỳ", color: 0))),
                  DataColumn(
                      label: Expanded(
                          child: TextTable(text: "SL nhập", color: 0))),
                  DataColumn(
                      label: Expanded(
                          child: TextTable(text: "SL xuất", color: 0))),
                ], rows: [
                  for (int i = 0; i < model.TKkho.length; i++)
                    DataRow(cells: [
                      DataCell(TextButton(
                          onPressed: () {},
                          child:
                              const TextTable(text: 'Xem chi tiết', color: 1))),
                      DataCell(TextTable(
                          text: model.TKkho[i].maNVL.toString(), color: 1)),
                      DataCell(TextTable(
                          text: model.TKkho[i].tenNVL.toString(), color: 1)),
                      DataCell(TextTable(
                          text: model.TKkho[i].donViTinh.toString(), color: 1)),
                      DataCell(TextTable(
                          text: model.TKkho[i].soLuongTon.toString(),
                          color: 1)),
                      DataCell(TextTable(
                          text: model.TKkho[i].tonDauKy.toString(), color: 1)),
                      DataCell(TextTable(
                          text: model.TKkho[i].slNhap.toString(), color: 1)),
                      DataCell(TextTable(
                          text: model.TKkho[i].slxuat.toString(), color: 1)),
                    ]),
                ]),
              ),
            ]);
          },
        );
      },
    );
  }
}
