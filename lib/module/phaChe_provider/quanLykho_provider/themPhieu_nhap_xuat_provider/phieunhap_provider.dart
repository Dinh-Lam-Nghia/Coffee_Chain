import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phache/tablePhieu_model.dart';
import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieunhap_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:coffee_chain/service/NVL.service.dart';
import 'package:coffee_chain/service/PhieuNhapKho.service.dart';
import 'package:coffee_chain/service/PhieuNhapXuat.service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class PhieuNhapProvider extends ChangeNotifier {
  TextEditingController _maPN = TextEditingController();
  TextEditingController get maPN => _maPN;
  TextEditingController _nguoiLPN = TextEditingController();
  TextEditingController get nguoiLPN => _nguoiLPN;
  final TextEditingController _ngayNhapPhieu = TextEditingController();
  TextEditingController get ngayNhapPhieu => _ngayNhapPhieu;
  final TextEditingController _nguoiGiao = TextEditingController();
  TextEditingController get nguoiGiao => _nguoiGiao;
  final TextEditingController _nhaCungCap = TextEditingController();
  TextEditingController get nhaCungCap => _nhaCungCap;
  final TextEditingController _layDL = TextEditingController();
  TextEditingController get layDL => _layDL;
  final TextEditingController _chiPhiDV = TextEditingController();
  TextEditingController get chiPhiDV => _chiPhiDV;
  final TextEditingController _chiPhiKhac = TextEditingController();
  TextEditingController get chiPhiKhac => _chiPhiKhac;

  TextEditingController _maPhieu = TextEditingController();
  TextEditingController get maphieu => _maPhieu;
  final TextEditingController _maNVL = TextEditingController();
  TextEditingController get maNVL => _maNVL;
  final TextEditingController _tenNVL = TextEditingController();
  TextEditingController get tenNVL => _tenNVL;
  final TextEditingController _donViTinh = TextEditingController();
  TextEditingController get donViTinh => _donViTinh;
  final TextEditingController _soLuong = TextEditingController();
  TextEditingController get soLuong => _soLuong;
  final TextEditingController _hsd = TextEditingController();
  TextEditingController get hsd => _hsd;
  final TextEditingController _donGia = TextEditingController();
  TextEditingController get donGia => _donGia;
  final TextEditingController _thanhTien = TextEditingController();
  TextEditingController get thanhTien => _thanhTien;

  double _tongTien = 0;
  double get tongTien => _tongTien;

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
    _maPN = TextEditingController(text: _ma);
    _maPhieu = TextEditingController(text: _ma);
    _nguoiLPN = TextEditingController(text: _tenNV);
    getListPhieuNhap();
    notifyListeners();
  }

  List<PhieuNhapModel> _phieuNhapTMP = [];
  final List<PhieuNhapModel> _phieuNhap = [];
  List<PhieuNhapModel> get phieuNhap => _phieuNhap;
  final PhieuNhapService _phieuNhapService = PhieuNhapService();
  void getListPhieuNhap() async {
    _phieuNhapTMP = await _phieuNhapService.getPhieuNhap(_coSo!);
    for (int i = 0; i < _phieuNhapTMP.length; i++) {
      if (_phieuNhapTMP[i].maPhieuNX == cout.toString()) {
        _phieuNhap.add(_phieuNhapTMP[i]);
      }
    }
    sumTien();
    notifyListeners();
  }

  double _sum = 0;
  double get sum => _sum;
  void sumTien() {
    List<double> numbers = [];
    for (int i = 0; i < _phieuNhap.length; i++) {
      numbers.add(double.parse(_phieuNhap[i].thanhTien.toString()));
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
    String hsd = _hsd.text;
    String donGia = _donGia.text;
    double a = double.parse(_soLuong.text);
    double b = double.parse(_donGia.text);
    double c = a * b;
    String thanhTien = '$c';
    String coSo = _coSo!;

    addPhieuNhap(
        maPhieuNX, maNVL, donViTinh, sLuong, hsd, donGia, thanhTien, coSo);
    notifyListeners();
  }

  void addPhieuNhap(
      String maPhieuNX,
      String maNVL,
      String donViTinh,
      String sLuong,
      String hsd,
      String donGia,
      String thanhTien,
      String coSo) async {
    await _phieuNhapService.addPhieuNhap(
      maPhieuNX,
      maNVL,
      donViTinh,
      sLuong,
      hsd,
      donGia,
      thanhTien,
      coSo,
    );
    _phieuNhap.clear();
    autoMaPN();
    _maNVL.clear();
    _tenNVL.clear();
    _donViTinh.clear();
    _donGia.clear();
    _soLuong.clear();
    _hsd.clear();
    _donGia.clear();
    notifyListeners();
  }

  void xoaDong(String id) async {
    await _phieuNhapService.deletePhieuNhapId(id);
    _phieuNhap.clear();
    autoMaPN();
    notifyListeners();
  }

  void luuPhieuNX(context) async {
    int i = _listPhieuTMP.length;
    int cout = 0;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuNX.toString()) + 1;
    String maPhieuNX = cout.toString();
    String nguoiTaoPhieuNX = _nguoiLPN.text;
    String ngayTaoPhieuNX = _ngayNhapPhieu.text;
    final n = _ngayNhapPhieu.text.split('/');
    String ngayTPNX = '${n[2]}${n[1]}${n[0]}';
    String nguoiGiao = _nguoiGiao.text;
    String nhaCungCap = _nhaCungCap.text;
    String soTienNX = _sum.toString();
    String tienThuTuDichVu = _chiPhiDV.text;
    String tienThuKhac = _chiPhiKhac.text;
    double a = double.parse(tienThuTuDichVu);
    double b = double.parse(tienThuKhac);
    double c = double.parse(soTienNX);
    double d = a + b + c;
    String tongTien = d.toString();
    String coSo = _coSo!;

    await _phieuNXService.savePhieuNX(
      maPhieuNX,
      'pn',
      nguoiTaoPhieuNX,
      ngayTaoPhieuNX,
      ngayTPNX,
      '00/00/0000',
      '00/00/0000',
      nguoiGiao,
      nhaCungCap,
      soTienNX,
      tienThuTuDichVu,
      tienThuKhac,
      tongTien,
      coSo,
    );
    Navigator.of(context).pop();
    notifyListeners();
  }

  void clickHuy(context) async {
    String maPhieuNX = cout.toString();
    await _phieuNhapService.deletePhieuNhapMaPhieu(maPhieuNX);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void timkiem(String value) {
    List<PhieuNhapModel> _TK = [];
    _phieuNhap.clear();
    (value == '')
        ? _TK = _phieuNhapTMP
        : _TK = _phieuNhapTMP
            .where((element) =>
                element.tenNVL!.toUpperCase().contains(value.toUpperCase()))
            .toList();
    for (int i = 0; i < _TK.length; i++) {
      if (_TK[i].maPhieuNX == cout.toString()) {
        _phieuNhap.add(_TK[i]);
      }
    }
    notifyListeners();
  }

  void load() {
    notifyListeners();
  }
}
