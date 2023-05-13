import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/models/phache/DSmonchebien_model.dart';
import 'package:coffee_chain/service/BanHD.service.dart';
import 'package:coffee_chain/service/DSmonCheBien.service.dart';
import 'package:flutter/material.dart';

class DSmonCheBienProvider extends ChangeNotifier {
  List<BanHoatDongModel> _listBanHDTMP = [];

  List<BanHoatDongModel> _listBanHD = [];
  List<BanHoatDongModel> get listBanHD => _listBanHD;

  List<DSmonCheBienModel> _listDSmonCheBien = [];
  List<DSmonCheBienModel> get listDSmonCheBien => _listDSmonCheBien;

  final BanHDService _banHDService = BanHDService();
  final DSmonCheBienService _dSmonCheBienService = DSmonCheBienService();

  void getListBanHD() async {
    List<BanHoatDongModel> _TMP = [];
    _TMP.clear();
    _listBanHDTMP = await _banHDService.getBanHD();

    for (int i = 0; i < _listBanHDTMP.length; i++) {
      if (_listBanHDTMP[i].hoanThanhMon == 0) _TMP.add(_listBanHDTMP[i]);
    }

    _listBanHD = _TMP;
    notifyListeners();
  }

  void getListMonCheBien() async {
    _listDSmonCheBien = await _dSmonCheBienService.getDSmonCheBien();
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
    } else {
      _chonBan = null;
    }
    notifyListeners();
  }

  void clickchonBan(String maBan) {
    _chonBan = maBan;
    print(_chonBan);
    notifyListeners();
  }

  final BanHDService _updatebanHD = BanHDService();
  void onclickTraMon() async {
    if (_chonBan != null) {
      await _updatebanHD.UpdateBanHDHT(_chonBan.toString(), 1);
      getListBanHD();
      getListMonCheBien();
    }
    notifyListeners();
  }

  // xác nhạn hoàn thành
  final DSmonCheBienService _monHoanThanh = DSmonCheBienService();
  void postUpMonHoanThanh(String maBan, String maMon, int hoanThanh) async {
    print(maBan + maMon);
    if (hoanThanh == 0) {
      await _monHoanThanh.postUpMonHoanThanh(maBan, maMon, 1);
    } else {
      await _monHoanThanh.postUpMonHoanThanh(maBan, maMon, 0);
    }
    getListBanHD();
    getListMonCheBien();
    notifyListeners();
  }
}
