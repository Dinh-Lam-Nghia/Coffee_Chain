import 'package:coffee_chain/module/admin_provider/thucDonPage_provider.dart';
import 'package:coffee_chain/pages/admin/thucDonPage/themTD.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThucDonPageReponsive extends StatelessWidget {
  const ThucDonPageReponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    return ThucDonPage(maNV: maNV);
  }
}

class ThucDonPage extends StatefulWidget {
  const ThucDonPage({super.key, required this.maNV});
  final String maNV;
  @override
  State<ThucDonPage> createState() => _ThucDonPageState();
}

class _ThucDonPageState extends State<ThucDonPage> {
  final ThucDonPageProvider _thucDonPageProvider = ThucDonPageProvider();

  @override
  void initState() {
    super.initState();
    _thucDonPageProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThucDonPageProvider>(
      create: (context) => _thucDonPageProvider,
      builder: (context, child) {
        return Consumer<ThucDonPageProvider>(
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
                                      onTap: () => themTD(context, widget.maNV),
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: 400,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: AppColors.Sepia)),
                                        child: TextFormField(
                                          onChanged: (value) =>
                                              model.timkiem(value),
                                          style: const TextStyle(
                                              fontSize: 25, height: 2),
                                          decoration: const InputDecoration(
                                              hintText: 'Nhập tên món',
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
                        child: (model.thucDonModel != null)
                            ? DataTable(columns: [
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Loại món", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Mã món", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Tên món", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Nhóm thực đơn", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child: TextTable(
                                            text: "Đơn vị tính", color: 0))),
                                const DataColumn(
                                    label: Expanded(
                                        child:
                                            TextTable(text: "Giá", color: 0))),
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
                                    i < model.thucDonModel.length;
                                    i++)
                                  DataRow(cells: [
                                    DataCell(TextTable(
                                        text: model.thucDonModel[i].loaiMon
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.thucDonModel[i].maMon
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.thucDonModel[i].tenMon
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.thucDonModel[i].nhomThucDon
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text: model.thucDonModel[i].donViTinh
                                            .toString(),
                                        color: 1)),
                                    DataCell(TextTable(
                                        text:
                                            '${int.parse(model.thucDonModel[i].giaTien.toString())}',
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
                                              onTap: () => model.delete(model
                                                  .thucDonModel[i].maMon
                                                  .toString()),
                                              child: const EditDeleteOnlyTable(
                                                  loai: 'delete'))
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
