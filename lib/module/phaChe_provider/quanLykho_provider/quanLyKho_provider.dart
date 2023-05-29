import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:flutter/material.dart';

class QuanLyKhoProvider extends ChangeNotifier {
  bool _thongKe = false;
  bool get thongKe => _thongKe;

  final TextEditingController _maPN = TextEditingController();
  TextEditingController get maPN => _maPN;
  final TextEditingController _nguoiLPN = TextEditingController();
  TextEditingController get nguoiLPN => _nguoiLPN;
  final TextEditingController _ngayNhapPhieu = TextEditingController();
  TextEditingController get ngayNhapPhieu => _ngayNhapPhieu;
  final TextEditingController _nguoiGiao = TextEditingController();
  TextEditingController get nguoiGiao => _nguoiGiao;
  final TextEditingController _nhaCungCap = TextEditingController();
  TextEditingController get nhaCungCap => _nhaCungCap;
  final TextEditingController _layDL = TextEditingController();
  TextEditingController get layDL => _layDL;

  final TextEditingController _maPX = TextEditingController();
  TextEditingController get maPX => _maPX;
  final TextEditingController _nguoiLPX = TextEditingController();
  TextEditingController get nguoiLPX => _nguoiLPX;
  final TextEditingController _ngayXuatPhieu = TextEditingController();
  TextEditingController get ngayXuatPhieu => _ngayXuatPhieu;
  final TextEditingController _tuNgay = TextEditingController();
  TextEditingController get tuNgay => _tuNgay;
  final TextEditingController _denNgay = TextEditingController();
  TextEditingController get denNgay => _denNgay;

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

    notifyListeners();
  }

  void clickThongkeNVL() {
    _thongKe = !_thongKe;
    notifyListeners();
  }
}
