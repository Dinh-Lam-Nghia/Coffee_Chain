import 'package:coffee_chain/module/admin_provider/khuyenMai_Provider.dart';
import 'package:coffee_chain/module/admin_provider/nhanVienPage_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> themKM(
  BuildContext context,
  String maNV,
) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: AppColors.Sepia,
          title: SizedBox(
            width: 1000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thêm khuyến mãi',
                  style: AppStyles.lato.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.clear_outlined,
                        color: AppColors.white))
              ],
            ),
          ),
          content: themKMDialog(
            maNV: maNV,
          ));
    },
  );
}

class themKMDialog extends StatefulWidget {
  const themKMDialog({
    super.key,
    required this.maNV,
  });
  final String maNV;

  @override
  State<themKMDialog> createState() => _themKMDialogState();
}

class _themKMDialogState extends State<themKMDialog> {
  final KhuyenMaiPageprovider _khuyenMaiPageprovider = KhuyenMaiPageprovider();

  @override
  void initState() {
    super.initState();
    _khuyenMaiPageprovider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<KhuyenMaiPageprovider>(
      create: (context) => _khuyenMaiPageprovider,
      builder: (context, child) {
        return Consumer<KhuyenMaiPageprovider>(
          builder: (context, model, child) {
            return SingleChildScrollView(
                child: Container(
              width: 100,
              color: AppColors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Row(children: [
                              Text(
                                'Mã khuyến mãi ',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              ),
                              Text(
                                '(*)',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: model.maKM,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                errorText: model.errMa,
                                border: (model.errMa != '')
                                    ? const OutlineInputBorder()
                                    : InputBorder.none,
                              ),
                              onChanged: (value) => model.checkMaKM(value),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Row(children: [
                              Text(
                                'Tên khuyến mãi ',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              ),
                              Text(
                                '(*)',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: model.tenKM,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                errorText: model.errTen,
                                border: (model.errTen != '')
                                    ? const OutlineInputBorder()
                                    : InputBorder.none,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Row(children: [
                              Text(
                                'Giá trị khuyến mãi ',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              ),
                              Text(
                                '(*)',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: model.giaTri,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                errorText: model.errGia,
                                border: (model.errGia != '')
                                    ? const OutlineInputBorder()
                                    : InputBorder.none,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Row(children: [
                              Text(
                                'Mô tả ',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              ),
                              Text(
                                '(*)',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: model.moTa,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                errorText: model.errMota,
                                border: (model.errMota != '')
                                    ? const OutlineInputBorder()
                                    : InputBorder.none,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                'Từ ',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              ),
                              Text(
                                '(*)',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                  width: (model.errTu == '') ? 1 : 2,
                                  color: (model.errTu == '')
                                      ? AppColors.black87
                                      : AppColors.red),
                            ),
                            child: DateInputPhaChe(
                              dateInput: model.tuNgayt,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                'đến ',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              ),
                              Text(
                                '(*)',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                  width: (model.errDen == '') ? 1 : 2,
                                  color: (model.errDen == '')
                                      ? AppColors.black87
                                      : AppColors.red),
                            ),
                            child: DateInputPhaChe(
                              dateInput: model.denNgayt,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                'Điều kiện áp dụng ',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              ),
                              Text(
                                '(*)',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: (model.errDK == '') ? 1 : 2,
                                  color: (model.errDK == '')
                                      ? AppColors.black87
                                      : AppColors.red)),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Radio(
                                              fillColor: MaterialStateColor
                                                  .resolveWith((states) =>
                                                      AppColors.Sepia),
                                              focusColor: MaterialStateColor
                                                  .resolveWith((states) =>
                                                      AppColors.Sepia),
                                              value: 'giamgia',
                                              groupValue: model.DKapDung,
                                              onChanged: (value) =>
                                                  model.dkap(value!),
                                            ),
                                            Text(
                                              "Giảm giá",
                                              style: AppStyles.lato.copyWith(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: (model.DKapDung == 'giamgia')
                                          ? Expanded(
                                              flex: 3,
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Tổng tiền hóa đơn ≥ ",
                                                      style: AppStyles.lato
                                                          .copyWith(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200),
                                                    ),
                                                    Expanded(
                                                        flex: 3,
                                                        child: TextFormField(
                                                          controller:
                                                              model.tongTienHD,
                                                          decoration:
                                                              InputDecoration(
                                                            errorText:
                                                                model.errTT,
                                                            filled: true,
                                                            fillColor:
                                                                AppColors.grey1,
                                                            border: (model
                                                                        .errTT !=
                                                                    '')
                                                                ? const OutlineInputBorder()
                                                                : InputBorder
                                                                    .none,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(children: [
                                  Container(
                                    width: double.infinity,
                                    child: Row(children: [
                                      Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => AppColors.Sepia),
                                        focusColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => AppColors.Sepia),
                                        value: 'tangmon',
                                        groupValue: model.DKapDung,
                                        onChanged: (value) =>
                                            model.dkap(value!),
                                      ),
                                      Text(
                                        "Tặng món",
                                        style: AppStyles.lato.copyWith(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ]),
                                  ),
                                  Container(
                                    child: (model.DKapDung == 'tangmon')
                                        ? SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width:
                                                                      (model.errMon ==
                                                                              '')
                                                                          ? 1
                                                                          : 2,
                                                                  color: (model
                                                                              .errMon ==
                                                                          '')
                                                                      ? AppColors
                                                                          .black87
                                                                      : AppColors
                                                                          .red)),
                                                          child: DropdownButton(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            // elevation: 16,
                                                            value: model.mon,
                                                            items: [
                                                              const DropdownMenuItem(
                                                                value: 'null',
                                                                child: Text(
                                                                    'Chọn món'),
                                                              ),
                                                              for (int i = 0;
                                                                  i <
                                                                      model
                                                                          .monModel
                                                                          .length;
                                                                  i++)
                                                                DropdownMenuItem(
                                                                  value: model
                                                                      .monModel[
                                                                          i]
                                                                      .maMon,
                                                                  child: Text(model
                                                                      .monModel[
                                                                          i]
                                                                      .tenMon
                                                                      .toString()),
                                                                ),
                                                            ],
                                                            onChanged: (value) {
                                                              model.chonMonTang(
                                                                  value
                                                                      .toString());
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width:
                                                                      (model.errSL ==
                                                                              '')
                                                                          ? 1
                                                                          : 2,
                                                                  color: (model
                                                                              .errSL ==
                                                                          '')
                                                                      ? AppColors
                                                                          .black87
                                                                      : AppColors
                                                                          .red)),
                                                          child: TextFormField(
                                                            controller:
                                                                model.slMonTang,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  'số lượng',
                                                              filled: true,
                                                              fillColor:
                                                                  AppColors
                                                                      .grey1,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Container(
                                                        color: AppColors.Sepia,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 30,
                                                                vertical: 10),
                                                        child: TextButton(
                                                            onPressed: () =>
                                                                model
                                                                    .okChonMon(),
                                                            child: Text(
                                                              'Oke',
                                                              style: AppStyles
                                                                  .lato
                                                                  .copyWith(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: AppColors
                                                                    .white,
                                                              ),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child:
                                                      DataTable(columns: const [
                                                    DataColumn(
                                                        label: Expanded(
                                                            child: TextTable(
                                                                text: "Tên món",
                                                                color: 0))),
                                                    DataColumn(
                                                        label: Expanded(
                                                            child: TextTable(
                                                                text:
                                                                    "Số lượng món",
                                                                color: 0))),
                                                    DataColumn(
                                                        label: SizedBox()),
                                                  ], rows: [
                                                    for (int i = 0;
                                                        i <
                                                            model.listMonTang
                                                                .length;
                                                        i++)
                                                      DataRow(cells: [
                                                        DataCell(TextTable(
                                                            text: model
                                                                .getTemMon(model
                                                                    .listMonTang[
                                                                        i]
                                                                    .maMon
                                                                    .toString())
                                                                .toString(),
                                                            color: 1)),
                                                        DataCell(TextTable(
                                                            text: model
                                                                .listMonTang[i]
                                                                .sLuong
                                                                .toString(),
                                                            color: 1)),
                                                        DataCell(InkWell(
                                                            onTap: () => model
                                                                .deleteMonTang(model
                                                                    .listMonTang[
                                                                        i]
                                                                    .maMon
                                                                    .toString()),
                                                            child: const EditDeleteOnlyTable(
                                                                loai:
                                                                    'delete'))),
                                                      ])
                                                  ]),
                                                ),
                                              ],
                                            ))
                                        : Container(),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: ((width / 100) * 85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          color: AppColors.grey,
                          child: InkWell(
                            onTap: () => model.checkLuu(context),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(children: [
                                const Icon(Icons.save_rounded, size: 30),
                                Text(
                                  'Lưu',
                                  style: AppStyles.lato.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Material(
                          color: AppColors.grey,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(children: [
                                const Icon(Icons.cancel_sharp, size: 30),
                                Text(
                                  'hủy bỏ',
                                  style: AppStyles.lato.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Material(
                          color: AppColors.grey,
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(children: [
                                const Icon(Icons.help_sharp, size: 30),
                                Text(
                                  'Giúp',
                                  style: AppStyles.lato.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
          },
        );
      },
    );
  }
}
