import 'package:coffee_chain/models/phache/tablePhieu_model.dart';
import 'package:flutter/material.dart';

class TablePhieuProvider extends ChangeNotifier {
  List<TablePhieuModel> _TablePhieu = [];
  List<TablePhieuModel> get TablePhieu => _TablePhieu;

  void getTablePhieu() {
    _TablePhieu = [
      TablePhieuModel(
        ngayTao: '11/01/2022',
        maPhieu: 'PN123456',
        loaiPhieu: 'Xuất kho',
        soTien: 4987.000,
        nguoiTaoPhieu: 'Đinh ',
      ),
      TablePhieuModel(
        ngayTao: '11/01/2022',
        maPhieu: 'PX123456',
        loaiPhieu: 'Xuất kho',
        soTien: 4987.000,
        nguoiTaoPhieu: 'Đinh Lâm ',
      ),
      TablePhieuModel(
        ngayTao: '11/01/2022',
        maPhieu: 'PX123456',
        loaiPhieu: 'Xuất kho',
        soTien: 4987.000,
        nguoiTaoPhieu: 'Đinh Lâm Nghĩa',
      ),
    ];
    notifyListeners();
  }
}
