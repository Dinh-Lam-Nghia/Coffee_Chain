import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/BanHD.service.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:flutter/material.dart';

enum clickMenuThanhToan { cttoan, mangve }

class ThanhToanProvider extends ChangeNotifier {
  List<BanHoatDongModel> _listBanHD = [];
  List<BanHoatDongModel> get listBanHD => _listBanHD;

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
    _nhanVien = await _nhanVienService.getNhanVien(maNV);
    _tenNV = _nhanVien!.tenNV.toString();
    print(_tenNV);

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());

    _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();
    getListBanHD();
    notifyListeners();
  }

  final BanHDService _banHDService = BanHDService();
  void getListBanHD() async {
    print(_coSo!);
    _listBanHD = await _banHDService.getBanHD(_coSo!);
    getSL();
    notifyListeners();
  }

  clickMenuThanhToan _clickMnTT = clickMenuThanhToan.cttoan;
  clickMenuThanhToan get clickMnTT => _clickMnTT;

  void clickCTT() {
    _clickMnTT = clickMenuThanhToan.cttoan;
    notifyListeners();
  }

  void clickMV() {
    _clickMnTT = clickMenuThanhToan.mangve;
    notifyListeners();
  }

  final List<BanHoatDongModel> _listCTT = [];
  List<BanHoatDongModel> get listCTT => _listCTT;
  final List<BanHoatDongModel> _listMV = [];
  List<BanHoatDongModel> get listMV => _listMV;
  void getSL() {
    _listCTT.clear();
    _listMV.clear();
    for (int i = 0; i < _listBanHD.length; i++) {
      if (int.parse(_listBanHD[i].thanhToan.toString()) == 1) {
        _listCTT.add(_listBanHD[i]);
        // _coutCTT++;
      }
      if (int.parse(_listBanHD[i].mangve.toString()) == 1) {
        _listMV.add(_listBanHD[i]);
        // _coutMV++;
      }
    }
  }
}
