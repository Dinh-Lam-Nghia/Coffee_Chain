import 'dart:async';
import 'dart:convert';
import 'package:coffee_chain/models/phache/them_phieu_nhap_xuat_model/phieunhap_model.dart';
import 'package:http/http.dart' as http;
import 'package:coffee_chain/service/url.dart';

class PhieuNhapService {
  Future<List<PhieuNhapModel>> getPhieuNhap(String coSo) async {
    var url = Uri.parse(Url.getPhieuNhapKho);
    var res = await http.post(url, body: {'coSo': coSo});
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => PhieuNhapModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load!');
    }
  }

  Future<void> addPhieuNhap(
    String maPhieuNX,
    String maNVL,
    String donViTinh,
    String sLuong,
    String hsd,
    String donGia,
    String thanhTien,
    String coSo,
  ) async {
    var url = Uri.parse(Url.addPhieuNhap);

    await http.post(url, body: {
      "maPhieuNX": maPhieuNX,
      "maNVL": maNVL,
      "donViTinh": donViTinh,
      "sLuong": sLuong,
      "hsd": hsd,
      "donGia": donGia,
      "thanhTien": thanhTien,
      "coSo": coSo,
    });
  }

  Future<void> deletePhieuNhapId(String id) async {
    var url = Uri.parse(Url.deletePhieuNhapId);
    await http.post(url, body: {"id": id});
  }

  Future<void> deletePhieuNhapMaPhieu(String maPhieuNX) async {
    var url = Uri.parse(Url.deletePhieuNhapMaPhieu);
    await http.post(url, body: {"maPhieuNX": maPhieuNX});
  }
}


// class PhieuNhapService {
//   Future<List<PhieuNhapModel>> getPhieuNhap() async {
//     var url = Uri.parse(Url.getPhieuNhapKho);
//     var res = await http.post(url);
//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);
//       return body.map((e) => PhieuNhapModel.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load!');
//     }
//   }

//   Future<PhieuNhapModel> checkAddPhieuNhap(String maPhieuNX, String maNVL, String donViTinh,
//       String sLuong, String hsd, String donGia, String thanhTien) async {
//     var url = Uri.parse(Url.addPhieuNhap);
//     var res = await http.post(url, body: {
//       "maPhieuNX": maPhieuNX,
//       "maNVL": maNVL,
//       "donViTinh": donViTinh,
//       "sLuong": sLuong,
//       "hsd": hsd,
//       "donGia": donGia,
//       "thanhTien": thanhTien,
//     });
//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);
//       if (!body.isNotEmpty) {
//         return body.map((e) => PhieuNhapModel.fromJson(e)).toList()[0];
//       }else{
//         return PhieuNhapModel(maPhieuNX: '', maNVL: '', tenNVL: '', donViTinh: '', sLuong: 0, hsd: '', donGia: 0, thanhTien: 0);
//       }
//     } else {
//       throw Exception('Failed to load!');
//     }
//   }

//   Future<void> updatePhieuNhapKho(
//       String maPhieuNX,
//       String maNVL,
//       String donViTinh,
//       String sLuong,
//       String hsd,
//       String donGia,
//       String thanhTien) async {
//     var url = Uri.parse(Url.updatePhieuNhapKho);
//     await http.post(url, body: {
//       "maPhieuNX": maPhieuNX,
//       "maNVL": maNVL,
//       "donViTinh": donViTinh,
//       "sLuong": sLuong,
//       "hsd": hsd,
//       "donGia": donGia,
//       "thanhTien": thanhTien,
//     });
//   }
// }



// <?php
//     include 'connectMySQL.php';

//     $maPhieuNX = $_POST['maPhieuNX'];
//     $maNVL  = $_POST['maNVL'];
//     $donViTinh = $_POST['donViTinh'];
//     $sLuong = $_POST['sLuong'];
//     $hsd = $_POST['hsd'];
//     $donGia = $_POST['donGia']; 
//     $thanhTien = $_POST['thanhTien'];

//     $sql = "SELECT * FROM `phieunhapkho` WHERE `maPhieuNX` = '".$maPhieuNX."' AND `maNVL` = '".$maNVL."'";
// 	$queryResult = $connect->query($sql);
//     $count = mysqli_num_rows($queryResult);
//         $result=array();
//     if ($count == 1) {
//         while($fetchData=$queryResult->fetch_assoc()){
//             $result[]=$fetchData;
//         }
//         echo json_encode($result);
// 	}else{
// 		$connect->query("INSERT INTO `phieunhapkho` (`maPhieuNX`, `maNVL`, `donViTinh`, `sLuong`, `hsd`, `donGia`, `thanhTien`) 
//     VALUES ('".$maPhieuNX."', '".$maNVL."', '".$donViTinh."', ".$sLuong.", '".$hsd."', ".$donGia.", ".$thanhTien.");");
//         echo json_encode($result);
// 	}

// ?> 