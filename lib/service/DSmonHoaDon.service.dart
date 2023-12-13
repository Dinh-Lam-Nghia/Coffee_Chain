import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class DsMonHoaDonService {
  Future<void> adddSMonHoaDon(
    String maHD,
    String maBan,
    String maMon,
    String sLuong,
    String donGia,
    String thanhTien,
    String coSo,
  ) async {
    var url = Uri.parse(Url.adddSMonHoaDon);
    var res = await http.post(url, body: {
      "maHD": maHD,
      "maBan": maBan,
      "maMon": maMon,
      "sLuong": sLuong,
      "donGia": donGia,
      "thanhTien": thanhTien,
      "coSo": coSo,
    });
  }
}
