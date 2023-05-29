// ignore_for_file: non_constant_identifier_names

import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/BanHD.service.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:flutter/material.dart';

enum clickMenuOrder { dangpv, yctramon, mangve }

class OrderProvider extends ChangeNotifier {
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
   _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();

    _nhanVien = await _nhanVienService.getNhanVien(maNV, _coSo!);
    _tenNV = _nhanVien!.tenNV.toString();

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());

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

  clickMenuOrder _clickMnOd = clickMenuOrder.dangpv;
  clickMenuOrder get clickMnOd => _clickMnOd;

  void clickDPV() {
    _clickMnOd = clickMenuOrder.dangpv;
    notifyListeners();
  }

  void clickYCTT() {
    _clickMnOd = clickMenuOrder.yctramon;
    notifyListeners();
  }

  void clickMV() {
    _clickMnOd = clickMenuOrder.mangve;
    notifyListeners();
  }

  // int _coutDPV = 0;
  // int get coutDPV => _coutDPV;
  // int _coutYCTT = 0;
  // int get coutYCTT => _coutYCTT;
  // int _coutMV = 0;
  // int get coutMV => _coutMV;

  final List<BanHoatDongModel> _listDPVTMP = [];
  List<BanHoatDongModel> _listDPV = [];
  List<BanHoatDongModel> get listDPV => _listDPV;

  final List<BanHoatDongModel> _listYCTTTMP = [];
  List<BanHoatDongModel> _listYCTT = [];
  List<BanHoatDongModel> get listYCTT => _listYCTT;

  final List<BanHoatDongModel> _listMVTMP = [];
  List<BanHoatDongModel> _listMV = [];
  List<BanHoatDongModel> get listMV => _listMV;
  void getSL() {
    _listDPVTMP.clear();
    _listYCTTTMP.clear();
    _listMVTMP.clear();
    print(_listBanHD.length);
    for (int i = 0; i < _listBanHD.length; i++) {
      if (int.parse(_listBanHD[i].dangPhucVu.toString()) == 1) {
        _listDPVTMP.add(_listBanHD[i]);
        // _coutDPV++;
      }
      if (int.parse(_listBanHD[i].thanhToan.toString()) == 1) {
        _listYCTTTMP.add(_listBanHD[i]);
        // _coutYCTT++;
      }
      if (int.parse(_listBanHD[i].mangve.toString()) == 1) {
        _listMVTMP.add(_listBanHD[i]);
        // _coutMV++;
      }
    }
    _listDPV = _listDPVTMP;
    _listYCTT = _listYCTTTMP;
    _listMV = _listMVTMP;
    notifyListeners();
  }

  void ycthanhToan(String maNV, String maban) async {
    String maBan = maban.toString();
    String dangPhucVu = "0";
    String thanhToan = "1";
    String mangve = "0";
    String coSo = _coSo!;

    await _banHDService.dangPvThanhToanMangve(
        maBan, dangPhucVu, thanhToan, mangve, coSo);

    getAccPQ(maNV);
    notifyListeners();
  }

  void timKiem(String value, int xd) {
    if (xd == 1) {
      _listDPV = _listDPVTMP
          .where((element) =>
              element.tenBan!.toUpperCase().contains(value.toUpperCase()))
          .toList();
    }
    if (xd == 2) {
      _listYCTT = _listYCTTTMP
          .where((element) =>
              element.tenBan!.toUpperCase().contains(value.toUpperCase()))
          .toList();
    }
    if (xd == 3) {
      _listMV = _listMVTMP
          .where((element) =>
              element.tenBan!.toUpperCase().contains(value.toUpperCase()))
          .toList();
    }
    notifyListeners();
  }
}
