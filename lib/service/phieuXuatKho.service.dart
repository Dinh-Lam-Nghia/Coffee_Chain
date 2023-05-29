import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieuxuat_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class PhieuXuatService {
  Future<List<PhieuXuatModel>> getPhieuXuat(String coSo) async {
    var url = Uri.parse(Url.getPhieuXuatKho);
    var res = await http.post(url, body: {'coSo': coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => PhieuXuatModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> addPhieuXuat(
    String maPhieuNX,
    String maNVL,
    String donViTinh,
    String sLuong,
    String donGia,
    String thanhTien,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addPhieuXuat);
    await http.post(url, body: {
      "maPhieuNX": maPhieuNX,
      "maNVL": maNVL,
      "donViTinh": donViTinh,
      "sLuong": sLuong,
      "donGia": donGia,
      "thanhTien": thanhTien,
      "coSo": coSo,
    });
  }

  Future<void> deletePhieuXuatId(String id) async {
    var url = Uri.parse(Url.deletePhieuXuatId);
    await http.post(url, body: {"id": id});
  }

  Future<void> deletePhieuXuatMaPhieu(String maPhieuNX, String coSo) async {
    var url = Uri.parse(Url.deletePhieuXuatMaPhieu);
    await http.post(url, body: {"maPhieuNX": maPhieuNX,
      "coSo": coSo,
    });
  }
}
