import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/NhanVien.service.dart'; 
import 'package:coffee_chain/service/PhieuThuChi.service.dart';
import 'package:flutter/material.dart';

import '../../../models/thungan/tablePhieu_model.dart';

class TableThuChiProvider extends ChangeNotifier {
  List<TablePhieuModel> _TablePhieu = [];
  List<TablePhieuModel> get TablePhieu => _TablePhieu;

  final TablePhieuTCServices _phieuTCService = TablePhieuTCServices();

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

    getTablePhieu();
    notifyListeners();
  }

  void getTablePhieu() async {
    _TablePhieu = await _phieuTCService.getTablePhieuTC(_coSo!);
    print(_TablePhieu[0].maPhieuTC);
    notifyListeners();
  }

  String loaiPhieu(String loaiPhieuTC) {
    if (loaiPhieuTC == 'pt' || loaiPhieuTC == 'PT') {
      return "Phiếu thu";
    } else if (loaiPhieuTC == 'pc' || loaiPhieuTC == 'PC') {
      return "Phiếu chi";
    }
    return "...";
  }

  void deletePhieuTC(String maPhieuTC) async {
    await _phieuTCService.deletePhieuTC(maPhieuTC);
    getTablePhieu();
    notifyListeners();
  }
}
