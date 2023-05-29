import 'package:coffee_chain/module/admin_provider/nhanVienPage_provider.dart';
import 'package:coffee_chain/module/admin_provider/thucDonPage_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> themNV(
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
                  'Thêm nhân viên mới',
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
          content: themNVDialog(
            maNV: maNV,
          ));
    },
  );
}

class themNVDialog extends StatefulWidget {
  const themNVDialog({
    super.key,
    required this.maNV,
  });
  final String maNV;

  @override
  State<themNVDialog> createState() => _themNVDialogState();
}

class _themNVDialogState extends State<themNVDialog> {
  final NhanVienPageProvider _nhanVienPageProvider = NhanVienPageProvider();

  @override
  void initState() {
    super.initState();
    _nhanVienPageProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<NhanVienPageProvider>(
      create: (context) => _nhanVienPageProvider,
      builder: (context, child) {
        return Consumer<NhanVienPageProvider>(
          builder: (context, model, child) {
            return SingleChildScrollView(
                child: Container(
              width: 100,
              color: AppColors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Row(children: [
                              Text(
                                'Mã nhân viên ',
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
                              controller: model.maNhanVien,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                errorText: model.errMa,
                                border: (model.errMa != '')
                                    ? const OutlineInputBorder()
                                    : InputBorder.none,
                              ),
                              onChanged: (value) => model.checkMaNV(value),
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
                                'Tên nhân viên ',
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
                              controller: model.tenNhanVien,
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
                          child: Text(
                            'Giới tính ',
                            style: AppStyles.lato.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: AppColors.grey1,
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(25),
                              elevation: 16,
                              value: model.gioiTinh,
                              items: const [
                                DropdownMenuItem(
                                  value: 'nam',
                                  child: Text('Nam'),
                                ),
                                DropdownMenuItem(
                                  value: 'nu',
                                  child: Text('Nữ'),
                                ),
                              ],
                              onChanged: (value) {
                                model.clickChonGT(value.toString());
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Ngày sinh ',
                            style: AppStyles.lato.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                width: 1,
                                color: AppColors.grey,
                              ),
                            ),
                            child: DateInputPhaChe(
                              dateInput: model.ngaySinh,
                            ),
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
                          child: Text(
                            'Số CCCD ',
                            style: AppStyles.lato.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: model.soCCCD,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                border: InputBorder.none,
                              ),
                            )),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Ngày cấp ',
                            style: AppStyles.lato.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                width: 1,
                                color: AppColors.grey,
                              ),
                            ),
                            child: DateInputPhaChe(
                              dateInput: model.ngayCap,
                            ),
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
                          child: Text(
                            'Ca làm việc ',
                            style: AppStyles.lato.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: model.caLamViec,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                border: InputBorder.none,
                              ),
                            )),
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
            ));
          },
        );
      },
    );
  }
}
