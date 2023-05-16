// import 'package:coffee_chain/models/DSbanHD_model.dart';
// import 'package:flutter/material.dart';

// enum clickMenuThanhToan { cttoan, mangve }

// class ThanhToanProvider extends ChangeNotifier {
//   List<BanHoatDongModel> _listBanHD = [];
//   List<BanHoatDongModel> get listBanHD => _listBanHD;

//   void getListBanHD() {
//     _listBanHD = [
//       BanHoatDongModel(
//         maBan: 'b001t1',
//         tenBan: 'Bàn 001 - tâng 1',
//         order: '1.1',
//         phucVu: 'Dinh Lam Nghia',
//         soLuongNGuoi: 3,
//         tongTien: 2000.000,
//         ctToan: false,
//         mangVe: true,
//       ),
//       BanHoatDongModel(
//         maBan: 'b002t1',
//         tenBan: 'Bàn 002 - tâng 1',
//         order: '1.2',
//         phucVu: 'Dinh Lam Nghia',
//         soLuongNGuoi: 4,
//         tongTien: 2000.000,
//         ctToan: true,
//         mangVe: false,
//       ),
//     ];
//     notifyListeners();
//   }

//   clickMenuThanhToan _clickMnTT = clickMenuThanhToan.cttoan;
//   clickMenuThanhToan get clickMnTT => _clickMnTT;

//   void clickCTT() {
//     _clickMnTT = clickMenuThanhToan.cttoan;
//     notifyListeners();
//   }

//   void clickMV() {
//     _clickMnTT = clickMenuThanhToan.mangve;
//     notifyListeners();
//   }

//   // int _coutDPV = 0;
//   // int get coutDPV => _coutDPV;
//   // int _coutYCTT = 0;
//   // int get coutYCTT => _coutYCTT;
//   // int _coutMV = 0;
//   // int get coutMV => _coutMV;

//   final List<BanHoatDongModel> _listYCTT = [];
//   List<BanHoatDongModel> get listYCTT => _listYCTT;
//   final List<BanHoatDongModel> _listMV = [];
//   List<BanHoatDongModel> get listMV => _listMV;
//   void getSL() {
//     _listYCTT.clear();
//     for (int i = 0; i < _listBanHD.length; i++) {
//       if (_listBanHD[i].thanhToan == true) {
//         _listYCTT.add(_listBanHD[i]);
//         // _coutCTT++;
//       }
//       if (_listBanHD[i].mangVe == true) {
//         _listMV.add(_listBanHD[i]);
//         // _coutMV++;
//       }
//     }
//   }
// }
