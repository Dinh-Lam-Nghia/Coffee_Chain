import 'package:flutter/material.dart';

enum menuTN{ thanhtoan, thuchi}

class ThunganProvider extends ChangeNotifier{
  menuTN _chonBody = menuTN.thanhtoan;
  menuTN get chonBody => _chonBody;

  bool _themThanhtoan = false;
  bool get themThanhtoan => _themThanhtoan; 

  void clickThanhtoan(){
    _chonBody = menuTN.thanhtoan;
    notifyListeners();
  }
  void clickThuchi(){
    _chonBody = menuTN.thuchi;
    notifyListeners();
  }
  void onClickThemThanhtoan() {
    _themThanhtoan = !_themThanhtoan;
    notifyListeners();
  }
}