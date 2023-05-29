import 'dart:convert';

import 'package:coffee_chain/service/url.dart';
import 'package:http/http.dart' as http;
import '../models/thungan/tablePhieu_model.dart';

class TablePhieuTCServices {
  Future<List<TablePhieuModel>> getTablePhieuTC(String coSo) async{
    var url = Uri.parse(Url.getTablePhieuTC);
    var res = await http.post(url, body: {'coSo': coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => TablePhieuModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }
  Future<void> savePhieuTC(
  String maPhieuTC,
  String loaiPhieuTC,
  String nguoiTaoPhieuTC,
  String ngayThuTienTC,
  String ngayLapPhieuTC,
  String soDuDN,
  String soDuCN,
  double soTien,
  ) async {
    var url = Uri.parse(Url.savePhieuTC);
    var res = await http.post(url, body:{
      "maPhieuTC": maPhieuTC,
      "loaiPhieuTC": loaiPhieuTC,
      "nguoiTaoPhieuTC": nguoiTaoPhieuTC,
      "ngayThuTienTC": ngayThuTienTC,
      "ngayLapPhieuTC": ngayLapPhieuTC,
      "soDuDN": soDuDN,
      "soDuCN": soDuCN,
      "soTien": soTien,
    });
  }
  Future<void> deletePhieuTC(String maPhieuTC) async {
    var url = Uri.parse(Url.deletePhieuTC);
    await http.post(url, body: {"maPhieuTC": maPhieuTC});
  }
}