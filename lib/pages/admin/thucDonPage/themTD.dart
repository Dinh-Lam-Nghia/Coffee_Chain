import 'package:coffee_chain/module/admin_provider/thucDonPage_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/admin_widgets.dart';
import 'package:coffee_chain/widgets/file_picker_imgMon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> themTD(BuildContext context, String maNV) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: AppColors.Sepia,
          title: SizedBox(
            width: 1490,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thêm món',
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
          content: ThemTDDialog(
            maNV: maNV,
          ));
    },
  );
}

class ThemTDDialog extends StatefulWidget {
  const ThemTDDialog({super.key, required this.maNV});
  final String maNV;

  @override
  State<ThemTDDialog> createState() => _ThemTDDialogState();
}

class _ThemTDDialogState extends State<ThemTDDialog> {
  final ThucDonPageProvider _thucDonPageProvider = ThucDonPageProvider();

  @override
  void initState() {
    super.initState();
    _thucDonPageProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<ThucDonPageProvider>(
      create: (context) => _thucDonPageProvider,
      builder: (context, child) {
        return Consumer<ThucDonPageProvider>(
          builder: (context, model, child) {
            return SingleChildScrollView(
                child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(20),
              width: ((width / 100) * 85),
              // height: 450,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    // width: ((((width / 100) * 85) - 45) / 5) * 2.8,
                    // height: ((((width / 100) * 85) - 45) / 5) * 1.3,
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'Loại',
                                style: AppStyles.lato.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black87,
                                ),
                              )),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => AppColors.black87),
                                      focusColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => AppColors.black87),
                                      value: 'douong',
                                      groupValue: model.loaiMon,
                                      onChanged: (String? value) {
                                        model.clickChonLM(value!);
                                      },
                                    ),
                                    Text(
                                      'Đồ uống',
                                      style: AppStyles.lato.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black87,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => AppColors.black87),
                                      focusColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => AppColors.black87),
                                      value: 'monan',
                                      groupValue: model.loaiMon,
                                      onChanged: (String? value) {
                                        model.clickChonLM(value!);
                                      },
                                    ),
                                    Text(
                                      'Món ăn',
                                      style: AppStyles.lato.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black87,
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                                      'Tên món ',
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
                                  child: Container(
                                    child: TextFormField(
                                      controller: model.tenMon,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.grey1,
                                        errorText: model.errTen,
                                        border: (model.errTen != '')
                                            ? const OutlineInputBorder()
                                            : InputBorder.none,
                                      ),
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
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Mã món ',
                                        style: AppStyles.lato.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black87,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '(*)',
                                        style: AppStyles.lato.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.red,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    // color: AppColors.grey1,
                                    child: TextFormField(
                                      controller: model.maMon,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.grey1,
                                        errorText: model.errMa,
                                        border: (model.errMa != '')
                                            ? const OutlineInputBorder()
                                            : InputBorder.none,
                                      ),
                                      onChanged: (value) =>
                                          model.checkMaMon(value),
                                    ),
                                  )),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  child: Row(children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Giá món ',
                                        style: AppStyles.lato.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black87,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '(*)',
                                        style: AppStyles.lato.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.red,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: TextFormField(
                                      controller: model.giaBan,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.grey1,
                                        errorText: model.errGia,
                                        border: (model.errGia != '')
                                            ? const OutlineInputBorder()
                                            : InputBorder.none,
                                      ),
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
                                child: Text(
                                  'Nhóm thực đơn ',
                                  style: AppStyles.lato.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black87,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    color: AppColors.grey1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: (model.checkNTD)
                                              ? InputThemMon1(
                                                  controller: model.nhomTD,
                                                )
                                              : SizedBox(
                                                  child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    elevation: 16,
                                                    value: model.chonNhomTD,
                                                    items: const [
                                                      DropdownMenuItem(
                                                        value: 'khac',
                                                        child: Text('Khác'),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: 'cafe',
                                                        child: Text('Coffee'),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: 'nuocngot',
                                                        child:
                                                            Text('Nước ngọt'),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: 'nuocpc',
                                                        child: Text(
                                                            'Nước pha chế'),
                                                      ),
                                                    ],
                                                    onChanged: (value) {
                                                      model.clickNhomTD(
                                                          value.toString());
                                                    },
                                                  ),
                                                ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            left: BorderSide(
                                                width: 1,
                                                color: AppColors.black87),
                                          )),
                                          child: Container(
                                            child: (model.checkNTD)
                                                ? IconButton(
                                                    onPressed: () => model
                                                        .checkClickclear(1),
                                                    icon:
                                                        const Icon(Icons.clear))
                                                : IconButton(
                                                    onPressed: () =>
                                                        model.checkClickadd(1),
                                                    icon:
                                                        const Icon(Icons.add)),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  child: Row(children: [
                                    Text(
                                      'Đơn vị tính ',
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
                                child: Container(
                                    color: AppColors.grey1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: (model.checkDVT)
                                              ? InputThemMon1(
                                                  controller: model.donViTinh,
                                                )
                                              : SizedBox(
                                                  child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    elevation: 16,
                                                    value: model.DVT,
                                                    items: [
                                                      for (int i = 0;
                                                          i <
                                                              model.DVTmonModel
                                                                  .length;
                                                          i++)
                                                        DropdownMenuItem(
                                                          value: model
                                                              .DVTmonModel[i]
                                                              .donViTinh,
                                                          child: Text(model
                                                              .DVTmonModel[i]
                                                              .donViTinh
                                                              .toString()),
                                                        ),
                                                    ],
                                                    onChanged: (value) {
                                                      model.clickChonDVT(
                                                          value.toString());
                                                    },
                                                  ),
                                                ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            left: BorderSide(
                                                width: 1,
                                                color: AppColors.black87),
                                          )),
                                          child: Container(
                                            child: (model.checkDVT)
                                                ? IconButton(
                                                    onPressed: () => model
                                                        .checkClickclear(2),
                                                    icon:
                                                        const Icon(Icons.clear))
                                                : IconButton(
                                                    onPressed: () =>
                                                        model.checkClickadd(2),
                                                    icon:
                                                        const Icon(Icons.add)),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
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
                                  child: Text(
                                    'Chế biến tại',
                                    style: AppStyles.lato.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                    color: AppColors.grey1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: (model.checkCBT)
                                              ? InputThemMon1(
                                                  controller: model.cheBienTai,
                                                )
                                              : SizedBox(
                                                  child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    elevation: 16,
                                                    value: model.CBT,
                                                    items: [
                                                      for (int i = 0;
                                                          i <
                                                              model.CBTmonModel
                                                                  .length;
                                                          i++)
                                                        DropdownMenuItem(
                                                          value: model
                                                              .CBTmonModel[i]
                                                              .noiNhanMon,
                                                          child: Text(model
                                                              .CBTmonModel[i]
                                                              .noiNhanMon
                                                              .toString()),
                                                        ),
                                                    ],
                                                    onChanged: (value) {
                                                      model.clickChonCBT(
                                                          value.toString());
                                                    },
                                                  ),
                                                ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            left: BorderSide(
                                                width: 1,
                                                color: AppColors.black87),
                                          )),
                                          child: Container(
                                            child: (model.checkCBT)
                                                ? IconButton(
                                                    onPressed: () => model
                                                        .checkClickclear(3),
                                                    icon:
                                                        const Icon(Icons.clear))
                                                : IconButton(
                                                    onPressed: () =>
                                                        model.checkClickadd(3),
                                                    icon:
                                                        const Icon(Icons.add)),
                                          ),
                                        ),
                                      ],
                                    )),
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
                                  onTap: () => model.ktTruocLuu(context),
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
                  ),
                ),
                const SizedBox(width: 20),
                //
                // ImagerMon(model: model, width: width),
                Expanded(
                  flex: 2,
                  child: Container(
                    // width: ((((width / 100) * 85) - 45) / 5) * 1.65,
                    child: Column(
                      children: [
                        Text(
                          'Ảnh đại diện',
                          style: AppStyles.lato.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color:
                                (model.anh) ? AppColors.black87 : AppColors.red,
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(20),
                            width: ((((width / 100) * 85) - 45) / 5),
                            // height: ((((widget.width / 100) * 85) - 45) / 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: (model.anh)
                                        ? AppColors.black87
                                        : AppColors.red)),
                            child: Column(
                              children: [
                                model.pickedImage == null
                                    ? const Center(
                                        child: SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: Icon(
                                          Icons.image_outlined,
                                          size: 100,
                                        ),
                                      ))
                                    : Image.memory(
                                        model.bytesImage,
                                        fit: BoxFit.fill,
                                      ),
                                Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Các định dạng ảnh:',
                                        style: AppStyles.lato
                                            .copyWith(fontSize: 15),
                                      ),
                                      Text(
                                        '(.png, .jpg)',
                                        style: AppStyles.lato.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.red),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.black87)),
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 30,
                                      color: AppColors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Material(
                                color: AppColors.white,
                                child: InkWell(
                                  onTap: (() {
                                    model.pickedImages();
                                  }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.black87)),
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.upload,
                                      size: 30,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                //
              ]),
            ));
          },
        );
      },
    );
  }
}
