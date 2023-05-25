import 'package:coffee_chain/module/thuNgan_provider/quanlythuChi_provider/themPhieu_thu_chi_provider/phieuchi_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void themphieuchi(BuildContext context, String maNV) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.Sepia,
          title: SizedBox(
              width: 1490,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thêm phiếu chi tiền",
                    style: AppStyles.lato.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.white,
                    ),
                  )
                ],
              )),
          content: ThemPhieuChiTienPage(maNV: maNV),
        );
      });
}

class ThemPhieuChiTienPage extends StatefulWidget {
  const ThemPhieuChiTienPage({super.key, required this.maNV});
  final String maNV;

  @override
  State<ThemPhieuChiTienPage> createState() => _ThemPhieuChiTienPageState();
}

class _ThemPhieuChiTienPageState extends State<ThemPhieuChiTienPage> {
  final PhieuChiProvider _phieuChiProvider = PhieuChiProvider();

  @override
  void initState() {
    super.initState();
    _phieuChiProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhieuChiProvider>(
        create: (context) => _phieuChiProvider,
        builder: (context, child) {
          return Consumer<PhieuChiProvider>(
            builder: (context, model, child) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    width: 1409,
                    height: 800,
                    color: AppColors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Mã PC: ",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black87,
                                    ),
                                  ),
                                  NhapXuatKhoInput(
                                      widthInput: 170,
                                      controller: model.maPC,
                                      readOnly: true)
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Ngày lập phiếu chi: ",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black87,
                                    ),
                                  ),
                                  Container(
                                    width: 170,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    child: DateInputPhaChe(
                                      dateInput: model.ngayLPC,
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Text(
                                  "Người lập phiếu: ",
                                  style: AppStyles.lato.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black87,
                                  ),
                                ),
                                NhapXuatKhoInput(
                                    widthInput: 240,
                                    controller: model.nguoiLPC,
                                    readOnly: true)
                              ]),
                              Container(
                                  padding: const EdgeInsets.only(top: 30),
                                  width: double.infinity,
                                  height: 630,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        height: 50,
                                        color: AppColors.brightPink,
                                        child: InkWell(
                                          onTap: () {},
                                          splashColor: AppColors.grey,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 50,
                                            child: Text(
                                              "Chi tiết",
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            decoration: const BoxDecoration(
                                              color: AppColors.white1,
                                              border: Border(
                                                top: BorderSide(
                                                  color: AppColors.Sepia,
                                                  width: 5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: SingleChildScrollView(
                                        child: Container(
                                            color: AppColors.white1,
                                            width: double.infinity,
                                            child: DataTable(
                                              columns: const [
                                                DataColumn(
                                                    label: Expanded(
                                                        child: TextTable(
                                                            text: "STT",
                                                            color: 0))),
                                                DataColumn(
                                                    label: Expanded(
                                                        child: TextTable(
                                                            text: "Chi phí NVL",
                                                            color: 0))),
                                                DataColumn(
                                                    label: Expanded(
                                                        child: TextTable(
                                                            text:
                                                                "Chi phí điện nước",
                                                            color: 0))),
                                                DataColumn(
                                                    label: Expanded(
                                                        child: TextTable(
                                                            text: "Khác",
                                                            color: 0))),
                                                DataColumn(
                                                    label: Expanded(
                                                        child: TextTable(
                                                            text: "Số tiền",
                                                            color: 0))),
                                                DataColumn(
                                                    label: Expanded(
                                                        child: TextTable(
                                                            text: "Ghi chú",
                                                            color: 0))),
                                              ],
                                              rows: [
                                                for (int i = 0;
                                                    i < model.phieuChi.length;
                                                    i++)
                                                  DataRow(cells: [
                                                    DataCell(TextTable(
                                                        text: model
                                                            .phieuChi[i].SoTT
                                                            .toString(),
                                                        color: 1)),
                                                    DataCell(TextTable(
                                                        text: model
                                                            .phieuChi[i].ChiPNVL
                                                            .toString(),
                                                        color: 1)),
                                                    DataCell(TextTable(
                                                        text: model
                                                            .phieuChi[i].ChiPDN
                                                            .toString(),
                                                        color: 1)),
                                                    DataCell(TextTable(
                                                        text: model
                                                            .phieuChi[i].Khac
                                                            .toString(),
                                                        color: 1)),
                                                    DataCell(TextTable(
                                                        text: model.phieuChi[i]
                                                            .TongTien
                                                            .toString(),
                                                        color: 1)),
                                                    DataCell(TextTable(
                                                        text: model
                                                            .phieuChi[i].Ghichu
                                                            .toString(),
                                                        color: 1)),
                                                  ])
                                              ],
                                            )),
                                      )),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Tổng phải thu:        ${model.sum.toString()} VND",
                                          style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 80),
                                        child: Row(children: [
                                          Material(
                                            color: AppColors.grey1,
                                            child: InkWell(
                                              onTap: () =>
                                                  model.luuPhieuTC(context),
                                              splashColor: AppColors.black26,
                                              child: const NhapXuatKhoPutton(
                                                  width: 125,
                                                  height: 40,
                                                  icon: Icons.save,
                                                  text: "Lưu"),
                                            ),
                                          ),
                                          const SizedBox(width: 30),
                                          Material(
                                            color: AppColors.grey1,
                                            child: InkWell(
                                              onTap: () =>
                                                  model.clickHuy(context),
                                              splashColor: AppColors.black26,
                                              child: const NhapXuatKhoPutton(
                                                  width: 125,
                                                  height: 40,
                                                  icon: Icons.close,
                                                  text: "Hủy bỏ"),
                                            ),
                                          ),
                                          const SizedBox(width: 30),
                                          Material(
                                            color: AppColors.grey1,
                                            child: InkWell(
                                              onTap: () {},
                                              splashColor: AppColors.black26,
                                              child: const SizedBox(
                                                width: 125,
                                                height: 40,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.help_outline),
                                                      Text("Giúp")
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
