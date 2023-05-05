import 'package:flutter/material.dart';

enum menuPV { order, tramon }

class PhucvuProvider extends ChangeNotifier {
  menuPV _chonBody = menuPV.order;
  menuPV get chonBody => _chonBody;

  bool _themOrder = false;
  bool get themOrder => _themOrder;

  void clickOrder() {
    _chonBody = menuPV.order;
    notifyListeners();
  }
  void clickTramon() {
    _chonBody = menuPV.tramon;
    notifyListeners();
  }
  void onClickThemOrder() {
    _themOrder = !_themOrder;
    notifyListeners();
  }
}
