import 'package:coffee_chain/models/DangNhap_mondel.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:flutter/material.dart';

class PhanQuyenNvProvider extends ChangeNotifier {
  String? _coSo;
  List<NhanVienModel> _nhanVienModelTMP = [];
  List<DangNhapModel> _dangNhapModelTMP = [];
  List<PhanQuyenModel> _phanQuyenModelTMP = [];
  final NhanVienService _nhanVienService = NhanVienService();
  UserPassModel? _CScoffee;
  void getAccPQ(String maNV, String NVchon) async {
    _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();

    _phanQuyenModelTMP = await _nhanVienService.getAllPhanQuyen(_coSo!);
    _dangNhapModelTMP = await _nhanVienService.getAllDangnhap(_coSo!);
    _nhanVienModelTMP = await _nhanVienService.getAllNhanVien(_coSo!);
    getUser(NVchon);
    getPQ(NVchon);
    notifyListeners();
  }

  //phân quyền
  bool coUser = false;
  bool coPQ = false;
  TextEditingController _user = TextEditingController();
  TextEditingController get user => _user;
  TextEditingController _pass = TextEditingController();
  TextEditingController get pass => _pass;

  String userName = '';
  void getUser(String maNVchon) async {
    for (var i = 0; i < _dangNhapModelTMP.length; i++) {
      if (_dangNhapModelTMP[i].maNV == maNVchon) {
        coUser = true;
        _user.text = _dangNhapModelTMP[i].user.toString();
        userName = _dangNhapModelTMP[i].user.toString();
        _pass.text = _dangNhapModelTMP[i].pass.toString();
      }
    }
    notifyListeners();
  }

  bool _checkPhucVu = false;
  bool _checkThuNgan = false;
  bool _checkAdmin = false;
  bool _checkPhaChe = false;
  void getPQ(String maNVchon) async {
    for (var i = 0; i < _phanQuyenModelTMP.length; i++) {
      if (_phanQuyenModelTMP[i].maNV == maNVchon) {
        coPQ = true;
        if (int.parse(_phanQuyenModelTMP[i].phucVu.toString()) == 1) {
          _checkPhucVu = true;
        } else {
          _checkPhucVu = false;
        }

        if (int.parse(_phanQuyenModelTMP[i].thuNgan.toString()) == 1) {
          _checkThuNgan = true;
        } else {
          _checkThuNgan = false;
        }

        if (int.parse(_phanQuyenModelTMP[i].admin.toString()) == 1) {
          _checkAdmin = true;
        } else {
          _checkAdmin = false;
        }

        if (int.parse(_phanQuyenModelTMP[i].phaChe.toString()) == 1) {
          _checkPhaChe = true;
        } else {
          _checkPhaChe = false;
        }
      }
    }
    notifyListeners();
  }

  void checkUser(String value) {
    print(value);
    _errUser = '';
    for (int i = 0; i < _dangNhapModelTMP.length; i++) {
      if (_dangNhapModelTMP[i].user!.toLowerCase() == value.toLowerCase() &&
          value.toLowerCase() != userName.toLowerCase()) {
        _errUser = 'User nhân viên đã được dùng';
      }
    }
    notifyListeners();
  }

  String _errUser = '';
  String get errUser => _errUser;
  String _errPass = '';
  String get errPass => _errPass;

  bool get checkPhucVu => _checkPhucVu;
  void PV() {
    _checkPhucVu = !_checkPhucVu;
    print(_checkPhucVu);
    notifyListeners();
  }

  bool get checkThuNgan => _checkThuNgan;
  void TN() {
    _checkThuNgan = !_checkThuNgan;
    notifyListeners();
  }

  bool get checkAdmin => _checkAdmin;
  void AD() {
    _checkAdmin = !_checkAdmin;
    notifyListeners();
  }

  bool get checkPhaChe => _checkPhaChe;
  void PC() {
    _checkPhaChe = !_checkPhaChe;
    notifyListeners();
  }

  void ktrPhanQuyen(BuildContext context, String maNVchon, String coSoNVchon) { 
    bool check = false;
    if (_user.text.toString() == '') {
      check = true;
      _errUser = 'Chưa nhâp Username';
    }
    if (_pass.text.toString() == '') {
      check = true;
      _errPass = 'Chưa nhâp Password';
    }
    if (!check) {
      capQuyen(context, maNVchon, coSoNVchon);
    }
    notifyListeners();
  }

  void capQuyen(BuildContext context,String maNVchon, String coSoNVchon) async{
    String userTMP = userName;
    String user = _user.text.toString();
    String pass = _pass.text.toString(); 

    String pv = '0';
    if (_checkPhucVu) {
      pv = '1';
    }

    String tn = '0';
    if (_checkThuNgan) {
      tn = '1';
    }

    String ad = '0';
    if (_checkAdmin) {
      ad = '1';
    }

    String pc = '0';
    if (_checkPhaChe) {
      pc = '1';
    }
    
    if (coUser) {
      // lệnh update
      await _nhanVienService.updateUser(maNVchon, userTMP, user, pass);
    } else {
      // lệnh INSERT
      await _nhanVienService.addUser(maNVchon, user, pass, coSoNVchon);
    }
    if (coPQ) {
      // lệnh update
      await _nhanVienService.updatePQ(pv, tn, ad, pc, maNVchon, coSoNVchon);
    } else {
      // lệnh INSERT
      await _nhanVienService.addPQ(pv, tn, ad, pc, maNVchon, coSoNVchon);
    }
    Navigator.of(context).pop();
    notifyListeners();
  }

  // end Phân quyền
}
