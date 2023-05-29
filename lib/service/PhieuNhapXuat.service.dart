import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/phache/tablePhieu_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class TablePhieuNXService {
  Future<List<TablePhieuModel>> getTablePhieuNX(String coSo) async {
    var url = Uri.parse(Url.getTablePhieuNX);
    var res = await http.post(url, body: {'coSo': coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => TablePhieuModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> savePhieuNX(
    String maPhieuNX,
    String loaiPhieuNX,
    String nguoiTaoPhieuNX,
    String ngayTaoPhieuNX,
    String ngayTPNX,
    String tuNgay,
    String denNgay,
    String nguoiGiao,
    String nhaCungCap,
    String soTienNX,
    String tienThuTuDichVu,
    String tienThuKhac,
    String tongTien,
    String coSo,
  ) async {
    var url = Uri.parse(Url.savePhieuNX);
    var res = await http.post(url, body: {
      "maPhieuNX": maPhieuNX,
      "loaiPhieuNX": loaiPhieuNX,
      "nguoiTaoPhieuNX": nguoiTaoPhieuNX,
      "ngayTaoPhieuNX": ngayTaoPhieuNX,
      "ngayTPNX": ngayTPNX,
      "tuNgay": tuNgay,
      "denNgay": denNgay,
      "nguoiGiao": nguoiGiao,
      "nhaCungCap": nhaCungCap,
      "soTienNX": soTienNX,
      "tienThuTuDichVu": tienThuTuDichVu,
      "tienThuKhac": tienThuKhac,
      "tongTien": tongTien,
      "coSo": coSo,
    });
  }

  Future<void> deletePhieuNX(String maPhieuNX, String coSo) async {
    var url = Uri.parse(Url.deletePhieuNX);
    await http.post(url, body: {"maPhieuNX": maPhieuNX, "coSo": coSo});
  }
}
