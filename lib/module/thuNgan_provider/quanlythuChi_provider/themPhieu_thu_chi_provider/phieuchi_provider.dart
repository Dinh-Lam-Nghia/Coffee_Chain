// ignore_for_file: recursive_getters

import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/models/thungan/tablePhieu_model.dart';
import 'package:coffee_chain/models/thungan/them_phieu_nhap_xuat_model/phieuchi_model.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:coffee_chain/service/PhieuChi.services.dart';
import 'package:coffee_chain/service/PhieuThuChi.service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class PhieuChiProvider extends ChangeNotifier {
  TextEditingController _maPC = TextEditingController();
  TextEditingController get maPC => _maPC;
  final TextEditingController _ngayLPC = TextEditingController();
  TextEditingController get ngayLPC => _ngayLPC;
  TextEditingController _nguoiLPC = TextEditingController();
  TextEditingController get nguoiLPC => _nguoiLPC;
  final TextEditingController _layDL = TextEditingController();
  TextEditingController get layDL => _layDL;

  TextEditingController _maPhieu = TextEditingController();
  TextEditingController get maphieu => _maPhieu;
  final TextEditingController _soTT = TextEditingController();
  TextEditingController get soTT => _soTT;
  final TextEditingController _tenKC = TextEditingController();
  TextEditingController get tenKC => _tenKC;
  final TextEditingController _chiPNVL = TextEditingController();
  TextEditingController get chiPNVL => _chiPNVL;
  final TextEditingController _chiPDN = TextEditingController();
  TextEditingController get chiPDN => _chiPDN;
  final TextEditingController _khac = TextEditingController();
  TextEditingController get khac => _khac;
  TextEditingController _soTien = TextEditingController();
  TextEditingController get soTien => _soTien;
  final TextEditingController _ghiChu = TextEditingController();
  TextEditingController get ghiChu => _ghiChu;

  double _tongPhaiThu = 0;
  double get tongPhaiThu => _tongPhaiThu;

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

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());

    _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();

    autoMaPC();
    notifyListeners();
  }

  double _tongTien = 0;
  double get tongTien => _tongTien;

  final TablePhieuTCServices _phieuTCServices = TablePhieuTCServices();
  List<TablePhieuModel> _listPhieuTMP = [];
  String? _ma;
  int cout = 0;
  void autoMaPC() async {
    _listPhieuTMP = await _phieuTCServices.getTablePhieuTC(_coSo!);
    int i = _listPhieuTMP.length;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuTC.toString()) + 1;
    _ma = "pc01$cout";
    _maPC = TextEditingController(text: _ma);
    _maPhieu = TextEditingController(text: _ma);
    _nguoiLPC = TextEditingController(text: _tenNV);
    getListPhieuChi();
    notifyListeners();
  }

  List<PhieuChiModel> _phieuChiTMP = [];
  final List<PhieuChiModel> _phieuChi = [];
  List<PhieuChiModel> get phieuChi => _phieuChi;
  final PhieuChiService _phieuChiService = PhieuChiService();
  void getListPhieuChi() async {
    _phieuChiTMP = await _phieuChiService.getPhieuChi(_coSo!);
    for (int i = 0; i < _phieuChiTMP.length; i++) {
      if (_phieuChiTMP[i].maPhieuTC == cout.toString()) {
        _phieuChi.add(_phieuChiTMP[i]);
      }
    }
    sumTien();
    notifyListeners();
  }

  final double _sum = 0;
  double get sum => _sum;
  void sumTien() {
    List<double> numbers = [];
    for (int i = 0; i < _phieuChi.length; i++) {
      numbers.add(double.parse(_phieuChi[i].thanhTien.toString()));
    }
    print(numbers);
    numbers.clear();
    notifyListeners();
  }

  void addPhieuChi(
    String maPhieuTC,
    String sTT,
    String chiPhiNVL,
    String chiPhiDienNuoc,
    String chiPhiKhac,
    String soTien,
    String note,
    String thanhTien,
  ) async {
    await _phieuChiService.addPhieuChi(
      maPhieuTC,
      sTT,
      chiPhiNVL,
      chiPhiDienNuoc,
      chiPhiKhac,
      soTien,
      note,
      thanhTien,
    );
    _phieuChi.clear();
    autoMaPC();
    _chiPNVL.clear();
    _chiPDN.clear();
    _khac.clear();
    _soTien.clear();
    _ghiChu.clear();
    notifyListeners();
  }

  void luuPhieuTC(context) async {
    int i = _listPhieuTMP.length;
    int cout = 0;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuTC.toString()) + 1;
    String maPhieuTC = cout.toString();
    String nguoiLapPhieuTC = _nguoiLPC.text;
    final n = ngayLPC.text.split('/');
    String thanhTien = _sum.toString();

    await _phieuTCServices.savePhieuTC(
      maPhieuTC,
      '0',
      nguoiLapPhieuTC,
      ngayLPC as String,
      '00/00/000',
      '0',
      '0',
      thanhTien as double,
    );
    Navigator.of(context).pop();
    notifyListeners();
  }

  void clickHuy(context) async {
    String maPhieuTC = cout.toString();
    await _phieuChiService.deletePhieuChiMaPhieu(maPhieuTC);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void load() {
    notifyListeners();
  }
}
