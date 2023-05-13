import 'package:coffee_chain/models/DsNVL_model.dart';
import 'package:coffee_chain/models/phache/tablePhieu_model.dart';
import 'package:coffee_chain/models/phache/tableThongKe_model.dart';
import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieunhap_model.dart';
import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieuxuat_model.dart';
import 'package:coffee_chain/service/NVL.service.dart';
import 'package:coffee_chain/service/PhieuNhapKho.service.dart';
import 'package:coffee_chain/service/PhieuNhapXuat.service.dart';
import 'package:coffee_chain/service/phieuXuatKho.service.dart';
import 'package:flutter/material.dart';

class ThongKeKhoProvider extends ChangeNotifier {
  TextEditingController _startDateInput = TextEditingController();
  TextEditingController get startDateInput => _startDateInput;

  TextEditingController _endDateInput = TextEditingController();
  TextEditingController get endDateInput => _endDateInput;

  final TextEditingController _timKiem = TextEditingController();
  TextEditingController get timKiem => _timKiem;

  List<ThongKeKhoModel> _TKkho = [];
  List<ThongKeKhoModel> _TKkhoRun = [];
  List<ThongKeKhoModel> get TKkho => _TKkhoRun;
  List<ThongKeKhoModel> _TKkhoTMP = [];

  TablePhieuNXService _PNX = TablePhieuNXService();
  List<TablePhieuModel> _phieuNX = [];
  List<TablePhieuModel> get phieuNX => _phieuNX;

  PhieuNhapService _PN = PhieuNhapService();
  List<PhieuNhapModel> _phieuN = [];
  List<PhieuNhapModel> get phieuN => _phieuN;

  PhieuXuatService _PX = PhieuXuatService();
  List<PhieuXuatModel> _phieuX = [];
  List<PhieuXuatModel> get phieuX => _phieuX;

  DsNVLService _VL = DsNVLService();
  List<DsNVLModel> _NVL = [];
  List<DsNVLModel> get NVL => _NVL;

  void getlistThongKeKho() async {
    _NVL = await _VL.getNVL();
    _phieuN = await _PN.getPhieuNhap();
    _phieuX = await _PX.getPhieuXuat();

    for (int a = 0; a < _NVL.length; a++) {
      String _ma = _NVL[a].maNVL.toString();
      String _ten = _NVL[a].tenNVL.toString();
      String _dv = '';
      int _sl = 0;
      int _sln = 0;
      int _slx = 0;
      for (int b = 0; b < _phieuN.length; b++) {
        if (_NVL[a].maNVL == _phieuN[b].maNVL) {
          _dv = _phieuN[b].donViTinh.toString();
          _sln += int.parse(_phieuN[b].sLuong.toString());
        }
      }
      for (int c = 0; c < _phieuX.length; c++) {
        if (_NVL[a].maNVL == _phieuX[c].maNVL) {
          _slx += int.parse(_phieuX[c].sLuong.toString());
        }
      }
      _sl = _sln - _slx;
      if (_sl > 0) {
        _TKkho.add(ThongKeKhoModel(
          maNVL: _ma,
          tenNVL: _ten,
          donViTinh: _dv,
          soLuongTon: _sl.toString(),
          slNhap: _sln.toString(),
          slxuat: _slx.toString(),
        ));
      }
    }
    _TKkhoRun = _TKkho;
    notifyListeners();
  }

  void getfollowNgay() async {
    _TKkho.clear();
    if (_startDateInput.text == '' && _endDateInput.text == '') {
      getlistThongKeKho();
    } else {
      int _start = 00000000, _end = 99999999;
      if (_startDateInput.text != '' || _endDateInput.text != '') {
        if (_startDateInput.text != '') {
          final a = _startDateInput.text.split('/');
          _start = int.parse('${a[2]}${a[1]}${a[0]}');
        }
        if (_endDateInput.text != '') {
          final b = _endDateInput.text.split('/');
          _end = int.parse('${b[2]}${b[1]}${b[0]}');
        }
      }
      _NVL = await _VL.getNVL();
      _phieuNX = await _PNX.getTablePhieuNX();
      _phieuN = await _PN.getPhieuNhap();
      _phieuX = await _PX.getPhieuXuat();

      for (int a = 0; a < _NVL.length; a++) {
        String _ma = _NVL[a].maNVL.toString();
        String _ten = _NVL[a].tenNVL.toString();
        String _dv = '';
        int _sl = 0;
        int _sln = 0;
        int _slx = 0;
        for (int b = 0; b < _phieuN.length; b++) {
          if (_NVL[a].maNVL == _phieuN[b].maNVL) {
            for (int n = 0; n < _phieuNX.length; n++) {
              if (_phieuN[b].maPhieuNX == _phieuNX[n].maPhieuNX) {
                if (int.parse(_phieuNX[n].ngayTPNX.toString()) >= _start &&
                    int.parse(_phieuNX[n].ngayTPNX.toString()) <= _end) {
                  _dv = _phieuN[b].donViTinh.toString();
                  _sln += int.parse(_phieuN[b].sLuong.toString());
                }
              }
            }
          }
        }
        for (int c = 0; c < _phieuX.length; c++) {
          if (_NVL[a].maNVL == _phieuX[c].maNVL) {
            for (int n = 0; n < _phieuNX.length; n++) {
              if (_phieuX[c].maPhieuNX == _phieuNX[n].maPhieuNX) {
                if (int.parse(_phieuNX[n].ngayTPNX.toString()) >= _start &&
                    int.parse(_phieuNX[n].ngayTPNX.toString()) <= _end) {
                  _slx += int.parse(_phieuX[c].sLuong.toString());
                }
              }
            }
          }
        }
        _sl = _sln - _slx;
        if (_sl > 0) {
          _TKkho.add(ThongKeKhoModel(
            maNVL: _ma,
            tenNVL: _ten,
            donViTinh: _dv,
            soLuongTon: _sl.toString(),
            slNhap: _sln.toString(),
            slxuat: _slx.toString(),
          ));
        }
      }

      _TKkhoRun = _TKkho;
    }
    notifyListeners();
  }

  void clear() {
    _TKkho.clear();
    _startDateInput.clear();
    _endDateInput.clear();
    getlistThongKeKho();
    notifyListeners();
  }

  void timkiem(String value) {
    // _TKkhoRun.clear();
    // (value == '')
    //     ? _TKkhoRun = _TKkho
    //     :
    _TKkhoRun = _TKkho.where((element) =>
        element.tenNVL!.toUpperCase().contains(value.toUpperCase())).toList();
    notifyListeners();
  }
}
