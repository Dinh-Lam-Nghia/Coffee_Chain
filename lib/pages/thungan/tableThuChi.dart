import 'package:coffee_chain/module/thuNgan_provider/quanlythuChi_provider/TableTC_Provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'quanlythuchi/phieu_thu_chi/edit_phieuchi.dart';
import 'quanlythuchi/phieu_thu_chi/edit_phieuthu.dart';

class TableThuChi extends StatefulWidget {
  const TableThuChi({super.key, required this.maNV});
  final String maNV;

  @override
  State<TableThuChi> createState() => _TableThuChiState();
}

class _TableThuChiState extends State<TableThuChi> {
  final TableThuChiProvider _TCProvider = TableThuChiProvider();

  @override
  void initState() {
    super.initState();
    _TCProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableThuChiProvider>(
      create: (context) => _TCProvider,
      builder: (context, child) {
        return Consumer<TableThuChiProvider>(builder: (context, model, child) {
          return DataTable(
            columns: [
              const DataColumn(
                  label: Expanded(child: TextTable(text: "Ngày", color: 0))),
              const DataColumn(
                  label:
                      Expanded(child: TextTable(text: "Mã phiếu", color: 0))),
              const DataColumn(
                  label:
                      Expanded(child: TextTable(text: "Loại phiếu", color: 0))),
              const DataColumn(
                  label: Expanded(child: TextTable(text: "Số tiền", color: 0))),
              const DataColumn(
                  label: Expanded(
                      child: TextTable(text: "Người tạo phiếu", color: 0))),
              DataColumn(
                  label: Expanded(
                child: Center(
                  child: InkWell(
                    onTap: model.getTablePhieu,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.restart_alt_outlined,
                          color: AppColors.white,
                        )),
                  ),
                ),
              )),
            ],
            rows: [
              for (int i = 0; i < model.TablePhieu.length; i++)
                DataRow(cells: [
                  DataCell(TextTable(
                      text: model.TablePhieu[i].ngayThuTienTC.toString(),
                      color: 1)),
                  DataCell(TextTable(
                      text: model.TablePhieu[i].maPhieuTC.toString(),
                      color: 1)),
                  DataCell(TextTable(
                      text: model.TablePhieu[i].loaiPhieuTC.toString(),
                      color: 1)),
                  DataCell(TextTable(
                      text: model.TablePhieu[i].soTien.toString(), color: 1)),
                  DataCell(TextTable(
                      text: model.TablePhieu[i].ngayLapPhieuTC.toString(),
                      color: 1)),
                  DataCell(Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            String text =
                                model.TablePhieu[i].maPhieuTC.toString();
                            // print(text[1]);
                            (text[1] == 't' || text[1] == 'T')
                                ? editphieuthu(context,
                                    model.TablePhieu[i].maPhieuTC.toString())
                                : editphieuchi(context,
                                    model.TablePhieu[i].maPhieuTC.toString());
                          },
                          child: const EditDeleteOnlyTable(loai: 'edit')),
                      const SizedBox(width: 30),
                      InkWell(
                          onTap: () => model.deletePhieuTC(
                              model.TablePhieu[i].maPhieuTC.toString()),
                          child: const EditDeleteOnlyTable(loai: 'delete'))
                    ],
                  )),
                ])
            ],
          );
        });
      },
    );
  }
}
