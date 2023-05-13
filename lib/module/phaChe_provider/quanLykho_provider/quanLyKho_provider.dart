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

  void clickThongkeNVL() {
    _thongKe = !_thongKe;
    notifyListeners();
  }
}
