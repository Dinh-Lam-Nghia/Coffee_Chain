import 'package:coffee_chain/models/phache/tableThongKe_model.dart';
import 'package:flutter/material.dart';

class ThongKeKhoProvider extends ChangeNotifier {
  final TextEditingController _endDateInput = TextEditingController();
  TextEditingController get endDateInput => _endDateInput;

  final TextEditingController _stackDateInput = TextEditingController();
  TextEditingController get stackDateInput => _stackDateInput;

  final TextEditingController _timKiem = TextEditingController();
  TextEditingController get timKiem => _timKiem;

  List<ThongKeKhoModel> _TKkho  = [];
  List<ThongKeKhoModel> get TKkho => _TKkho ;

  void getlistThongKeKho() {
    _TKkho = [
      ThongKeKhoModel(
        maNVL: '123',
        tenNVL: 'caffee',
        donViTinh: 'kg',
        soLuongTon: 7.7,
        tonDauKy: 0,
        slNhap: 10,
        slxuat: 5,
      ),
      ThongKeKhoModel(
        maNVL: '123',
        tenNVL: 'caffee',
        donViTinh: 'kg',
        soLuongTon: 7.7,
        tonDauKy: 0,
        slNhap: 10,
        slxuat: 5,
      ),
      ThongKeKhoModel(
        maNVL: '123',
        tenNVL: 'caffee',
        donViTinh: 'kg',
        soLuongTon: 7.7,
        tonDauKy: 0,
        slNhap: 10,
        slxuat: 5,
      ),
      ThongKeKhoModel(
        maNVL: '123',
        tenNVL: 'caffee',
        donViTinh: 'kg',
        soLuongTon: 7.7,
        tonDauKy: 0,
        slNhap: 10,
        slxuat: 5,
      ),
    ];
  }
}
