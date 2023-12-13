import 'package:coffee_chain/models/Ban_model.dart';
import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phache/DSmonchebien_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/models/mon_model.dart';
import 'package:coffee_chain/service/BanHD.service.dart';
import 'package:coffee_chain/service/DSmonCheBien.service.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:coffee_chain/service/DsBan.service.dart';
import 'package:coffee_chain/service/thucdon.service.dart';
import 'package:flutter/material.dart';

enum clickMenuMon { tc, coffee, tea, nn, more }

class GhiorderProvider extends ChangeNotifier {
  clickMenuMon _clMenuMon = clickMenuMon.tc;
  clickMenuMon get clMenuMon => _clMenuMon;

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
    _tongTien = 0;
    getListDSmon();
    getlistBan();
    notifyListeners();
  }

  List<BanHoatDongModel> _banHDmodel = [];
  List<BanModel> _banModelTMP = [];
  List<BanModel> _banModel = [];
  List<BanModel> get banModel => _banModel;
  final BanService _banService = BanService();
  final BanHDService _banHDService = BanHDService();
  void getlistBan() async {
    _banModel.clear();
    _banModelTMP = await _banService.getDsBan(_coSo!);
    _banHDmodel = await _banHDService.getBanHD(_coSo!);
    for (int i = 0; i < _banModelTMP.length; i++) {
      bool xet = false;
      for (int j = 0; j < _banHDmodel.length; j++) {
        if (_banModelTMP[i].maBan == _banHDmodel[j].maBan) {
          xet = true;
        }
      }
      if (!xet) {
        _banModel.add(_banModelTMP[i]);
      }
    }
    notifyListeners();
  }

  List<MonModel> _ListDSmonTMP = [];
  final List<MonModel> _ListDSmonTMP1 = [];
  List<MonModel> _ListDSmon = [];
  List<MonModel> get ListDSmon => _ListDSmon;
  final ThucDonService _thucDonService = ThucDonService();
  void getListDSmon() async {
    _ListDSmonTMP = await _thucDonService.getThucDon(_coSo!);
    // _ListDSmonTMP1 = _ListDSmonTMP;
    for (int i = 0; i < _ListDSmonTMP.length; i++) {
      _ListDSmonTMP1.add(_ListDSmonTMP[i]);
      // if (_ListDSmonTMP[i].nhomThucDon.toString() == 'cafe') {
      //   _ListDSmonTMP1.add(_ListDSmonTMP[i]);
      // }
    }
    _ListDSmon = _ListDSmonTMP1;
    notifyListeners();
  }

  final List<DSmonCheBienModel> _ListDSmonCB = [];
  List<DSmonCheBienModel> _ListDSmonHien = [];
  List<DSmonCheBienModel> get ListDSmonHien => _ListDSmonHien;
  double _tongTien = 0;
  double get tongTien => _tongTien;
  void addMonCB(String maMon) {
    bool check = false;
    for (int i = 0; i < _ListDSmonCB.length; i++) {
      if (_ListDSmonCB[i].maMon == maMon) {
        check = true;
        _ListDSmonCB[i].slMon = int.parse(_ListDSmonCB[i].slMon.toString()) + 1;
      }
    }
    if (!check) {
      for (int i = 0; i < _ListDSmonTMP.length; i++) {
        if (_ListDSmonTMP[i].maMon == maMon) {
          _ListDSmonCB.add(DSmonCheBienModel(
            maMon: _ListDSmonTMP[i].maMon,
            tenMon: _ListDSmonTMP[i].tenMon,
            slMon: 1,
          ));
        }
      }
    }
    _ListDSmonHien = _ListDSmonCB;
    _tongTien = 0;
    notifyListeners();
  }

  String tinhtien(String maMon, String slMon) {
    double t = 0;
    for (int i = 0; i < _ListDSmonTMP.length; i++) {
      if (_ListDSmonTMP[i].maMon == maMon) {
        double gt = double.parse(_ListDSmonTMP[i].giaTien.toString());
        double sl = double.parse(slMon);
        t = sl * gt;
      }
    }
    // print(t);
    _tongTien += t;
    return "${t.toStringAsFixed(3)}";
  }

  int hienTheoNhomThucDon(String nhomThucDon) {
    _tongTien = 0;
    _ListDSmonTMP1.clear();
    if (nhomThucDon == 'tc') {
      _clMenuMon = clickMenuMon.tc;
      getListDSmon();
      return 0;
    } else if (nhomThucDon == 'cafe') {
      _clMenuMon = clickMenuMon.coffee;
    } else if (nhomThucDon == 'trasua') {
      _clMenuMon = clickMenuMon.tea;
    } else if (nhomThucDon == 'nuocngot') {
      _clMenuMon = clickMenuMon.nn;
    } else {
      _clMenuMon = clickMenuMon.more;
    }
    print('${_ListDSmonTMP.length} bbbbbb');
    for (int i = 0; i < _ListDSmonTMP.length; i++) {
      if (_ListDSmonTMP[i].nhomThucDon.toString() == nhomThucDon.toString()) {
        _ListDSmonTMP1.add(_ListDSmonTMP[i]);
      }
    }
    _ListDSmon = _ListDSmonTMP1;
    notifyListeners();
    return 0;
  }

  void timkiem(String value) {
    if (value == '') {
      _ListDSmonTMP1.clear();
      getListDSmon();
      // for (int i = 0; i < _ListDSmonTMP.length; i++) {
      //   if (_ListDSmonTMP[i].nhomThucDon.toString() == 'cafe') {
      //     _ListDSmonTMP1.add(_ListDSmonTMP[i]);
      //   }
      // }
    } else {
      _ListDSmon = _ListDSmonTMP1.where((element) =>
          element.tenMon!.toUpperCase().contains(value.toUpperCase())).toList();
    }
    notifyListeners();
  }

  // String? _maBan;
  String _vl = 'chonban';
  String get vl => _vl;
  void nhanBan(String value) {
    _tongTien = 0;
    _vl = value.toString();
    // print(_vl);
    notifyListeners();
  }

  String _slN = '0';
  String get slN => _slN;
  void sluongnguoi(String value) {
    _tongTien = 0;
    _slN = value.toString();
    // print(_slN);
    notifyListeners();
  }

  final DSmonCheBienService _dSmonCheBienService = DSmonCheBienService();
  bool _KTluu = false;
  bool get KTluu => _KTluu;
  void luuOrder() async {
    // print("ok1");
    print(_vl);
    String maBan = _vl;
    String order = '1.${_slN}';
    String nguoiPhucVu = tenNV;
    String slKhach = _slN;
    String hoanThanhMon = '0';
    String tongTien = _tongTien.toString();
    String dangPhucVu = '1';
    String thanhToan = '0';
    String mangve = '0';
    String coSo = _coSo!;
    if (maBan != 'chonban') {
      _KTluu = true;
      // print("ok2");
      // ban
      await _banHDService.addbanHD(
        maBan,
        order,
        nguoiPhucVu,
        slKhach,
        hoanThanhMon,
        tongTien,
        dangPhucVu,
        thanhToan,
        mangve,
        coSo,
      );

      // print("ok3");
      // mon
      for (int i = 0; i < _ListDSmonCB.length; i++) {
        await _dSmonCheBienService.adddSmonCheBien(
          maBan,
          _ListDSmonCB[i].maMon.toString(),
          _ListDSmonCB[i].slMon.toString(),
          '0',
          '...',
          _coSo!,
        );
      }
      // print("ok4");
    }
    _tongTien = 0;
    notifyListeners();
  }
}
