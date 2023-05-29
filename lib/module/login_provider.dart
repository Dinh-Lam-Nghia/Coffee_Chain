// ignore_for_file: use_build_context_synchronously

import 'package:coffee_chain/models/DangNhap_mondel.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/pages/PhucVu/phucvu_home.dart';
import 'package:coffee_chain/pages/admin/admin_home.dart';
import 'package:coffee_chain/pages/phache/phache_home.dart';
import 'package:coffee_chain/pages/thungan/thungan_home.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:flutter/material.dart';

// enum Radiobutton { phucVu, thuNgan, admin, phaChe }

class LoginProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  bool _isShow = true;
  bool get isShow => _isShow;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _passController = TextEditingController();
  TextEditingController get passController => _passController;

  // Radiobutton? _radio;
  // Radiobutton? get radio => _radio;

  void getIsShow() {
    _isShow = !_isShow;
    notifyListeners();
  }

  NhanVienService _nhanVienService = NhanVienService();

  DangNhapModel? _NV;
  DangNhapModel? get NV => _NV;
  PhanQuyenModel? _PQ;
  PhanQuyenModel? get PQ => _PQ;
  bool _err = false;
  bool get err => _err;
  void DangNhap(BuildContext context) async {
    if (_nameController.text == '' || _passController.text == '')
      _err = true;
    else {
      String user = _nameController.text;
      String pass = _passController.text;
      _NV = await _nhanVienService.KtraDN(user, pass);
      if (_NV!.maNV == '0') {
        _err = true;
      } else {
        _err = false;
        String maNV = _NV!.maNV.toString();
        _PQ = await _nhanVienService.PhanQuyen(maNV);
        if (_PQ!.phucVu == '1') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => PhucVuHomeScreen(maNV: maNV)),
              (route) => false);
        } else if (_PQ!.thuNgan == '1') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ThuNganHomePage()),
              (route) => false);
        } else if (_PQ!.admin == '1') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => AdminHomeResponsive(maNV: maNV)),
              (route) => false);
        } else if (_PQ!.phaChe == '1') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => PhaCheHomePage(maNV: maNV)),
              (route) => false);
        }
      }
    }
    notifyListeners();
  }
}
