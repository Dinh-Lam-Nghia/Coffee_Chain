// ignore_for_file: non_constant_identifier_names

import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phache/DSmonchebien_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/BanHD.service.dart';
import 'package:coffee_chain/service/DSmonCheBien.service.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:flutter/material.dart';

class DSmonCheBienProvider extends ChangeNotifier {
  List<BanHoatDongModel> _listBanHDTMP = [];

  List<BanHoatDongModel> _listBanHD = [];
  List<BanHoatDongModel> get listBanHD => _listBanHD;

  List<DSmonCheBienModel> _listDSmonCheBien = [];
  List<DSmonCheBienModel> get listDSmonCheBien => _listDSmonCheBien;

  final BanHDService _banHDService = BanHDService();
  final DSmonCheBienService _dSmonCheBienService = DSmonCheBienService();

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

    getListMonCheBien();
    getListBanHD();
    notifyListeners();
  }

  List<BanHoatDongModel> _TMP = [];
  void getListBanHD() async {
    _TMP.clear();
    _listBanHDTMP = await _banHDService.getBanHD(_coSo!);

    for (int i = 0; i < _listBanHDTMP.length; i++) {
      if (_listBanHDTMP[i].hoanThanhMon == 0 && _listBanHDTMP[i].thanhToan == 0)
        _TMP.add(_listBanHDTMP[i]);
    }

    _listBanHD = _TMP;

    notifyListeners();
  }

  void getListMonCheBien() async {
    _listDSmonCheBien = await _dSmonCheBienService.getDSmonCheBien(_coSo!);
    notifyListeners();
  }

  List<DSmonCheBienModel> _listDSmonCheBienTungban = [];
  List<DSmonCheBienModel> get listDSmonCheBienTungBan =>
      _listDSmonCheBienTungban;
  int getSLuongMonTrenBan(String maBan) {
    _listDSmonCheBienTungban.clear();
    int _cout = 0;
    for (int i = 0; i < _listDSmonCheBien.length; i++) {
      if (_listDSmonCheBien[i].maBan.toString() == maBan.toString()) {
        _listDSmonCheBienTungban.add(_listDSmonCheBien[i]);
        _cout++;
      }
    }
    return _cout;
  }

  bool _soLanClick = false;
  bool get soLanClick => _soLanClick;
  String? _chonBan;
  String? get chonBan => _chonBan;
  void onClickBan(String maBan) {
    _soLanClick = !_soLanClick;
    if (_soLanClick) {
      clickchonBan(maBan);
    } else {
      _chonBan = null;
    }
    notifyListeners();
  }

  void clickchonBan(String maBan) {
    _chonBan = maBan;
    print(_chonBan);
    notifyListeners();
  }

  final BanHDService _updatebanHD = BanHDService();
  void onclickTraMon() async {
    if (_chonBan != null) {
      await _updatebanHD.UpdateBanHDHT(_chonBan.toString(), 1, _coSo!);
      getListBanHD();
      getListMonCheBien();
    }
    notifyListeners();
  }

  // xác nhạn hoàn thành
  final DSmonCheBienService _monHoanThanh = DSmonCheBienService();
  void postUpMonHoanThanh(String maBan, String maMon, int hoanThanh) async {
    print(maBan + maMon);
    if (hoanThanh == 0) {
      await _monHoanThanh.postUpMonHoanThanh(maBan, maMon, 1, _coSo!);
    } else {
      await _monHoanThanh.postUpMonHoanThanh(maBan, maMon, 0, _coSo!);
    }
    getListBanHD();
    notifyListeners();
  }
}
