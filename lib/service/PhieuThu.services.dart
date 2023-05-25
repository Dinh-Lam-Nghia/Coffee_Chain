import 'dart:convert';

import 'package:coffee_chain/models/thungan/them_phieu_nhap_xuat_model/phieuthu_model.dart';
import 'package:coffee_chain/service/url.dart';
import 'package:http/http.dart' as http;

class PhieuThuService {
  Future<List<PhieuThuModel>> getPhieuThu(String coSo) async{
    var url = Uri.parse(Url.getPhieuThu);
    var res = await http.post(url, body: {'coSo': coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => PhieuThuModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
  }
  }

  Future<void> addPhieuThu(
    String maPhieuTC,
    String ngayGLHD,
    String maHD,
    String nguoiTHD,
    String soTPT,
    String xemLHD,
  ) async {
    var url = Uri.parse(Url.addPhieuThu);

    await http.post(url, body: {
      "maPhieuTC": maPhieuTC,
      "ngayGLHD": ngayGLHD,
      "maHD": maHD,
      "nguoiTHD": nguoiTHD,
      "soTPT": soTPT,
      "xemLHD": xemLHD,
    });
  }

  Future<void> deletePhieuThuId(String id) async {
    var url = Uri.parse(Url.deletePhieuThuId);
    await http.post(url, body: {"id": id});
  }

  Future<void> deletePhieuThuMaPhieu(String maPhieuTC) async {
    var url = Uri.parse(Url.deletePhieuThuMaPhieu);
    await http.post(url, body: {"maPhieuTC": maPhieuTC});
  }


}