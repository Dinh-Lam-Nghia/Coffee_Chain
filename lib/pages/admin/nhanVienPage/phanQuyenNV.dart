import 'package:coffee_chain/module/admin_provider/phanQuyenNV_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> phanQuyenNV(
  BuildContext context,
  String maNV,
  String maNVchon,
  String coSoNVchon,
  // String tenChon,
) async {
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
                'Phân quyền cho nhân viên: ( )',
                style: AppStyles.lato.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon:
                      const Icon(Icons.clear_outlined, color: AppColors.white))
            ],
          ),
        ),
        content:
            PhanQuyenNv(maNV: maNV, maNVchon: maNVchon, coSoNVchon: coSoNVchon),
      );
    },
  );
}

class PhanQuyenNv extends StatefulWidget {
  const PhanQuyenNv(
      {super.key,
      required this.maNV,
      required this.maNVchon,
      required this.coSoNVchon});
  final String maNV;
  final String maNVchon;
  final String coSoNVchon;
  @override
  State<PhanQuyenNv> createState() => _PhanQuyenNvState();
}

class _PhanQuyenNvState extends State<PhanQuyenNv> {
  final PhanQuyenNvProvider _phanQuyenNvProvider = PhanQuyenNvProvider();

  @override
  void initState() {
    super.initState();
    _phanQuyenNvProvider.getAccPQ(widget.maNV, widget.maNVchon);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhanQuyenNvProvider>(
      create: (context) => _phanQuyenNvProvider,
      builder: (context, child) {
        return Consumer<PhanQuyenNvProvider>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                color: AppColors.white,
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
                                  'User ',
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
                            flex: 2,
                            child: TextFormField(
                              controller: model.user,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey1,
                                errorText: model.errUser,
                                border: (model.errUser != '')
                                    ? const OutlineInputBorder()
                                    : InputBorder.none,
                              ),
                              onChanged: (value) => model.checkUser(value),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Row(children: [
                                Text(
                                  'Password ',
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
                              flex: 2,
                              child: TextFormField(
                                controller: model.pass,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.grey1,
                                  errorText: model.errPass,
                                  border: (model.errPass != '')
                                      ? const OutlineInputBorder()
                                      : InputBorder.none,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: (model.checkPhucVu)
                                  ? IconButton(
                                      onPressed: model.PV,
                                      icon: const Icon(
                                        Icons.check_box,
                                        color: AppColors.blue,
                                      ))
                                  : IconButton(
                                      onPressed: model.PV,
                                      icon: const Icon(
                                        Icons.check_box_outline_blank,
                                        color: AppColors.red,
                                      )),
                            ),
                            Text(
                              'Phục vụ',
                              style: AppStyles.lato.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: (model.checkThuNgan)
                                  ? InkWell(
                                      onTap: model.TN,
                                      child: const Icon(
                                        Icons.check_box_rounded,
                                        color: AppColors.blue,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: model.TN,
                                      child: const Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: AppColors.red,
                                      ),
                                    ),
                            ),
                            Text(
                              'Thu ngân',
                              style: AppStyles.lato.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: (model.checkAdmin)
                                  ? InkWell(
                                      onTap: model.AD,
                                      child: const Icon(
                                        Icons.check_box_rounded,
                                        color: AppColors.blue,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: model.AD,
                                      child: const Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: AppColors.red,
                                      ),
                                    ),
                            ),
                            Text(
                              'Admin',
                              style: AppStyles.lato.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: (model.checkPhaChe)
                                  ? InkWell(
                                      onTap: model.PC,
                                      child: const Icon(
                                        Icons.check_box_rounded,
                                        color: AppColors.blue,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: model.PC,
                                      child: const Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: AppColors.red,
                                      ),
                                    ),
                            ),
                            Text(
                              'Pha chế',
                              style: AppStyles.lato.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () => model.ktrPhanQuyen(
                                context, widget.maNVchon, widget.coSoNVchon),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              color: AppColors.Sepia,
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    color: AppColors.white1, fontSize: 25),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
