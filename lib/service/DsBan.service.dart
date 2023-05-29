import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/models/Ban_model.dart';
import 'package:coffee_chain/service/url.dart';
 
 class BanService{
Future<List<BanModel>> getDsBan(String coSo) async {
    var url = Uri.parse(Url.getDsBan);
    var res = await http.post(url, body: {"coSo": coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => BanModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }
 }