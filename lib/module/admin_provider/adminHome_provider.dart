import 'package:flutter/material.dart';

class AdminHomeProvider extends ChangeNotifier{
  String _menuClick = "thucdon";
  String get menuClick => _menuClick;

  void menu(int i){
    if (i==1) {
      _menuClick = "thucdon";
    }
    if (i==2) {
      _menuClick = "nhanvien";
    }
    if (i==31) {
      _menuClick = "baocao";
    }
    if (i==32) {
      _menuClick = "baocao";
    }
    if (i==4) {
      _menuClick = "khuyenmai";
    }
    notifyListeners();
  }
}