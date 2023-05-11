import 'package:coffee_chain/models/phucvu/mon_model.dart';
import 'package:flutter/material.dart';

class GhiorderProvider extends ChangeNotifier {
  List<MonModel> _ListDSmon = [];
  List<MonModel> get ListDSmon => _ListDSmon;
  void getListDSmon() {
    _ListDSmon = [
      MonModel(
          maMon: 'M1',
          tenMon: 'coffee đen',
          loaiMon: 'nước uống',
          nhomThucDon: 'coffee',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 30000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M2',
          tenMon: 'nước ngọt',
          loaiMon: 'nước uống',
          nhomThucDon: 'nước ngọt',
          donViTinh: 'Tô',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 20000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M3',
          tenMon: 'Sữa bò',
          loaiMon: 'nước uống',
          nhomThucDon: 'Sữa',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 40000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M3',
          tenMon: 'Sữa bò',
          loaiMon: 'nước uống',
          nhomThucDon: 'Sữa',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 40000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M3',
          tenMon: 'Sữa bò',
          loaiMon: 'nước uống',
          nhomThucDon: 'Sữa',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 40000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M3',
          tenMon: 'Sữa bò',
          loaiMon: 'nước uống',
          nhomThucDon: 'Sữa',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 40000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M3',
          tenMon: 'Sữa bò',
          loaiMon: 'nước uống',
          nhomThucDon: 'Sữa',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 40000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M3',
          tenMon: 'Sữa bò',
          loaiMon: 'nước uống',
          nhomThucDon: 'Sữa',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 40000,
          image: 'assets/images/Coffee.png'),
      MonModel(
          maMon: 'M3',
          tenMon: 'Sữa bò',
          loaiMon: 'nước uống',
          nhomThucDon: 'Sữa',
          donViTinh: 'Ly',
          noiNhanMon: 'Quầy pha chế',
          giaTien: 40000,
          image: 'assets/images/Coffee.png'),
    ];
    notifyListeners();
  }
}
