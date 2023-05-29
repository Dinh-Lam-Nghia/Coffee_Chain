import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/khuyenMai_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class KhuyenMaiService {
  Future<List<KhuyenMaiModel>> getKhuyenMai(String coSo) async {
    var url = Uri.parse(Url.getKhuyenMai);
    var res = await http.post(url, body: {"coSo": coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => KhuyenMaiModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> addKhuyenMai(
    String maKM,
    String tenKM,
    String moTa,
    String giaTriKM,
    String tuNgay,
    String denNgay,
    String TN,
    String DN,
    String dkApDung,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addKhuyenMai);
    var res = await http.post(url, body: {
      "maKM": maKM,
      "tenKM": tenKM,
      "moTa": moTa,
      "giaTriKM": giaTriKM,
      "tuNgay": tuNgay,
      "denNgay": denNgay,
      "TN": TN,
      "DN": DN,
      "dkApDung": dkApDung,
      "coSo": coSo,
    });
  }
  Future<void> addKMgiamGia(
    String maKM,
    String tienToiThieuHD, 
    String coSo,
  ) async {
    var url = Uri.parse(Url.addKMgiamGia);
    var res = await http.post(url, body: {
      "maKM": maKM,
      "tienToiThieuHD": tienToiThieuHD, 
      "coSo": coSo,
    });
  }

  Future<void> addKMtangMon(
    String maKM,
    String maMon,
    String sLuong, 
    String coSo,
  ) async {
    var url = Uri.parse(Url.addKMtangMon);
    var res = await http.post(url, body: {
      "maKM": maKM,
      "maMon": maMon,
      "sLuong": sLuong, 
      "coSo": coSo,
    });
  } 

   Future<void> dateleOnlyMaKM(
    String maKM, 
    String coSo,
  ) async {
    var url = Uri.parse(Url.dateleOnlyMaKM);
    var res = await http.post(url, body: {
      "maKM": maKM, 
      "coSo": coSo,
    });
  } 
}
