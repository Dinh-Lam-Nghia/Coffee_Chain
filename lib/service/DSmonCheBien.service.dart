import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/phache/DSmonchebien_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class DSmonCheBienService {
  Future<List<DSmonCheBienModel>> getDSmonCheBien(String coSo) async {
    var url = Uri.parse(Url.getDSmonCheBien);
    var res = await http.post(url, body: {"coSo": coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => DSmonCheBienModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> postUpMonHoanThanh(
      String maBan, String maMon, int hoanThanh) async {
    var url = Uri.parse(Url.getUpMonHoanThanh);
    await http.post(url, body: {
      "maBan": maBan,
      "maMon": maMon,
      "hoanThanh": hoanThanh.toString()
    });
  }
}
