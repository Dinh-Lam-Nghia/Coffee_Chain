import 'package:coffee_chain/models/phache/tablePhieu_model.dart';
import 'package:coffee_chain/service/PhieuNhapXuat.service.dart';
import 'package:flutter/material.dart';

class TablePhieuProvider extends ChangeNotifier {
  List<TablePhieuModel> _TablePhieu = [];
  List<TablePhieuModel> get TablePhieu => _TablePhieu;

  final TablePhieuNXService _phieuNXService = TablePhieuNXService();

  void getTablePhieu() async {
    _TablePhieu = await _phieuNXService.getTablePhieuNX();
    notifyListeners();
  }

  String loaiPhieu(String loaiPhieuNX) {
    if (loaiPhieuNX == 'pn' || loaiPhieuNX == 'PN') {
      return "Phiếu nhập";
    } else if (loaiPhieuNX == 'px' || loaiPhieuNX == 'PX') {
      return "Phiếu xuất";
    }
    return "....";
  }

  void deletePhieuNX(String maPhieuNX) async {
    await _phieuNXService.deletePhieuNX(maPhieuNX);
    getTablePhieu();
    notifyListeners();
  }
}
