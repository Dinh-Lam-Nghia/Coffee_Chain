import 'package:coffee_chain/module/phaChe_provider/quanLykho_provider/themPhieu_nhap_xuat_provider/phieunhap_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void themphieunhapkho(BuildContext context, String maNV) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.Sepia,
        title: SizedBox(
          width: 1490,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Thêm phiếu nhập kho",
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
          ),
        ),
        content: ThemPhieuNhapKhoPage(maNV: maNV),
      );
    },
  );
}

class ThemPhieuNhapKhoPage extends StatefulWidget {
  const ThemPhieuNhapKhoPage({super.key, required this.maNV});
  final String maNV;

  @override
  State<ThemPhieuNhapKhoPage> createState() => _ThemPhieuNhapKhoPageState();
}

class _ThemPhieuNhapKhoPageState extends State<ThemPhieuNhapKhoPage> {
  final PhieuNhapProvider _phieuNhapProvider = PhieuNhapProvider();

  @override
  void initState() {
    super.initState();
    _phieuNhapProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhieuNhapProvider>(
      create: (context) => _phieuNhapProvider,
      builder: (context, child) {
        return Consumer<PhieuNhapProvider>(
          builder: (context, model, child) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                    width: 1490,
                    height: 800,
                    color: AppColors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(children: [
                                Text(
                                  "Mã phiếu nhập: ",
                                  style: AppStyles.lato.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black87,
                                  ),
                                ),
                                NhapXuatKhoInput(
                                    widthInput: 170,
                                    controller: model.maPN,
                                    readOnly: true)
                              ]),
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
                                    controller: model.nguoiLPN,
                                    readOnly: true)
                              ]),
                              Row(children: [
                                Text(
                                  "Ngày lập phiếu: ",
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
                                    dateInput: model.ngayNhapPhieu,
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
                                "Người giao: ",
                                style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black87,
                                ),
                              ),
                              NhapXuatKhoInput(
                                  widthInput: 170, controller: model.nguoiGiao)
                            ]),
                            Row(children: [
                              Text(
                                "Nhà cung cấp: ",
                                style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black87,
                                ),
                              ),
                              NhapXuatKhoInput(
                                  widthInput: 250, controller: model.nhaCungCap)
                            ]),
                            Row(children: [
                              Text(
                                "Chi phí dịch vụ: ",
                                style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black87,
                                ),
                              ),
                              NhapXuatKhoInput(
                                  widthInput: 150, controller: model.chiPhiDV)
                            ]),
                            Row(children: [
                              Text(
                                "Chi phí khác: ",
                                style: AppStyles.lato.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black87,
                                ),
                              ),
                              NhapXuatKhoInput(
                                  widthInput: 150, controller: model.chiPhiKhac)
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

                              //
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    color: AppColors.white1,
                                    width: double.infinity,
                                    child: DataTable(columns: const [
                                      DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Mã NVL", color: 0))),
                                      DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Tên NVL", color: 0))),
                                      DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Đơn vị tính",
                                                  color: 0))),
                                      DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Số lượng", color: 0))),
                                      DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "HSD", color: 0))),
                                      DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Đơn giá", color: 0))),
                                      DataColumn(
                                          label: Expanded(
                                              child: TextTable(
                                                  text: "Thành tiền",
                                                  color: 0))),
                                      DataColumn(
                                          label: Expanded(child: Text(""))),
                                    ], rows: [
                                      for (int i = 0;
                                          i < model.phieuNhap.length;
                                          i++)
                                        DataRow(cells: [
                                          DataCell(TextTable(
                                              text: model.phieuNhap[i].maNVL
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text: model.phieuNhap[i].tenNVL
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text: model.phieuNhap[i].donViTinh
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text: model.phieuNhap[i].sLuong
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text: model.phieuNhap[i].hsd
                                                  .toString(),
                                              color: 1)),
                                          DataCell(TextTable(
                                              text:
                                                  '${model.phieuNhap[i].donGia.toString()} VND',
                                              color: 1)),
                                          DataCell(TextTable(
                                              text:
                                                  '${model.phieuNhap[i].thanhTien.toString()} VND'
                                                      .toString(),
                                              color: 1)),
                                          DataCell(IconButton(
                                            onPressed: () => model.xoaDong(model
                                                .phieuNhap[i].id
                                                .toString()),
                                            icon: const Icon(
                                                Icons.delete_forever),
                                          ))
                                        ]),
                                    ]),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Tổng:        ${model.sum.toString()} VND",
                                  style: AppStyles.lato
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              //
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 80),
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
                                                icon: Icons
                                                    .control_point_outlined,
                                                text: "Thêm dòng"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 80),
                                        child: Row(children: [
                                          Material(
                                            color: AppColors.grey1,
                                            child: InkWell(
                                              onTap: () =>
                                                  model.luuPhieuNX(context),
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
                                                        MainAxisAlignment
                                                            .center,
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
                          ),
                        )
                      ],
                    )),
              ),
            );
          },
        );
      },
    );
  }
}

Widget themD(PhieuNhapProvider model) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(right: 30),
      width: 600,
      color: AppColors.Sepia,
      child: Column(
        children: [
          Text(
            model.er,
            style: const TextStyle(fontSize: 30, color: AppColors.red),
          ),
          const SizedBox(height: 30),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "* Mã Phiếu: ",
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
                  "* Mã NVL: ",
                  style: AppStyles.lato.copyWith(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                NhapXuatKhoInput(
                  widthInput: 400,
                  controller: model.maNVL,
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
                  "* Tên NVL: ",
                  style: AppStyles.lato.copyWith(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                NhapXuatKhoInput(
                  widthInput: 400,
                  controller: model.tenNVL,
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
                  "* Đơn vị tính: ",
                  style: AppStyles.lato.copyWith(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                NhapXuatKhoInput(
                  widthInput: 400,
                  controller: model.donViTinh,
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
                  "* Số lượng: ",
                  style: AppStyles.lato.copyWith(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                NhapXuatKhoInput(
                  widthInput: 400,
                  controller: model.soLuong,
                  db: 2,
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
                  "HSD: ",
                  style: AppStyles.lato.copyWith(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                NhapXuatKhoInput(
                  widthInput: 400,
                  controller: model.hsd,
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
                  "* Đơn giá: ",
                  style: AppStyles.lato.copyWith(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                NhapXuatKhoInput(
                  widthInput: 400,
                  controller: model.donGia,
                  db: 2,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(left: 80),
            child: Material(
              color: AppColors.grey1,
              child: InkWell(
                onTap: model.validateThemdong,
                splashColor: AppColors.black26,
                child: const ThuChiPutton(
                  width: 200,
                  height: 35,
                  icon: Icons.control_point_outlined,
                  text: "Thêm",
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void themDong(BuildContext context, PhieuNhapProvider model) async {
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
