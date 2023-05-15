import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/DangNhap_mondel.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class NhanVienService {
  Future<DangNhapModel> KtraDN(String user, String pass) async {
    var url = Uri.parse(Url.checkDN);
    var res = await http.post(url, body: {
      "user": user,
      "pass": pass,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      if (!body.isNotEmpty) {
        return DangNhapModel(maNV: '0', user: '0', pass: '0', coSo: '0');
      } else {
        return body.map((e) => DangNhapModel.fromJson(e)).toList()[0];
      }
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<PhanQuyenModel> PhanQuyen(String maNV) async {
    var url = Uri.parse(Url.phanQuyen);
    var res = await http.post(url, body: {
      "maNV": maNV,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => PhanQuyenModel.fromJson(e)).toList()[0];
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<NhanVienModel> getNhanVien(String maNV) async {
    var url = Uri.parse(Url.getNhanVien);
    var res = await http.post(url, body: {
      "maNV": maNV,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => NhanVienModel.fromJson(e)).toList()[0];
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<UserPassModel> getCoSo(String maNV) async {
    var url = Uri.parse(Url.getCoSo);
    var res = await http.post(url, body: {"maNV": maNV});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => UserPassModel.fromJson(e)).toList()[0];
    } else {
      throw Exception('Failed to load!');
    }
  }
}
