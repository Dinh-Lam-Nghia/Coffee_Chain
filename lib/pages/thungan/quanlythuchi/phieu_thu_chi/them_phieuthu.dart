import 'package:coffee_chain/module/thuNgan_provider/quanlythuChi_provider/themPhieu_thu_chi_provider/phieuthu_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void themphieuthu(BuildContext context, String maNV) async {
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
                    "Thêm phiếu thu tiền",
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
          content: ThemPhieuThuTienPage(maNV: maNV),
        );
      });
}

class ThemPhieuThuTienPage extends StatefulWidget {
  const ThemPhieuThuTienPage({super.key, required this.maNV});
  final String maNV;

  @override
  State<ThemPhieuThuTienPage> createState() => _ThemPhieuThuTienPageState();
}

class _ThemPhieuThuTienPageState extends State<ThemPhieuThuTienPage> {
  final PhieuThuProvider _phieuThuProvider = PhieuThuProvider();

  @override
  void initState() {
    super.initState();
    _phieuThuProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhieuThuProvider>(
        create: (context) => _phieuThuProvider,
        builder: (context, child) {
          return Consumer<PhieuThuProvider>(builder: (context, model, child) {
            return Scaffold(
                body: SingleChildScrollView(
              child: Container(
                  width: 1490,
                  height: 800,
                  color: AppColors.white,
                  child: Column(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Mã PT: ",
                                style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black87,
                                ),
                              ),
                              ThuChiInput(
                                  widthInput: 170,
                                  controller: model.maPhieuTC,
                                  readOnly: true)
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
                            ThuChiInput(
                                widthInput: 240,
                                controller: model.nguoiLPT,
                                readOnly: true)
                          ]),
                          Row(children: [
                            Text(
                              "Ngày thu tiền: ",
                              style: AppStyles.lato.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.black87,
                              ),
                            ),
                            Container(
                              width: 170,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.grey,
                                ),
                              ),
                              child: DateInputPhaChe(
                                dateInput: model.ngayThuTien,
                              ),
                            ),
                          ]),
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.grey,
                              ),
                            ),
                            child: TextFormField(
                              controller: model.layDL,
                              onChanged: model.timkiem,
                              style: const TextStyle(
                                  fontSize: 20, color: AppColors.black87),
                              decoration: InputDecoration(
                                  hintStyle: AppStyles.lato.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black87,
                                  ),
                                  icon: const Icon(Icons.search, size: 40),
                                  filled: true,
                                  fillColor: AppColors.white,
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          Text(
                            "Số dư đầu ngày: ",
                            style: AppStyles.lato.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black87,
                            ),
                          ),
                          NhapXuatKhoInput(
                              widthInput: 170, controller: model.soDuDauNgay)
                        ]),
                        Row(children: [
                          Text(
                            "Số dư cuối ngày: ",
                            style: AppStyles.lato.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black87,
                            ),
                          ),
                          NhapXuatKhoInput(
                              widthInput: 250, controller: model.soDuCuoiNgay)
                        ]),
                      ],
                    ),
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
                                    style: AppStyles.lato
                                        .copyWith(fontWeight: FontWeight.w700),
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
                                                    text:
                                                        "Ngày giờ lập hóa đơn",
                                                    color: 0))),
                                        DataColumn(
                                            label: Expanded(
                                                child: TextTable(
                                                    text: "Mã hóa đơn",
                                                    color: 0))),
                                        DataColumn(
                                            label: Expanded(
                                                child: TextTable(
                                                    text: "Người tạo hóa đơn",
                                                    color: 0))),
                                        DataColumn(
                                            label: Expanded(
                                                child: TextTable(
                                                    text: "Số tiền phải thu",
                                                    color: 0))),
                                        DataColumn(
                                            label: Expanded(
                                                child: TextTable(
                                                    text: "Xem lại hóa đơn",
                                                    color: 0))),
                                      ],
                                      rows: [
                                        for (int i = 0;
                                            i < model.phieuThu.length;
                                            i++)
                                          DataRow(cells: [
                                            DataCell(TextTable(
                                                text: model
                                                    .phieuThu[i].ngayGioLHD
                                                    .toString(),
                                                color: 1)),
                                            DataCell(TextTable(
                                                text: model.phieuThu[i].maHD
                                                    .toString(),
                                                color: 1)),
                                            DataCell(TextTable(
                                                text: model.phieuThu[i].nguoiTHD
                                                    .toString(),
                                                color: 1)),
                                            DataCell(TextTable(
                                                text: model.phieuThu[i].soTPT
                                                    .toString(),
                                                color: 1)),
                                            DataCell(TextTable(
                                                text: model.phieuThu[i].xemLHD
                                                    .toString(),
                                                color: 1)),
                                            DataCell(IconButton(
                                              onPressed: () => model.xoaDong(
                                                  model.phieuThu[i].id
                                                      .toString()),
                                              icon: const Icon(
                                                  Icons.delete_forever),
                                            ))
                                          ]),
                                      ],
                                    )),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Tổng phải thu:        ${model.sum.toString()} VND",
                                style: AppStyles.lato
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 80),
                                      child: Material(
                                        color: AppColors.grey1,
                                        child: InkWell(
                                          onTap: () {
                                            themDong(context, model);
                                          },
                                          splashColor: AppColors.black26,
                                          child: const NhapXuatKhoPutton(
                                              width: 125,
                                              height: 35,
                                              icon:
                                                  Icons.control_point_outlined,
                                              text: "Thêm dòng"),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 80),
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
                                            child: SizedBox(
                                              width: 125,
                                              height: 40,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.help_outline),
                                                    Text("Giúp")
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ]),
                            )
                          ],
                        ))
                  ])),
            ));
          });
        });
  }
}

Widget themD(PhieuThuProvider model) {
  return SingleChildScrollView(
    child: Container(
        padding: const EdgeInsets.only(right: 30),
        width: 600,
        color: AppColors.Sepia,
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "* Mã phiếu: ",
                    style: AppStyles.lato.copyWith(
                      color: AppColors.white,
                      fontSize: 25,
                    ),
                  ),
                  NhapXuatKhoInput(
                    widthInput: 400,
                    controller: model.maphieu,
                    readOnly: true,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "* Ngày GLHD: ",
                    style: AppStyles.lato.copyWith(
                      color: AppColors.white,
                      fontSize: 25,
                    ),
                  ),
                  NhapXuatKhoInput(
                    widthInput: 400,
                    controller: model.ngayGLHD,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "* Mã hóa đơn: ",
                    style: AppStyles.lato.copyWith(
                      color: AppColors.white,
                      fontSize: 25,
                    ),
                  ),
                  NhapXuatKhoInput(
                    widthInput: 400,
                    controller: model.maHD,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "* Người THĐ: ",
                    style: AppStyles.lato.copyWith(
                      color: AppColors.white,
                      fontSize: 25,
                    ),
                  ),
                  NhapXuatKhoInput(
                    widthInput: 400,
                    controller: model.nguoiTHD,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "* Số TPT: ",
                    style: AppStyles.lato.copyWith(
                      color: AppColors.white,
                      fontSize: 25,
                    ),
                  ),
                  NhapXuatKhoInput(
                    widthInput: 400,
                    controller: model.soTPT,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "* Xem LHD: ",
                    style: AppStyles.lato.copyWith(
                      color: AppColors.white,
                      fontSize: 25,
                    ),
                  ),
                  NhapXuatKhoInput(
                    widthInput: 400,
                    controller: model.xemLHD,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(left: 80),
              child: const Material(
                color: AppColors.grey1,
                child: InkWell(
                  splashColor: AppColors.black26,
                  child: NhapXuatKhoPutton(
                    width: 200,
                    height: 35,
                    icon: Icons.control_point_outlined,
                    text: "Thêm",
                  ),
                ),
              ),
            ),
          ],
        )),
  );
}

void themDong(BuildContext context, PhieuThuProvider model) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.Sepia,
        title: SizedBox(
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          ),
        ),
        content: themD(model),
      );
    },
  );
}
