import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/models/DSbanHD_model.dart';
import 'package:coffee_chain/service/url.dart';

class BanHDService {
  Future<List<BanHoatDongModel>> getBanHD(String coSo) async {
    var url = Uri.parse(Url.getBanHD);
    var res = await http.post(url, body: {"coSo": coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => BanHoatDongModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> UpdateBanHDHT(String maBan, int hoanThanhMon) async {
    var url = Uri.parse(Url.updateBanhoatdong);
    await http.post(url, body: {
      "maBan": maBan,
      "hoanThanhMon": hoanThanhMon.toString(),
    });
  }
}
