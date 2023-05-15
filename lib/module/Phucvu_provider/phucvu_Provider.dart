import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:flutter/material.dart';

enum menuPV { order, tramon }

class PhucvuProvider extends ChangeNotifier {
  menuPV _chonBody = menuPV.order;
  menuPV get chonBody => _chonBody;

  bool _themOrder = false;
  bool get themOrder => _themOrder;

  String _tenNV = 'A';
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
  void getAccPQ(String maNV) async {
    print(maNV);
    _nhanVien = await _nhanVienService.getNhanVien(maNV);
    _tenNV = _nhanVien!.tenNV.toString();

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());
    
    notifyListeners();
  }

  void clickOrder() {
    _chonBody = menuPV.order;
    notifyListeners();
  }

  void clickTramon() {
    _chonBody = menuPV.tramon;
    notifyListeners();
  }

  void onClickThemOrder() {
    _themOrder = !_themOrder;
    notifyListeners();
  }
}
