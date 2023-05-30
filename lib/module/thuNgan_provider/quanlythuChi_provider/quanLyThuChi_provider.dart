import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/NhanVien.service.dart'; 
import 'package:flutter/material.dart';

class QuanLyThuChiProvider extends ChangeNotifier {


  final TextEditingController _maPT = TextEditingController();
  TextEditingController get maPT => _maPT; 
  final TextEditingController _nguoiLPT = TextEditingController();
  TextEditingController get nguoiLPT => _nguoiLPT;
  final TextEditingController _ngayThuTien = TextEditingController();
  TextEditingController get ngayThuTien => _ngayThuTien;
  final TextEditingController _soDuDauNgay = TextEditingController();
  TextEditingController get soDuDauNgay => _soDuDauNgay;
  final TextEditingController _soDuCuoiNgay = TextEditingController();
  TextEditingController get soDuCuoiNgay => _soDuCuoiNgay;
  final TextEditingController _layDL = TextEditingController();
  TextEditingController get layDL => _layDL;

  final TextEditingController _maPC = TextEditingController();
  TextEditingController get maPC => _maPC; 
  final TextEditingController _ngayLapPC = TextEditingController();
  TextEditingController get ngayLapPC => _ngayLapPC;
  final TextEditingController _nguoiLPC = TextEditingController();
  TextEditingController get nguoiLPC => _nguoiLPC;

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

    notifyListeners();
  }
}