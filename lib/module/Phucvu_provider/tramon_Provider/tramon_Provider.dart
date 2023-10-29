import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/mon_model.dart';
import 'package:coffee_chain/models/phache/DSmonchebien_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/BanHD.service.dart';
import 'package:coffee_chain/service/DSmonCheBien.service.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:coffee_chain/service/thucdon.service.dart';
import 'package:flutter/material.dart';

class TraMonProvider extends ChangeNotifier {
  bool _click_Cban = false;
  bool get click_Cban => _click_Cban;
  void chonBan() {
    _click_Cban = !_click_Cban;
    notifyListeners();
  }

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
    getlistBanHD();
    getListMonCB();
    notifyListeners();
  }

  final BanHDService _banHDService = BanHDService();
  DSmonCheBienService _dSmonCheBienModel = DSmonCheBienService();
  List<BanHoatDongModel> _banHDmodelTMP = [];
  List<BanHoatDongModel> _banHDmodel = [];
  List<BanHoatDongModel> get banHDodel => _banHDmodel;
  List<DSmonCheBienModel> _monCBTMP = [];
  List<DSmonCheBienModel> _monCB = [];
  List<DSmonCheBienModel> get MonCB => _monCB;
  void getlistBanHD() async {
    _banHDmodel.clear();
    _banHDmodelTMP = await _banHDService.getBanHD(_coSo!);
    for (int i = 0; i < _banHDmodelTMP.length; i++) {
      if (int.parse(_banHDmodelTMP[i].dangPhucVu.toString()) != 0 ||
          int.parse(_banHDmodelTMP[i].mangve.toString()) != 0) {
        _banHDmodel.add(_banHDmodelTMP[i]);
      }
    }
    notifyListeners();
  }

  void getListMonCB() async {
    _monCBTMP = await _dSmonCheBienModel.getDSmonCheBien(_coSo!);
    notifyListeners();
  }

  String slMon(String maBan) {
    int cout = 0;
    for (int i = 0; i < _monCBTMP.length; i++) {
      if (_monCBTMP[i].maBan == maBan) {
        cout += int.parse(_monCBTMP[i].slMon.toString());
      }
    }
    return '${cout}';
  }

  String? _maBan;
  String? get maBan => _maBan;
  String _tenBan = '...';
  String get tenBan => _tenBan;

  List<DSmonCheBienModel> _moTra = [];
  // List<DSmonCheBienModel> get moTra => _moTra;
  void clickBan(String maBan) {
    _moTra.clear();
    _monCB.clear();
    _maBan = maBan;
    for (var i = 0; i < _banHDmodel.length; i++) {
      if (_banHDmodel[i].maBan == maBan) {
        _tenBan = _banHDmodel[i].tenBan.toString();
      }
    }
    for (var i = 0; i < _monCBTMP.length; i++) {
      if (_monCBTMP[i].maBan == maBan) {
        _monCB.add(_monCBTMP[i]);
      }
    }
    notifyListeners();
  }

  int sl = 0;
  int slt = 0;
  int _st = 0;
  String m = '';
  void chonMonTra(String value, String maMon) {
    bool check = false;
    int s = 0;
    if (value != '') {
      slt = int.parse(value.toString());
    } else {
      slt = 0;
    }
    for (int i = 0; i < _moTra.length; i++) {
      if (_moTra[i].maMon.toString() == maMon) {
        check = true;
        for (int i = 0; i < _monCB.length; i++) {
          if (_monCB[i].maMon.toString() == maMon) {
            sl = int.parse(_monCB[i].slMon.toString());
          }
        }
        // print(sl);
        s = sl - slt;
        _moTra[i].slMon = s;
      }
    }
    if (!check) {
      for (int i = 0; i < _monCB.length; i++) {
        if (_monCB[i].maMon.toString() == maMon) {
          sl = int.parse(_monCB[i].slMon.toString());
          int s = sl - slt;
          _moTra.add(DSmonCheBienModel(
            maBan: _monCB[i].maBan,
            maMon: _monCB[i].maMon,
            slMon: s,
          ));
          print(s);
        }
      }
    }

    notifyListeners();
  }

  final ThucDonService _thucDonService = ThucDonService();
  List<MonModel> _ListDSmonTMP = [];
  void tramon(String maNV) async {
    double tt = 0;
    double dg = 0;
    double slGoc = 0;
    _ListDSmonTMP = await _thucDonService.getThucDon(_coSo!);

    for (int i = 0; i < _moTra.length; i++) {
      for (int a = 0; a < _banHDmodelTMP.length; a++) {
        if (_moTra[i].maBan == _banHDmodelTMP[a].maBan) {
          tt = double.parse(_banHDmodelTMP[a].tongTien.toString());
        }
      }
      for (int c = 0; c < _ListDSmonTMP.length; c++) {
        if (_moTra[i].maMon == _ListDSmonTMP[c].maMon) {
          dg = double.parse(_ListDSmonTMP[c].giaTien.toString());
        }
      }
      for (int b = 0; b < _monCBTMP.length; b++) {
        if (_moTra[i].maBan == _monCBTMP[b].maBan) {
          slGoc = double.parse(_monCBTMP[b].slMon.toString());
        }
      }

      if (int.parse(_moTra[i].slMon.toString()) > 0) {
        double slmoi = double.parse(_moTra[i].slMon.toString());
        double tien = tt - (dg * (slGoc - slmoi));
        // print(sotra);
        // print(dg);
        // print(tien);

        await _banHDService.UpdateBanHDtien(
            _moTra[i].maBan.toString(), tien.toString(), _coSo!);

        await _dSmonCheBienModel.upSLmonmonCB(_moTra[i].maBan.toString(),
            _moTra[i].maMon.toString(), _moTra[i].slMon.toString(), _coSo!);
      } else {
        double tien = tt - (dg * slGoc);

        await _banHDService.UpdateBanHDtien(
            _moTra[i].maBan.toString(), tien.toString(), _coSo!);

        await _dSmonCheBienModel.deletemonCB(
            _moTra[i].maBan.toString(), _moTra[i].maMon.toString(), _coSo!);
      }
    }
    _moTra.clear();
    _monCB.clear();
    getlistBanHD();
    getListMonCB();
    notifyListeners();
  }
}
