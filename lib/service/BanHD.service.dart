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

  Future<BanHoatDongModel> getOnlyBanHD(String maBan, String coSo) async {
    var url = Uri.parse(Url.getOnlyBanHD);
    var res = await http.post(url, body: {
      "maBan": maBan,
      "coSo": coSo,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => BanHoatDongModel.fromJson(e)).toList()[0];
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> UpdateBanHDHT(
      String maBan, int hoanThanhMon, String coSo) async {
    var url = Uri.parse(Url.updateBanhoatdong);
    await http.post(url, body: {
      "maBan": maBan,
      "hoanThanhMon": hoanThanhMon.toString(),
      "coSo": coSo,
    });
  }

  Future<void> UpdateBanHDtien(
      String maBan, String tongTien, String coSo) async {
    var url = Uri.parse(Url.UpdateBanHDtien);
    await http.post(url, body: {
      "maBan": maBan,
      "tongTien": tongTien,
      "coSo": coSo,
    });
  }

  Future<void> dangPvThanhToanMangve(
    String maBan,
    String dangPhucVu,
    String thanhToan,
    String mangve,
    String coSo,
  ) async {
    var url = Uri.parse(Url.dangPvThanhToanMangve);
    await http.post(url, body: {
      "maBan": maBan,
      "dangPhucVu": dangPhucVu,
      "thanhToan": thanhToan,
      "mangve": mangve,
      "coSo": coSo,
    });
  }

  Future<void> addbanHD(
    String maBan,
    String order,
    String nguoiPhucVu,
    String slKhach,
    String hoanThanhMon,
    String tongTien,
    String dangPhucVu,
    String thanhToan,
    String mangve,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addbanHD);
    await http.post(url, body: {
      "maBan": maBan,
      "order": order,
      "nguoiPhucVu": nguoiPhucVu,
      "slKhach": slKhach,
      "hoanThanhMon": hoanThanhMon,
      "tongTien": tongTien,
      "dangPhucVu": dangPhucVu,
      "thanhToan": thanhToan,
      "mangve": mangve,
      "coSo": coSo,
    });
  }
}
