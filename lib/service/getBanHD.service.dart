import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/service/url.dart';

class BanHDService{
  Future<List<BanHoatDongModel>> getBanHD() async{
    var url = Uri.parse(Url.getBanHD);
    var res = await http.post(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => BanHoatDongModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }
}