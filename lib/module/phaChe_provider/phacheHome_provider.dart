import 'package:flutter/material.dart';

class PhaCheHomeProvider extends ChangeNotifier {
  String _menuClick = "DSmonchebien";
  String get menuClick => _menuClick;

  void onClickDSMonCheBien() {
    _menuClick = "DSmonchebien";
    notifyListeners();
  }

  void onClickQuanLyKho() {
    _menuClick = "Quanlykho";
    notifyListeners();
  }
}
 