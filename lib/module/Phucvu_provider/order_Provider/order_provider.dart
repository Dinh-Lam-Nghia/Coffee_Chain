import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:flutter/material.dart';

enum clickMenuOrder { dangpv, yctramon, mangve }

class OrderProvider extends ChangeNotifier {
  List<BanHoatDongModel> _listBanHD = [];
  List<BanHoatDongModel> get listBanHD => _listBanHD;

  
  String _tenNV = 'A';
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
  void getAccPQ(String maNV) async {
    print(maNV);
    _nhanVien = await _nhanVienService.getNhanVien(maNV);
    _tenNV = _nhanVien!.tenNV.toString();

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());
    
    notifyListeners();
  }

  void getListBanHD() {
    _listBanHD = [
      BanHoatDongModel(
        maBan: 'b001t1',
        tenBan: 'Bàn 001 - tâng 1',
        order: '1.1',
        nguoiPhucVu: 'Dinh Lam Nghia',
        slKhach: 3,
        tongTien: 2000.000,
        dangPhucVu: 1,
        thanhToan: 0,
        mangve: 0,
      ),
      BanHoatDongModel(
        maBan: 'b002t1',
        tenBan: 'Bàn 002 - tâng 1',
        order: '1.2',
        nguoiPhucVu: 'Dinh Lam Nghia',
        slKhach: 4,
        tongTien: 2000.000,
        dangPhucVu: 0,
        thanhToan: 1,
        mangve: 0,
      ),
      BanHoatDongModel(
        maBan: 'b001t2',
        tenBan: 'Bàn 001 - tâng 2',
        order: '1.4',
        nguoiPhucVu: 'Dinh Lam Nghia',
        slKhach: 5,
        tongTien: 2000.000,
        dangPhucVu: 0,
        thanhToan: 0,
        mangve: 1,
      ),
    ];
    notifyListeners();
  }

  clickMenuOrder _clickMnOd = clickMenuOrder.dangpv;
  clickMenuOrder get clickMnOd => _clickMnOd;

  void clickDPV() {
    _clickMnOd = clickMenuOrder.dangpv;
    notifyListeners();
  }

  void clickYCTT() {
    _clickMnOd = clickMenuOrder.yctramon;
    notifyListeners();
  }

  void clickMV() {
    _clickMnOd = clickMenuOrder.mangve;
    notifyListeners();
  }

  // int _coutDPV = 0;
  // int get coutDPV => _coutDPV;
  // int _coutYCTT = 0;
  // int get coutYCTT => _coutYCTT;
  // int _coutMV = 0;
  // int get coutMV => _coutMV;

  final List<BanHoatDongModel> _listDPV = [];
  List<BanHoatDongModel> get listDPV => _listDPV;
  final List<BanHoatDongModel> _listYCTT = [];
  List<BanHoatDongModel> get listYCTT => _listYCTT;
  final List<BanHoatDongModel> _listMV = [];
  List<BanHoatDongModel> get listMV => _listMV;
  void getSL() {
    _listYCTT.clear();
    for (int i = 0; i < _listBanHD.length; i++) {
      if (_listBanHD[i].dangPhucVu == 1) {
        _listDPV.add(_listBanHD[i]);
        // _coutDPV++;
      }
      if (_listBanHD[i].thanhToan == 1) {
        _listYCTT.add(_listBanHD[i]);
        // _coutYCTT++;
      }
      if (_listBanHD[i].mangve == 1) {
        _listMV.add(_listBanHD[i]);
        // _coutMV++;
      }
    }
  }
}
