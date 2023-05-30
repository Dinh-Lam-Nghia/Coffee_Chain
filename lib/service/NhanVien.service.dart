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

  Future<List<DangNhapModel>> getAllDangnhap(String coSo) async {
    var url = Uri.parse(Url.getAllDangnhap);
    var res = await http.post(url, body: {
      "coSo": coSo,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => DangNhapModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<PhanQuyenModel> PhanQuyen(String maNV, String coSo) async {
    var url = Uri.parse(Url.phanQuyen);
    var res = await http.post(url, body: {
      "maNV": maNV,
      "coSo": coSo,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => PhanQuyenModel.fromJson(e)).toList()[0];
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<List<PhanQuyenModel>> getAllPhanQuyen(String coSo) async {
    var url = Uri.parse(Url.getAllPhanQuyen);
    var res = await http.post(url, body: {
      "coSo": coSo,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => PhanQuyenModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<NhanVienModel> getNhanVien(String maNV, String coSo) async {
    var url = Uri.parse(Url.getNhanVien);
    var res = await http.post(url, body: {
      "maNV": maNV,
      "coSo": coSo,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => NhanVienModel.fromJson(e)).toList()[0];
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<List<NhanVienModel>> getAllNhanVien(String coSo) async {
    var url = Uri.parse(Url.getAllNhanVien);
    var res = await http.post(url, body: {
      "coSo": coSo,
    });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => NhanVienModel.fromJson(e)).toList();
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

  Future<void> addNhanVien(
    String maNV,
    String tenNV,
    String ngaySinh,
    String gioiTinh,
    String cccd,
    String ngayCap,
    String caLamViec,
    String avt,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addNhanVien);
    var res = await http.post(url, body: {
      "maNV": maNV,
      "tenNV": tenNV,
      "ngaySinh": ngaySinh,
      "gioiTinh": gioiTinh,
      "cccd": cccd,
      "ngayCap": ngayCap,
      "caLamViec": caLamViec,
      "avt": avt,
      "coSo": coSo,
    });
  }

  Future<void> deleteNhanVien3table(
    String maNV,
    String user,
    String coSo,
  ) async {
    var url = Uri.parse(Url.deleteNhanVien3table);
    var res = await http.post(url, body: {
      "maNV": maNV,
      "user": user,
      "coSo": coSo,
    });
  }

  Future<void> deleteNhanVien(
    String maNV,
    String coSo,
  ) async {
    var url = Uri.parse(Url.deleteNhanVien);
    var res = await http.post(url, body: {
      "maNV": maNV,
      "coSo": coSo,
    });
  }

  Future<void> updateUser(
    String maNV,
    String userTMP,
    String user,
    String pass, 
  ) async {
    var url = Uri.parse(Url.updateUser);
    var res = await http.post(url, body: {
      "maNV": maNV,
      "userTMP": userTMP,
      "user": user,
      "pass": pass, 
    });
  }

  Future<void> addUser(
    String maNV, 
    String user,
    String pass,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addUser);
    var res = await http.post(url, body: {
      "maNV": maNV, 
      "user": user,
      "pass": pass,
      "coSo": coSo,
    });
  }

  Future<void> updatePQ(
    String pv,
    String tn,
    String ad,
    String pc,
    String maNV,
    String coSo,
  ) async {
    var url = Uri.parse(Url.updatePQ);
    var res = await http.post(url, body: {
      "pv": pv,
      "tn": tn,
      "ad": ad,
      "pc": pc,
      "maNV": maNV,
      "coSo": coSo,
    });
  }

  Future<void> addPQ(
    String pv,
    String tn,
    String ad,
    String pc,
    String maNV,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addPQ);
    var res = await http.post(url, body: {
      "pv": pv,
      "tn": tn,
      "ad": ad,
      "pc": pc,
      "maNV": maNV,
      "coSo": coSo,
    });
  }
}
