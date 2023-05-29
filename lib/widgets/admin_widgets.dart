import 'package:coffee_chain/module/admin_provider/thucDonPage_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:flutter/material.dart';

class BottonMenuTD extends StatefulWidget {
  const BottonMenuTD({super.key, required this.menuClick, required this.text});
  final String menuClick;
  final String text;

  @override
  State<BottonMenuTD> createState() => _BottonMenuTDState();
}

class _BottonMenuTDState extends State<BottonMenuTD> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          (widget.menuClick == "thucdon") ? AppColors.white1 : AppColors.Sepia,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            Icons.menu_book_sharp,
            size: 45,
            color: (widget.menuClick == "thucdon")
                ? AppColors.Sepia
                : AppColors.white1,
          ),
          Text(widget.text,
              style: TextStyle(
                  color: (widget.menuClick == "thucdon")
                      ? AppColors.Sepia
                      : AppColors.white1))
        ],
      ),
    );
  }
}

class BottonMenuNV extends StatefulWidget {
  const BottonMenuNV({super.key, required this.menuClick, required this.text});
  final String menuClick;
  final String text;

  @override
  State<BottonMenuNV> createState() => _BottonMenuNVState();
}

class _BottonMenuNVState extends State<BottonMenuNV> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          (widget.menuClick == "nhanvien") ? AppColors.white1 : AppColors.Sepia,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            Icons.contact_page_outlined,
            size: 45,
            color: (widget.menuClick == "nhanvien")
                ? AppColors.Sepia
                : AppColors.white1,
          ),
          Text(widget.text,
              style: TextStyle(
                  color: (widget.menuClick == "nhanvien")
                      ? AppColors.Sepia
                      : AppColors.white1))
        ],
      ),
    );
  }
}

class BottonMenuBC extends StatefulWidget {
  const BottonMenuBC({super.key, required this.menuClick, required this.text});
  final String menuClick;
  final String text;

  @override
  State<BottonMenuBC> createState() => _BottonMenuBCState();
}

class _BottonMenuBCState extends State<BottonMenuBC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          (widget.menuClick == "baocao") ? AppColors.white1 : AppColors.Sepia,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file_outlined,
            size: 45,
            color: (widget.menuClick == "baocao")
                ? AppColors.Sepia
                : AppColors.white1,
          ),
          Text(widget.text,
              style: TextStyle(
                  color: (widget.menuClick == "baocao")
                      ? AppColors.Sepia
                      : AppColors.white1))
        ],
      ),
    );
  }
}

class BottonMenuKM extends StatefulWidget {
  const BottonMenuKM({super.key, required this.menuClick, required this.text});
  final String menuClick;
  final String text;

  @override
  State<BottonMenuKM> createState() => _BottonMenuKMState();
}

class _BottonMenuKMState extends State<BottonMenuKM> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.menuClick == "khuyenmai")
          ? AppColors.white1
          : AppColors.Sepia,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            Icons.card_giftcard_outlined,
            size: 45,
            color: (widget.menuClick == "khuyenmai")
                ? AppColors.Sepia
                : AppColors.white1,
          ),
          Text(widget.text,
              style: TextStyle(
                  color: (widget.menuClick == "khuyenmai")
                      ? AppColors.Sepia
                      : AppColors.white1))
        ],
      ),
    );
  }
}

class InputThemMon1 extends StatefulWidget {
  InputThemMon1({
    super.key,
    required this.controller,
  });
  TextEditingController controller;

  @override
  State<InputThemMon1> createState() => _InputThemMon1State();
}

class _InputThemMon1State extends State<InputThemMon1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.grey1,
      child: TextFormField(
        controller: widget.controller,
        decoration: const InputDecoration( 
          border: InputBorder.none,
        ),
      ),
    );
  }
}
