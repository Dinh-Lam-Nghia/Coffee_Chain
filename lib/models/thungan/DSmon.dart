import 'package:coffee_chain/pages/PhucVu/body_order/order/DSmon.dart';

class DSMon{
  String? maMon;
  String? tenMon;
  String? loaiMon;
  String? nhomThucDon;
  String? donViTinh;
  String? noiNhanMon;
  double? giaTien;
  String? image;

  DSMon(
    {
      this.maMon,
      this.tenMon,
      this.loaiMon,
      this.nhomThucDon,
      this.donViTinh,
      this.noiNhanMon,
      this.giaTien,
      this.image
    }
  );
  factory DSMon.fromJson(Map<String, dynamic>json){
    return DSMon(
      maMon: json['maMon'],
      tenMon: json['tenMon'],
      loaiMon: json['loaiMon'],
      nhomThucDon: json['nhomThucDon'],
      donViTinh: json['donViTinh'],
      noiNhanMon: json['noiNhanMon'],
      giaTien: double.parse(json['giaTien'].toString()),
      image: json['image'],
    );
  }
}