import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/HoaDon_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/khuyenMai_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/BanHD.service.dart';
import 'package:coffee_chain/service/HoaDon.service.dart';
import 'package:coffee_chain/service/KhuyenMai.service.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
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
  void getAccPQ(String maNV, String maBan) async {
    _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();

    _nhanVien = await _nhanVienService.getNhanVien(maNV, _coSo!);
    _tenNV = _nhanVien!.tenNV.toString();

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV, _coSo!);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());
    getListBanHD();
    getListKM();
    aotoMaHD();
    getbanYCTT(maBan);
    notifyListeners();
  }

  final BanHDService _banHDService = BanHDService();
  void getListBanHD() async {
    // print(_coSo!);
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

  String maBanYctt = '';
  bool XDthanhToan = false;
  void thanhToan(String maBan) {
    maBanYctt = maBan;
    XDthanhToan = true;
    notifyListeners();
  }

  //thanh toan

  String _ngay = '';
  String get ngay => _ngay;
  String _gioi = '';
  String get gioi => _gioi;

  KhuyenMaiService _khuyenMaiService = KhuyenMaiService();
  List<KhuyenMaiModel> _listKhuyenMaiTMP = [];
  List<KhuyenMaiModel> _TMP = [];
  List<KhuyenMaiModel> _listKhuyenMai = [];
  List<KhuyenMaiModel> get listKhuyenMai => _listKhuyenMai;
  void getListKM() async {
    // _listKhuyenMai.clear();
    final now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString();
    String day = now.day.toString();

    _ngay = '${day}/${month}/${year}';
    _gioi = '${now.hour}:${now.minute}';

    if (int.parse(now.month.toString()) < 10) {
      month = '0${now.month}';
    }
    if (int.parse(now.day.toString()) < 10) {
      day = '0${now.day}';
    }
    int ngayHienTai = int.parse('${year}${month}${day}');

    _listKhuyenMaiTMP = await _khuyenMaiService.getKhuyenMai(_coSo!);

    for (int a = 0; a < _listKhuyenMaiTMP.length; a++) {
      if (int.parse(_listKhuyenMaiTMP[a].TN.toString()) <= ngayHienTai &&
          ngayHienTai <= int.parse(_listKhuyenMaiTMP[a].DN.toString())) {
        _TMP.add(_listKhuyenMaiTMP[a]);
      }
    }
    _listKhuyenMai = _TMP;
    notifyListeners();
  }

  List<KhuyenMaiModel> _khuyenMaiDaChonTMP = [];
  List<KhuyenMaiModel> _khuyenMaiDaChon = [];
  List<KhuyenMaiModel> get khuyenMaiDaChon => _khuyenMaiDaChon;
  void chonKM(String maKM) {
    bool check = false;
    if (_khuyenMaiDaChonTMP.length > 0) {
      for (int i = 0; i < _khuyenMaiDaChonTMP.length; i++) {
        if (_khuyenMaiDaChonTMP[i].maKM == maKM) {
          check = true;
          _khuyenMaiDaChonTMP.removeAt(i);
        }
      }
    }
    if (!check) {
      for (int i = 0; i < _listKhuyenMaiTMP.length; i++) {
        if (_listKhuyenMaiTMP[i].maKM == maKM) {
          _khuyenMaiDaChonTMP.add(_listKhuyenMaiTMP[i]);
        }
      }
    }
    _khuyenMaiDaChon = _khuyenMaiDaChonTMP;
    notifyListeners();
  }

  bool xetChon(String maKM) {
    for (int i = 0; i < _khuyenMaiDaChon.length; i++) {
      if (_khuyenMaiDaChon[i].maKM == maKM) {
        return true;
      }
    }
    return false;
  }

  HoaDonService _hoaDonService = HoaDonService();
  List<HoaDonModel> _hoaDonTMP = [];
  int _maHD = 0;
  int get maHD => _maHD;

  void aotoMaHD() async {
    _hoaDonTMP = await _hoaDonService.getHoaDon(_coSo!);
    if (!_hoaDonTMP.isNotEmpty) {
      _maHD = 1;
    } else {
      _maHD = int.parse(_hoaDonTMP[_hoaDonTMP.length - 1].maHD.toString()) + 1;
    }
    notifyListeners();
  }

  BanHoatDongModel? _banHoatDong;
  BanHoatDongModel? get banHoatDong => _banHoatDong;
  void getbanYCTT(String maBan) async {
    _banHoatDong = await _banHDService.getOnlyBanHD(maBan, _coSo!);
    notifyListeners();
  }
  // end thanh toan
}
