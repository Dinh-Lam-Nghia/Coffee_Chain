import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieuxuat_model.dart';
import 'package:flutter/material.dart';

class PhieuXuatProvider extends ChangeNotifier {
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
  
  final TextEditingController _maPhieu = TextEditingController();
  TextEditingController get maPhieu =>_maPhieu;
  final TextEditingController _maNVL = TextEditingController();
  TextEditingController get maNVL=>_maNVL;
  final TextEditingController _tenNVL = TextEditingController();
  TextEditingController get tenNVL=>_tenNVL;
  final TextEditingController _donViTinh = TextEditingController();
  TextEditingController get donViTinh=>_donViTinh;
  final TextEditingController _soLuong = TextEditingController();
  TextEditingController get soLuong=>_soLuong;
  final TextEditingController _donGia = TextEditingController();
  TextEditingController get donGia =>_donGia;
  final TextEditingController _thanhTien = TextEditingController();
  TextEditingController get thanhTien=>_thanhTien;

  List<PhieuXuatModel> _phieuXuat = [];
  List<PhieuXuatModel> get phieuXuat => _phieuXuat;

  double _tongTien = 0;
  double get tongTien => _tongTien;

  void getListPhieuXuat() {
    _phieuXuat = [
      PhieuXuatModel(
          maPhieu: 'PX0001',
          maNVL: 'ssss',
          tenNVL: 'cafe',
          donViTinh: 'kg',
          donGia: 10000,
          soLuong: 10,
          thanhTien: 100000),
      PhieuXuatModel(
          maPhieu: 'PX0001',
          maNVL: 'ssss',
          tenNVL: 'cafe',
          donViTinh: 'kg',
          donGia: 10000,
          soLuong: 10,
          thanhTien: 100000),
      PhieuXuatModel(
          maPhieu: 'PX0001',
          maNVL: 'ssss',
          tenNVL: 'cafe',
          donViTinh: 'kg',
          donGia: 10000,
          soLuong: 10,
          thanhTien: 100000),
      PhieuXuatModel(
          maPhieu: 'PX0001',
          maNVL: 'ssss',
          tenNVL: 'cafe',
          donViTinh: 'kg',
          donGia: 10000,
          soLuong: 10,
          thanhTien: 100000),
    ];
    notifyListeners(); 
  }
  void tongtien(double? tien){
    _tongTien += tien!;
    notifyListeners();
  }
  void xoaDong(String maNVL) {
    print(maNVL);
    notifyListeners();
  }
}
