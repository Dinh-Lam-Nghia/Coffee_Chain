import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/DsNVL_model.dart';
import 'package:coffee_chain/models/mon_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class ThucDonService {
  Future<List<MonModel>> getThucDon(String coSo) async {
    var url = Uri.parse(Url.getThucDon);
    var res = await http.post(url, body: {"coSo": coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => MonModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> addMon(
    String maMon,
    String tenMon,
    String loaiMon,
    String nhomThucDon,
    String donViTinh,
    String noiNhanMon,
    String giaTien,
    String image,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addMon);
    await http.post(url, body: {
      "maMon": maMon,
      "tenMon": tenMon,
      "loaiMon": loaiMon,
      "nhomThucDon": nhomThucDon,
      "donViTinh": donViTinh,
      "noiNhanMon": noiNhanMon,
      "giaTien": giaTien,
      "image": image,
      "coSo": coSo,
    });
  }

  Future<void> uploadImage(String name, String imageData) async {
    var url = Uri.parse(Url.uploadImage);
    await http.post(url, body: {
      'name': name,
      'image': imageData,
    });
  }

  Future<void> deleteMon(String maMon, String coSo) async {
    var url = Uri.parse(Url.deleteMonTD);
    await http.post(url, body: {
      'maMon': maMon,
      'coSo': coSo,
    });
  }
}
