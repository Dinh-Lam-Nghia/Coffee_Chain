import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/DsNVL_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class DsNVLService {
  Future<bool> checkMaNVL(String maNVL, String tenNVL)async {
    var url = Uri.parse(Url.checkAddNVL);
    var res = await http.post(url, body: {"maNVL": maNVL, "tenNVL": tenNVL});
    if (res.statusCode == 200) {
      String data = json.decode(res.body).toString();
      print(data);
      if (data == 'Error') {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<List<DsNVLModel>> getNVL() async {
    var url = Uri.parse(Url.getNVL);
    var res = await http.post(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => DsNVLModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }
}
