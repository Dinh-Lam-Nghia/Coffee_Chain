import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/phache/DSmonchebien_model.dart';
import 'package:flutter/material.dart';

class DSmonCheBienProvider extends ChangeNotifier {
  List<BanHoatDongModel> _listBanHD = [];
  List<BanHoatDongModel> get listBanHD => _listBanHD;

  List<DSmonCheBienModel> _listDSmonCheBien = [];
  List<DSmonCheBienModel> get listDSmonCheBien => _listDSmonCheBien;

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

  void getListMonCheBien() {
    _listDSmonCheBien = [
      DSmonCheBienModel(
        maBan: 'b001t2',
        tenMon: 'đá say',
        soLuong: 1,
        hoanThanh: false,
      ),
      DSmonCheBienModel(
        maBan: 'b001t1',
        tenMon: 'coffee',
        soLuong: 1,
        hoanThanh: false,
      ),
      DSmonCheBienModel(
        maBan: 'b001t1',
        tenMon: 'Ts lúa mạch',
        soLuong: 5,
        hoanThanh: false,
      ),
      DSmonCheBienModel(
        maBan: 'b002t1',
        tenMon: 'coffee',
        soLuong: 3,
        hoanThanh: false,
      ),
      DSmonCheBienModel(
        maBan: 'b002t1',
        tenMon: 'Sinh tố dừa',
        soLuong: 2,
        hoanThanh: false,
      ),
      DSmonCheBienModel(
        maBan: 'b002t1',
        tenMon: 'trà đào',
        soLuong: 1,
        hoanThanh: false,
      ),
    ];
    notifyListeners();
  }

  List<DSmonCheBienModel> _listDSmonCheBienTungban = [];
  List<DSmonCheBienModel> get listDSmonCheBienTungBan =>
      _listDSmonCheBienTungban;
  int getSLuongMonTrenBan(String maBan) {
    _listDSmonCheBienTungban.clear();
    int cout = 0;
    for (int i = 0; i < _listDSmonCheBien.length; i++) {
      if (_listDSmonCheBien[i].maBan.toString() == maBan.toString()) {
        _listDSmonCheBienTungban.add(_listDSmonCheBien[i]);
        cout++;
      }
    }
    return cout;
  }

  bool _soLanClick = false;
  bool get soLanClick => _soLanClick;
  String? _chonBan;
  String? get chonBan => _chonBan;
  void onClickBan(String maBan) {
    _soLanClick = !_soLanClick;
    if (_soLanClick) {
      clickchonBan(maBan);
    }
    notifyListeners();
  }

  void clickchonBan(String maBan) {
    _chonBan = maBan;
    print(_chonBan);
    notifyListeners();
  }
}
