// ignore_for_file: non_constant_identifier_names

import 'package:coffee_chain/module/phaChe_provider/quanLykho_provider/themPhieu_nhap_xuat_provider/phieunhap_provider.dart';
import 'package:coffee_chain/pages/PhucVu/phucvu_home.dart';
import 'package:coffee_chain/pages/admin/admin_home.dart';
import 'package:coffee_chain/pages/phache/phache_home.dart';
import 'package:coffee_chain/pages/thungan/thungan_home.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextTable extends StatefulWidget {
  const TextTable({super.key, required this.text, required this.color});
  final String text;
  final int color;

  @override
  State<TextTable> createState() => _TextTableState();
}

class _TextTableState extends State<TextTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // ignore: sort_child_properties_last
      child: Text(
        widget.text,
        style: AppStyles.lato.copyWith(
            fontWeight: FontWeight.w400,
            color:
                (widget.color == 0) ? AppColors.white : AppColors.brownBlack),
      ),
      decoration: BoxDecoration(
          color: (widget.color == 0) ? AppColors.brightPink : AppColors.grey,
          border: Border.all(width: 2, color: AppColors.white)),
    );
  }
}

class BottonMenuDSMCB extends StatefulWidget {
  const BottonMenuDSMCB(
      {super.key, required this.menuClick, required this.text});
  final String menuClick;
  final String text;

  @override
  State<BottonMenuDSMCB> createState() => _BottonMenuDSMCBState();
}

class _BottonMenuDSMCBState extends State<BottonMenuDSMCB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.menuClick == "DSmonchebien")
          ? AppColors.white1
          : AppColors.Sepia,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            Icons.list_alt,
            size: 45,
            color: (widget.menuClick == "DSmonchebien")
                ? AppColors.Sepia
                : AppColors.white1,
          ),
          Text(widget.text,
              style: TextStyle(
                  color: (widget.menuClick == "DSmonchebien")
                      ? AppColors.Sepia
                      : AppColors.white1))
        ],
      ),
    );
  }
}

class ButtonMenuQLK extends StatefulWidget {
  const ButtonMenuQLK({super.key, required this.menuClick, required this.text});
  final String menuClick;
  final String text;

  @override
  State<ButtonMenuQLK> createState() => _ButtonMenuQLKState();
}

class _ButtonMenuQLKState extends State<ButtonMenuQLK> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.menuClick == "Quanlykho")
          ? AppColors.white1
          : AppColors.Sepia,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            Icons.list_alt,
            size: 45,
            color: (widget.menuClick == "Quanlykho")
                ? AppColors.Sepia
                : AppColors.white1,
          ),
          Text(widget.text,
              style: TextStyle(
                  color: (widget.menuClick == "Quanlykho")
                      ? AppColors.Sepia
                      : AppColors.white1))
        ],
      ),
    );
  }
}

class EditDeleteOnlyTable extends StatelessWidget {
  const EditDeleteOnlyTable({super.key, required this.loai});
  final String loai;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (loai == 'delete') ? AppColors.red : AppColors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          (loai == 'delete') ? Icons.delete_forever : Icons.edit_note,
          color: AppColors.white,
        ));
  }
}

class DateInputPhaChe extends StatefulWidget {
  const DateInputPhaChe({super.key, required this.dateInput, this.tk});
  final TextEditingController dateInput;
  final bool? tk;

  @override
  State<DateInputPhaChe> createState() => _DateInputPhaCheState();
}

class _DateInputPhaCheState extends State<DateInputPhaChe> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateInput,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        icon: Icon(Icons.calendar_month_outlined),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2100),
          helpText: 'Chọn ngày',
          initialEntryMode: DatePickerEntryMode.input,
        );

        if (pickedDate != null) {
          //pickedDate output format => 2021-03-10 00:00:00.000
          String month = '';
          if (pickedDate.month <= 9) {
            month = '0${pickedDate.month}';
          } else {
            month = pickedDate.month.toString();
          }
          String day = '';
          if (pickedDate.day <= 9) {
            day = '0${pickedDate.day}';
          } else {
            day = pickedDate.day.toString();
          }
          String formattedDate =
              "${day.toString()}/${month.toString()}/${pickedDate.year}";
          //formatted date output using intl package =>  11/01/2022
          setState(() {
            widget.dateInput.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    );
  }
}

class NhapXuatKhoInput extends StatelessWidget {
  const NhapXuatKhoInput({
    super.key,
    required this.widthInput,
    required this.controller,
    this.readOnly,
    this.db,
  });
  final double widthInput;
  final TextEditingController controller;
  final bool? readOnly;
  final int? db;

  @override
  Widget build(BuildContext context) {
    PhieuNhapProvider _phieuNhapProvider = PhieuNhapProvider();
    return ChangeNotifierProvider<PhieuNhapProvider>(
      create: (context) => _phieuNhapProvider,
      builder: (context, child) {
        return Consumer<PhieuNhapProvider>(
          builder: (context, model, child) {
            return Container(
              width: widthInput,
              color: AppColors.grey1,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: controller,
                readOnly: readOnly ?? false,
                style: const TextStyle(fontSize: 20, color: AppColors.black87),
                decoration: const InputDecoration(
                  filled: false,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class NhapXuatKhoPutton extends StatelessWidget {
  const NhapXuatKhoPutton(
      {super.key,
      required this.width,
      required this.height,
      required this.icon,
      required this.text});
  final double width;
  final double height;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon),
        Text(text),
      ]),
    );
  }
}

enum listthem { phucVu, thanhToan, admin, phaChe }

class AccUser extends StatefulWidget {
  const AccUser({
    super.key,
    required this.maNV,
    required this.tenNV,
    required this.PQPV,
    required this.PQTN,
    required this.PQAD,
    required this.PQPC,
    required this.XDTrang,
    this.drawer,
  });
  final String maNV;
  final String tenNV;
  final int PQPV;
  final int PQTN;
  final int PQAD;
  final int PQPC;
  final String XDTrang;
  final Color? drawer;

  @override
  State<AccUser> createState() => _AccUserState();
}

class _AccUserState extends State<AccUser> {
  listthem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          SizedBox(
            child: Row(
              children: [
                SizedBox(
                  child: PopupMenuButton<listthem>(
                    initialValue: selectedMenu,
                    child: Center(
                      child: Text(widget.tenNV.toString(),
                          style: AppStyles.lato.copyWith(
                              fontWeight: FontWeight.w600,
                              color: widget.drawer ?? AppColors.black87)),
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedMenu = value;
                      });
                      if (selectedMenu == listthem.phucVu) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhucVuHomeScreen(maNV: widget.maNV)),
                            (route) => false);
                      } else if (selectedMenu == listthem.thanhToan) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThuNganHomePage()),
                            (route) => false);
                      } else if (selectedMenu == listthem.admin) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminHomeResponsive(maNV:  widget.maNV,)),
                            (route) => false);
                      } else if (selectedMenu == listthem.phaChe) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhaCheHomePage(maNV: widget.maNV)),
                            (route) => false);
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<listthem>>[
                      if (widget.PQPV == 1 && widget.XDTrang != 'phucVu')
                        PopupMenuItem<listthem>(
                          value: listthem.phucVu,
                          child: Text('Phục vụ',
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w400)),
                        ),
                      if (widget.PQTN == 1 && widget.XDTrang != 'thuNgan')
                        PopupMenuItem<listthem>(
                          value: listthem.thanhToan,
                          child: Text('Thu ngân',
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w400)),
                        ),
                      if (widget.PQAD == 1 && widget.XDTrang != 'Admin')
                        PopupMenuItem<listthem>(
                          value: listthem.admin,
                          child: Text('Admin',
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w400)),
                        ),
                      if (widget.PQPC == 1 && widget.XDTrang != 'phaChe')
                        PopupMenuItem<listthem>(
                          value: listthem.phaChe,
                          child: Text('Pha Chế',
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w400)),
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.person,
                  size: 40,
                  color: widget.drawer ?? AppColors.black87,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
