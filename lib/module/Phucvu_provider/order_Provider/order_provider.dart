import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:flutter/material.dart';

enum clickMenuOrder { dangpv, yctramon, mangve }

class OrderProvider extends ChangeNotifier {
  List<BanHoatDongModel> _listBanHD = [];
  List<BanHoatDongModel> get listBanHD => _listBanHD;

  void getListBanHD() {
    _listBanHD = [
      BanHoatDongModel(
        maBan: 'b001t1',
        tenBan: 'Bàn 001 - tâng 1',
        order: '1.1',
        phucVu: 'Dinh Lam Nghia',
        soLuongNGuoi: 3,
        tongTien: 2000.000,
        dangPV: true,
        thanhToan: false,
        mangVe: false,
      ),
      BanHoatDongModel(
        maBan: 'b002t1',
        tenBan: 'Bàn 002 - tâng 1',
        order: '1.2',
        phucVu: 'Dinh Lam Nghia',
        soLuongNGuoi: 4,
        tongTien: 2000.000,
        dangPV: false,
        thanhToan: true,
        mangVe: false,
      ),
      BanHoatDongModel(
        maBan: 'b001t2',
        tenBan: 'Bàn 001 - tâng 2',
        order: '1.4',
        phucVu: 'Dinh Lam Nghia',
        soLuongNGuoi: 5,
        tongTien: 2000.000,
        dangPV: false,
        thanhToan: false,
        mangVe: true,
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
      if (_listBanHD[i].dangPV == true) {
        _listDPV.add(_listBanHD[i]);
        // _coutDPV++;
      }
      if (_listBanHD[i].thanhToan == true) {
        _listYCTT.add(_listBanHD[i]);
        // _coutYCTT++;
      }
      if (_listBanHD[i].mangVe == true) {
        _listMV.add(_listBanHD[i]);
        // _coutMV++;
      }
    }
  }
}
