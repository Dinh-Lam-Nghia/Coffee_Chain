import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/HoaDon_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class HoaDonService {
  Future<List<HoaDonModel>> getHoaDon(String coSo) async {
    var url = Uri.parse(Url.getHoaDon);
    var res = await http.post(url, body: {"coSo": coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => HoaDonModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }
}
