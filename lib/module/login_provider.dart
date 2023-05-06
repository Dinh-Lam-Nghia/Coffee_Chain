import 'package:flutter/material.dart';

enum Radiobutton { phucVu, thuNgan, admin, phaChe }

class LoginProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  bool _isShow = true;
  bool get isShow => _isShow;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _passController = TextEditingController();
  TextEditingController get passController => _passController;

  Radiobutton _radio = Radiobutton.phucVu;
  Radiobutton get radio => _radio;

  void getIsShow() {
    _isShow = !_isShow;
    notifyListeners();
  }

  void getRadio(Radiobutton? value) {
    _radio = value!;
    notifyListeners();
  }

  // void clickDN() {
  //   print("\n\nName: ${nameController}\n\n");
  //   print("\n\nPass: ${passController}\n\n");
  //   notifyListeners();
  // }
}
