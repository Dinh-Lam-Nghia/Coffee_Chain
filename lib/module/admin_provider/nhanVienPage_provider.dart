// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:coffee_chain/models/DangNhap_mondel.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:flutter/material.dart';

class NhanVienPageProvider extends ChangeNotifier {
  String? _coSo;
  String _tenNV = '...';
  String get tenNV => _tenNV;
  int _PQPV = 0;
  int get PQPV => _PQPV;
  int _PQTN = 0;
  int get PQTN => _PQTN;
  int _PQAD = 0;
  int get PQAD => _PQAD;
  int _PQPC = 0;
  int get PQPC => _PQPC;
  final NhanVienService _nhanVienService = NhanVienService();
  NhanVienModel? _nhanVien;
  PhanQuyenModel? _phanQuyen;
  UserPassModel? _CScoffee;
  void getAccPQ(String maNV) async {
    _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();

    _nhanVien = await _nhanVienService.getNhanVien(maNV, _coSo!);
    _tenNV = _nhanVien!.tenNV.toString();

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV, _coSo!);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());

    print(_coSo);
    getlistNV();
    getlistDN();
    notifyListeners();
  }

  List<NhanVienModel> _nhanVienModelTMP = [];
  List<NhanVienModel> _nhanVienModel = [];
  List<NhanVienModel> get nhanVienModel => _nhanVienModel;
  void getlistNV() async {
    _nhanVienModelTMP = await _nhanVienService.getAllNhanVien(_coSo!);
    _nhanVienModel = _nhanVienModelTMP;
    notifyListeners();
  }

  void timKiem(String value) {
    _nhanVienModel = _nhanVienModelTMP
        .where((element) =>
            element.tenNV!.toUpperCase().contains(value.toUpperCase()))
        .toList();
    notifyListeners();
  }
  List<DangNhapModel> _dangNhapModelTMP = [];
  // List<DangNhapModel> _dangNhapModel = [];
  // List<DangNhapModel> get dangNhapModel => _dangNhapModel;
  void getlistDN() async {
    _dangNhapModelTMP = await _nhanVienService.getAllDangnhap(_coSo!);
    // _dangNhapModel = _dangNhapModelTMP;
    notifyListeners();
  }
  

  String getTenDangNhap(String maNV) {
    for (int i = 0; i < _dangNhapModelTMP.length; i++) {
      if (_dangNhapModelTMP[i].maNV == maNV) {
        return '${_dangNhapModelTMP[i].user.toString()}';
      }
    }
    return '...';
  }

  //thêm nhân viên

  TextEditingController _maNhanVien = TextEditingController();
  TextEditingController get maNhanVien => _maNhanVien;
  TextEditingController _tenNhanVien = TextEditingController();
  TextEditingController get tenNhanVien => _tenNhanVien;
  TextEditingController _ngaySinh = TextEditingController();
  TextEditingController get ngaySinh => _ngaySinh;
  TextEditingController _soCCCD = TextEditingController();
  TextEditingController get soCCCD => _soCCCD;
  TextEditingController _ngayCap = TextEditingController();
  TextEditingController get ngayCap => _ngayCap;
  TextEditingController _caLamViec = TextEditingController();
  TextEditingController get caLamViec => _caLamViec;

  String _gioiTinh = 'nam';
  String get gioiTinh => _gioiTinh;

  void clickChonGT(String value) {
    _gioiTinh = value;
    notifyListeners();
  }

  void checkMaNV(String value) {
    _errMa = '';
    for (int i = 0; i < _nhanVienModelTMP.length; i++) {
      if (_nhanVienModelTMP[i].maNV == value) {
        _errMa = 'Mã nhân viên đã được dùng';
      }
    }
    notifyListeners();
  }

  String _errMa = '';
  String get errMa => _errMa;
  String _errTen = '';
  String get errTen => _errTen;
  bool check = false;
  void ktTruocLuu(BuildContext context) {
    _errMa = '';
    _errTen = '';
    check = false;
    if (_maNhanVien.text.toString() == '') {
      _errMa = 'Chưa nhập mã nhân viên';
      check = true;
    }
    if (_tenNhanVien.text.toString() == '') {
      _errTen = 'Chưa nhập tên nhân viên';
      check = true;
    }

    if (!check) {}
    luuNhanVien(context);
    notifyListeners();
  }

  void luuNhanVien(BuildContext context) async {
    String maNV = _maNhanVien.text.toString();
    String tenNV = _tenNhanVien.text.toString();
    String ngaySinh = _ngaySinh.text.toString();
    String gioiTinh = _gioiTinh.toString();
    String cccd = _soCCCD.text.toString();
    String ngayCap = _ngayCap.text.toString();
    String caLamViec = _caLamViec.text.toString();
    String avt = '';
    String coSo = _coSo!;

    await _nhanVienService.addNhanVien(
        maNV, tenNV, ngaySinh, gioiTinh, cccd, ngayCap, caLamViec, avt, coSo);

    Navigator.of(context).pop();
    notifyListeners();
  }

  void delete(String maNV, String coSo) async {
    bool check = false;
    for (int i = 0; i < _dangNhapModelTMP.length; i++) {
      if (_dangNhapModelTMP[i].maNV == maNV) {
        check = true;
        await _nhanVienService.deleteNhanVien3table(
            maNV, _dangNhapModelTMP[i].user.toString(), coSo);
      }
    }
    if (!check) {
      await _nhanVienService.deleteNhanVien(maNV, coSo);
    }
    getlistNV();
    getlistDN();
    notifyListeners();
  }
  // emd thêm nhân viên

}
