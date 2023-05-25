import 'dart:convert';

import 'package:coffee_chain/models/thungan/them_phieu_nhap_xuat_model/phieuchi_model.dart';
import 'package:coffee_chain/service/url.dart';
import 'package:http/http.dart' as http;

class PhieuChiService{
  Future<List<PhieuChiModel>> getPhieuChi(String coSo) async {
    var url = Uri.parse(Url.getPhieuChi);
    var res = await http.post(url, body: {'coSo': coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => PhieuChiModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> addPhieuChi(
    String maPhieuTC,
    String sTT,
    String chiPNVL,
    String chiPDN,
    String khac,
    String soTien,
    String ghiChu,
  ) async{
    var url = Uri.parse(Url.addPhieuChi);

    await http.post(url, body: {
      "maPhieuTC": maPhieuTC,
      "sTT": sTT,
      "chiPNVL": chiPNVL,
      "chiPDN": chiPDN,
      "khac": khac,
      "soTien": soTien,
      "ghiChu": ghiChu,
    });
  }
  Future<void> deletePhieuChiId(String id) async {
    var url = Uri.parse(Url.deletePhieuChiId);
    await http.post(url, body: {"id": id});
  }
  Future<void> deletePhieuChiMaPhieu(String maPhieuTC) async {
    var url = Uri.parse(Url.deletePhieuChiMaPhieu);
    await http.post(url, body: {"maPhieuTC": maPhieuTC});
  }
}