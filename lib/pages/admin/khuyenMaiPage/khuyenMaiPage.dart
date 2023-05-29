import 'package:coffee_chain/module/admin_provider/khuyenMai_Provider.dart';
import 'package:coffee_chain/pages/admin/khuyenMaiPage/themKM.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KhuyenMaiPageReponsive extends StatelessWidget {
  const KhuyenMaiPageReponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    return KhuyenMaiPage(maNV: maNV);
  }
}

class KhuyenMaiPage extends StatefulWidget {
  const KhuyenMaiPage({super.key, required this.maNV});
  final String maNV;
  @override
  State<KhuyenMaiPage> createState() => _KhuyenMaiPageState();
}

class _KhuyenMaiPageState extends State<KhuyenMaiPage> {
  final KhuyenMaiPageprovider _khuyenMaiPageprovider = KhuyenMaiPageprovider();

  @override
  void initState() {
    super.initState();
    _khuyenMaiPageprovider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KhuyenMaiPageprovider>(
      create: (context) => _khuyenMaiPageprovider,
      builder: (context, child) {
        return Consumer<KhuyenMaiPageprovider>(
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
                              child: Material(
                                color: AppColors.white,
                                child: InkWell(
                                  onTap: () => themKM(context, widget.maNV),
                                  child: Container(
                                    width: 289,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: AppColors.Sepia)),
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
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: (model.listKhuyenMai != null)
                            ? Column(
                                children: [
                                  Container(
                                    height: 80,
                                    color: AppColors.grey,
                                    width: double.infinity,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Từ ngày: ",
                                                  style: AppStyles.lato
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              AppColors.Sepia),
                                                ),
                                                Container(
                                                  width: 260,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    border: Border.all(
                                                        width:
                                                            (model.errst == '')
                                                                ? 1
                                                                : 2,
                                                        color: (model.errst ==
                                                                '')
                                                            ? AppColors.black87
                                                            : AppColors.red),
                                                  ),
                                                  child: SizedBox(
                                                    child: DateInputPhaChe(
                                                      dateInput: model.tuNgay,
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
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  border: Border.all(
                                                      width:
                                                          (model.errend == '')
                                                              ? 1
                                                              : 2,
                                                      color: (model.errend ==
                                                              '')
                                                          ? AppColors.black87
                                                          : AppColors.red),
                                                ),
                                                child: SizedBox(
                                                  child: DateInputPhaChe(
                                                    dateInput: model.denNgay,
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
                                              onChanged: model.timkiem,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.black87),
                                              decoration: const InputDecoration(
                                                  hintText:
                                                      'Nhập tên khuyến mãi',
                                                  icon: Icon(Icons.search,
                                                      size: 40),
                                                  filled: true,
                                                  fillColor: AppColors.white,
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                          ),
                                          Material(
                                            color: AppColors.white,
                                            child: InkWell(
                                              onTap: model.getfollowNgay,
                                              splashColor: Colors.black26,
                                              child: SizedBox(
                                                width: 218,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Image.asset(
                                                    //   AppAssetIcon.iconExcel,
                                                    //   width: 40,
                                                    // ),
                                                    Icon(Icons.send),
                                                    Text("Search",
                                                        style: AppStyles.lato
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: model.clear,
                                            child: Icon(Icons.close),
                                          )
                                        ]),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: DataTable(columns: [
                                      const DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Mã khuyến mãi",
                                                  color: 0))),
                                      const DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Tên khuyến mãi",
                                                  color: 0))),
                                      const DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "mô tả", color: 0))),
                                      const DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Thời gian áp dụng",
                                                  color: 0))),
                                      const DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Giá trị khuyến mãi",
                                                  color: 0))),
                                      DataColumn(
                                          label: Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.brightPink,
                                              border: Border.all(
                                                  width: 2,
                                                  color: AppColors.white)),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () =>
                                                  model.getAccPQ(widget.maNV),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    // color: AppColors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
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
                                          i < model.listKhuyenMai.length;
                                          i++)
                                        DataRow(cells: [
                                          DataCell(TextTable(
                                              text: model.listKhuyenMai[i].maKM
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text: model.listKhuyenMai[i].tenKM
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text: model.listKhuyenMai[i].moTa
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text:
                                                  "${model.listKhuyenMai[i].tuNgay} - ${model.listKhuyenMai[i].denNgay}"
                                                      .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text: model
                                                  .listKhuyenMai[i].giaTriKM
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
                                                    child:
                                                        const EditDeleteOnlyTable(
                                                            loai: 'edit')),
                                                const SizedBox(width: 30),
                                                InkWell(
                                                    onTap: () => model.deleteKM(
                                                        model.listKhuyenMai[i]
                                                            .maKM
                                                            .toString()),
                                                    child:
                                                        const EditDeleteOnlyTable(
                                                            loai: 'delete'))
                                              ],
                                            ),
                                          )),
                                        ])
                                    ]),
                                  ),
                                ],
                              )
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
