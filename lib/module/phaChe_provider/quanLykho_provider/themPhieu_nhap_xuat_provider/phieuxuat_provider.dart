import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phache/tablePhieu_model.dart';
import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieuxuat_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:coffee_chain/service/NVL.service.dart';
import 'package:coffee_chain/service/PhieuNhapXuat.service.dart';
import 'package:coffee_chain/service/phieuXuatKho.service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class PhieuXuatProvider extends ChangeNotifier {
  TextEditingController _maPX = TextEditingController();
  TextEditingController get maPX => _maPX;
  TextEditingController _nguoiLPX = TextEditingController();
  TextEditingController get nguoiLPX => _nguoiLPX;
  final TextEditingController _ngayXuatPhieu = TextEditingController();
  TextEditingController get ngayXuatPhieu => _ngayXuatPhieu;
  final TextEditingController _layDL = TextEditingController();
  TextEditingController get layDL => _layDL;
  final TextEditingController _tuNgay = TextEditingController();
  TextEditingController get tuNgay => _tuNgay;
  final TextEditingController _denNgay = TextEditingController();
  TextEditingController get denNgay => _denNgay;

  TextEditingController _maPhieu = TextEditingController();
  TextEditingController get maPhieu => _maPhieu;
  final TextEditingController _maNVL = TextEditingController();
  TextEditingController get maNVL => _maNVL;
  final TextEditingController _tenNVL = TextEditingController();
  TextEditingController get tenNVL => _tenNVL;
  final TextEditingController _donViTinh = TextEditingController();
  TextEditingController get donViTinh => _donViTinh;
  final TextEditingController _soLuong = TextEditingController();
  TextEditingController get soLuong => _soLuong;
  final TextEditingController _donGia = TextEditingController();
  TextEditingController get donGia => _donGia;

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

    autoMaPN();
    notifyListeners();
  }

  double _tongTien = 0;
  double get tongTien => _tongTien;

  final TablePhieuNXService _phieuNXService = TablePhieuNXService();
  List<TablePhieuModel> _listPhieuTMP = [];
  String? _ma;
  int cout = 0;
  void autoMaPN() async {
    _listPhieuTMP = await _phieuNXService.getTablePhieuNX(_coSo!);
    int i = _listPhieuTMP.length;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuNX.toString()) + 1;
    _ma = "pn0$cout";
    _maPX = TextEditingController(text: _ma);
    _maPhieu = TextEditingController(text: _ma);
    _nguoiLPX = TextEditingController(text: _tenNV);
    getListPhieuXuat();
    notifyListeners();
  }

  List<PhieuXuatModel> _phieuXuatTMP = [];
  List<PhieuXuatModel> _phieuXuat = [];
  List<PhieuXuatModel> get phieuXuat => _phieuXuat;
  final PhieuXuatService _phieuXuatService = PhieuXuatService();
  void getListPhieuXuat() async {
    _phieuXuatTMP = await _phieuXuatService.getPhieuXuat(_coSo!);
    for (int i = 0; i < _phieuXuatTMP.length; i++) {
      if (_phieuXuatTMP[i].maPhieuNX == cout.toString()) {
        _phieuXuat.add(_phieuXuatTMP[i]);
      }
    }
    sumTien();
    notifyListeners();
  }

  double _sum = 0;
  double get sum => _sum;
  void sumTien() {
    List<double> numbers = [];
    for (int i = 0; i < _phieuXuat.length; i++) {
      numbers.add(double.parse(_phieuXuat[i].thanhTien.toString()));
    }
    print(numbers);
    _sum = numbers.sum;
    notifyListeners();
    numbers.clear();
  }

  final DsNVLService _dsNVLModelService = DsNVLService();
  String _er = '';
  String get er => _er;
  int validateThemdong() {
    print(_maNVL.selection.baseOffset.toInt());
    if (_maNVL.selection.baseOffset.toInt() < 1) {
      _er = 'Bạn chưa nhập mã NVL!';
      load();
      return 0;
    }
    if (_tenNVL.selection.baseOffset.toInt() < 1) {
      _er = 'Bạn chưa nhập tên NVL!';
      load();
      return 0;
    }
    if (_donViTinh.selection.baseOffset.toInt() < 1) {
      _er = 'Bạn chưa nhập đơn vị tính!';
      load();
      return 0;
    }
    if (_soLuong.selection.baseOffset.toInt() < 1) {
      _er = 'Bạn chưa nhập số luọng!';
      load();
      return 0;
    }
    if (_donGia.selection.baseOffset.toInt() < 1) {
      _er = 'Bạn chưa nhập đơn giá!';
      load();
      return 0;
    }
    checkMaNVL(_maNVL.text.toString(), _tenNVL.text.toString());
    notifyListeners();
    return 0;
  }

  void checkMaNVL(String ma, String ten) async {
    bool checkMaNVL = await _dsNVLModelService.checkMaNVL(ma, ten);
    int i = _listPhieuTMP.length;
    int cout = 0;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuNX.toString()) + 1;
    String maPhieuNX = cout.toString();
    String maNVL = _maNVL.text;
    String donViTinh = _donViTinh.text;
    String sLuong = _soLuong.text;
    String donGia = _donGia.text;
    double a = double.parse(_soLuong.text);
    double b = double.parse(_donGia.text);
    double c = a * b;
    String thanhTien = '$c';
    String coSo = _coSo!;

    addPhieuXuat(
      maPhieuNX,
      maNVL,
      donViTinh,
      sLuong,
      donGia,
      thanhTien,
      coSo,
    );
    notifyListeners();
  }

  void addPhieuXuat(
    String maPhieuNX,
    String maNVL,
    String donViTinh,
    String sLuong,
    String donGia,
    String thanhTien,
    String coSo,
  ) async {
    await _phieuXuatService.addPhieuXuat(
      maPhieuNX,
      maNVL,
      donViTinh,
      sLuong,
      donGia,
      thanhTien,
      coSo,
    );
    _phieuXuat.clear();
    autoMaPN();
    _maNVL.clear();
    _tenNVL.clear();
    _donViTinh.clear();
    _donGia.clear();
    _soLuong.clear();
    _donGia.clear();
    notifyListeners();
  }

  void xoaDong(String id) async {
    print(maNVL);
    await _phieuXuatService.deletePhieuXuatId(id);
    _phieuXuat.clear();
    autoMaPN();
    notifyListeners();
  }

  void clickHuy(context) async {
    String maPhieuNX = cout.toString();
    await _phieuXuatService.deletePhieuXuatMaPhieu(maPhieuNX);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void timkiem(String value) {
    List<PhieuXuatModel> _TK = [];
    _phieuXuat.clear();
    (value == '')
        ? _TK = _phieuXuatTMP
        : _TK = _phieuXuatTMP
            .where((element) =>
                element.tenNVL!.toUpperCase().contains(value.toUpperCase()))
            .toList();
    for (int i = 0; i < _TK.length; i++) {
      if (_TK[i].maPhieuNX == cout.toString()) {
        _phieuXuat.add(_TK[i]);
      }
    }
    notifyListeners();
  }

  void luuPhieuNX(context) async {
    int i = _listPhieuTMP.length;
    int cout = 0;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuNX.toString()) + 1;
    String maPhieuNX = cout.toString();
    String nguoiTaoPhieuNX = _nguoiLPX.text;
    String ngayTaoPhieuNX = _ngayXuatPhieu.text;
    final a = _ngayXuatPhieu.text.split('/');
    String ngayTPNX = '${a[2]}${a[1]}${a[0]}';
    String tuNgay = _tuNgay.text;
    String denNgay = _denNgay.text;
    String soTienNX = _sum.toString();
    String tongTien = soTienNX.toString();
    String coSo = _coSo!;

    await _phieuNXService.savePhieuNX(
      maPhieuNX,
      'px',
      nguoiTaoPhieuNX,
      ngayTaoPhieuNX,
      ngayTPNX,
      tuNgay,
      denNgay,
      '...',
      '...',
      soTienNX,
      '0',
      '0',
      tongTien,
      coSo,
    );
    Navigator.of(context).pop();
    notifyListeners();
  }

  void load() {
    notifyListeners();
  }
}
