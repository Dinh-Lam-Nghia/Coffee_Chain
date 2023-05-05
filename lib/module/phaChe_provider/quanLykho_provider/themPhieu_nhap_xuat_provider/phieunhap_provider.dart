import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieunhap_model.dart';
import 'package:flutter/material.dart';

class PhieuNhapProvider extends ChangeNotifier {
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

  double _tongTien = 0;
  double get tongTien => _tongTien;

  List<PhieuNhapModel> _phieuNhap = [];
  List<PhieuNhapModel> get phieuNhap => _phieuNhap;

  void getListPhieuNhap() {
    _phieuNhap = [
      PhieuNhapModel(
        maPhieu: 'PN0001',
        maNVL: 'CAFFEE',
        tenNVL: 'CAFE',
        donViTinh: 'kg',
        soLuong: 100,
        hsd: '21/01/2022',
        donGia: 170.000,
        thanhtien: 1700000,
      ),
      PhieuNhapModel(
        maPhieu: 'PN0001',
        maNVL: 'CAFFEE',
        tenNVL: 'CAFE',
        donViTinh: 'kg',
        soLuong: 100,
        hsd: '21/01/2022',
        donGia: 170.000,
        thanhtien: 1700000,
      ),
      PhieuNhapModel(
        maPhieu: 'PN0001',
        maNVL: 'CAFFEE',
        tenNVL: 'CAFE',
        donViTinh: 'kg',
        soLuong: 100,
        hsd: '21/01/2022',
        donGia: 170.000,
        thanhtien: 1700000,
      ),
      PhieuNhapModel(
        maPhieu: 'PN0001',
        maNVL: 'CAFFEE',
        tenNVL: 'CAFE',
        donViTinh: 'kg',
        soLuong: 100,
        hsd: '21/01/2022',
        donGia: 170.000,
        thanhtien: 1700111,
      ),
    ];
    notifyListeners();
  }

  void tongtien(double? tien) {
    _tongTien += tien!;
    notifyListeners();
  }

  void xoaDong(String maNVL) {
    print(maNVL);
    notifyListeners();
  }

  final TextEditingController _maPhieu = TextEditingController();
  TextEditingController get maphieu => _maPhieu;
  final TextEditingController _maNVL = TextEditingController();
  TextEditingController get maNVL => _maNVL;
  final TextEditingController _tenNVL = TextEditingController();
  TextEditingController get tenNVL => _tenNVL;
  final TextEditingController _donViTinh = TextEditingController();
  TextEditingController get donViTinh => _donViTinh;
  final TextEditingController _soLuong = TextEditingController();
  TextEditingController get soLuong => _soLuong;
  final TextEditingController _hsd = TextEditingController();
  TextEditingController get hsd => _hsd;
  final TextEditingController _donGia = TextEditingController();
  TextEditingController get donGia => _donGia;
  final TextEditingController _thanhTien = TextEditingController();
  TextEditingController get thanhTien => _donGia;
}
