import 'package:coffee_chain/models/KMtangMon_model.dart';
import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/khuyenMai_model.dart';
import 'package:coffee_chain/models/mon_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/KhuyenMai.service.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:coffee_chain/service/thucdon.service.dart';
import 'package:flutter/material.dart';

class KhuyenMaiPageprovider extends ChangeNotifier {
  String? _coSo;
  String _tenNV = '...';
  String get tenNV => _tenNV;
  int _PQPV = 0;
  int get PQPV => _PQPV;
  int _PQTN = 0;
  int get PQTN => _PQTN;
  int _PQAD = 0;
  int get PQAD => _PQAD;
  int _PQPC = 0;
  int get PQPC => _PQPC;
  final NhanVienService _nhanVienService = NhanVienService();
  NhanVienModel? _nhanVien;
  PhanQuyenModel? _phanQuyen;
  UserPassModel? _CScoffee;
  void getAccPQ(String maNV) async {
    _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();

    _nhanVien = await _nhanVienService.getNhanVien(maNV, _coSo!);
    _tenNV = _nhanVien!.tenNV.toString();

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());

    getListKhuyenMai();
    getlistMon();
    notifyListeners();
  }

  KhuyenMaiService _khuyenMaiService = KhuyenMaiService();
  List<KhuyenMaiModel> _listKhuyenMaiTMP = [];
  List<KhuyenMaiModel> _listKhuyenMai = [];
  List<KhuyenMaiModel> get listKhuyenMai => _listKhuyenMai;
  void getListKhuyenMai() async {
    _listKhuyenMaiTMP = await _khuyenMaiService.getKhuyenMai(_coSo!);
    // print(_listKhuyenMaiTMP.length);
    _listKhuyenMai = _listKhuyenMaiTMP;
    notifyListeners();
  }

  TextEditingController _tuNgay = TextEditingController();
  TextEditingController get tuNgay => _tuNgay;
  TextEditingController _denNgay = TextEditingController();
  TextEditingController get denNgay => _denNgay;

  void timkiem(String value) {
    _listKhuyenMai = _listKhuyenMaiTMP
        .where((element) =>
            element.tenKM!.toUpperCase().contains(value.toUpperCase()))
        .toList();
    notifyListeners();
  }

  String _errst = '';
  String get errst => _errst;
  String _errend = '';
  String get errend => _errend;
  void getfollowNgay() async {
    _listKhuyenMai.clear();
    List<KhuyenMaiModel> TMP = [];

    if (_tuNgay.text == '' && _denNgay.text == '') {
      getListKhuyenMai();
    } else {
      int _start = 00000000, _end = 99999999;

      if (_tuNgay.text != '' || _denNgay.text != '') {
        if (_tuNgay.text != '') {
          final a = _tuNgay.text.split('/');
          _start = int.parse('${a[2]}${a[1]}${a[0]}');
        }
        if (_denNgay.text != '') {
          final b = _denNgay.text.split('/');
          _end = int.parse('${b[2]}${b[1]}${b[0]}');
        }
      }
      if (_start <= _end) {
        _listKhuyenMaiTMP = await _khuyenMaiService.getKhuyenMai(_coSo!);

        for (int a = 0; a < _listKhuyenMaiTMP.length; a++) {
          if ((int.parse(_listKhuyenMaiTMP[a].TN.toString()) >= _start &&
                  int.parse(_listKhuyenMaiTMP[a].TN.toString()) <= _end) ||
              (int.parse(_listKhuyenMaiTMP[a].DN.toString()) >= _start &&
                  int.parse(_listKhuyenMaiTMP[a].DN.toString()) <= _end) ||
              (int.parse(_listKhuyenMaiTMP[a].TN.toString()) <= _start &&
                  int.parse(_listKhuyenMaiTMP[a].DN.toString()) >= _end)) {
            TMP.add(_listKhuyenMaiTMP[a]);
          }
        }
      } else {
        _errend = '123';
        _errst = '123';
      }
      _listKhuyenMai = TMP;
    }
    notifyListeners();
  }

  void clear() {
    _tuNgay.clear();
    _denNgay.clear();
    _listKhuyenMai.clear();
    getListKhuyenMai();
    notifyListeners();
  }

// thêm KM

  TextEditingController _maKM = TextEditingController();
  TextEditingController get maKM => _maKM;

  TextEditingController _tenKM = TextEditingController();
  TextEditingController get tenKM => _tenKM;

  TextEditingController _moTa = TextEditingController();
  TextEditingController get moTa => _moTa;

  TextEditingController _giaTri = TextEditingController();
  TextEditingController get giaTri => _giaTri;

  TextEditingController _tongTienHD = TextEditingController();
  TextEditingController get tongTienHD => _tongTienHD;

  TextEditingController _tuNgayt = TextEditingController();
  TextEditingController get tuNgayt => _tuNgayt;

  TextEditingController _denNgayt = TextEditingController();
  TextEditingController get denNgayt => _denNgayt;

  String _errMa = '';
  String get errMa => _errMa;
  String _errTen = '';
  String get errTen => _errTen;
  String _errGia = '';
  String get errGia => _errGia;
  String _errMota = '';
  String get errMota => _errMota;
  String _errTu = '';
  String get errTu => _errTu;
  String _errDen = '';
  String get errDen => _errDen;
  String _errDK = '';
  String get errDK => _errDK;
  String _errTT = '';
  String get errTT => _errTT;

  void checkMaKM(String maKM) {
    _errMa = '';
    checkMa = false;
    for (var i = 0; i < _listKhuyenMaiTMP.length; i++) {
      if (_listKhuyenMaiTMP[i].maKM == maKM) {
        _errMa = 'Mã khuyến mãi này đã được dùng';
        checkMa = true;
      }
    }
    notifyListeners();
  }

  String? _DKapDung;
  String? get DKapDung => _DKapDung;
  void dkap(String value) {
    _errDK = '';
    _listMonTang.clear();
    _DKapDung = value;
    notifyListeners();
  }

  ThucDonService _thucDonService = ThucDonService();
  List<MonModel> _monModel = [];
  List<MonModel> get monModel => _monModel;
  void getlistMon() async {
    _monModel = await _thucDonService.getThucDon(_coSo!);
    notifyListeners();
  }

  TextEditingController _slMonTang = TextEditingController();
  TextEditingController get slMonTang => _slMonTang;
  String _mon = 'null';
  String get mon => _mon;
  void chonMonTang(String value) {
    _mon = value;
    notifyListeners();
  }

  List<KMtangMonModel> _listMonTang = [];
  List<KMtangMonModel> get listMonTang => _listMonTang;
  String _errSL = '';
  String get errSL => _errSL;
  String _errMon = '';
  String get errMon => _errMon;
  void okChonMon() {
    _errMon = '';
    _errSL = '';
    bool check = false;
    if (_mon == 'null') {
      _errMon = 'Chưa chọn món';
      check = true;
    }
    if (_slMonTang.text.toString() == '') {
      _errSL = 'Chưa chọn số lượng';
      check = true;
    }

    if (!check) {
      bool checknull = true;
      if (_listMonTang.length > 0) {
        for (int i = 0; i < _listMonTang.length; i++) {
          if (_listMonTang[i].maMon == _mon) {
            int sl = int.parse(_listMonTang[i].sLuong.toString());
            int slm = int.parse(_slMonTang.text);
            int s = sl + slm;
            _listMonTang[i].sLuong = s.toString();
            checknull = false;
          }
        }
      }
      if (checknull) {
        _listMonTang.add(KMtangMonModel(maMon: _mon, sLuong: _slMonTang.text));
      }
    }
    _slMonTang.clear();
    _mon = 'null';

    notifyListeners();
  }

  String getTemMon(String maMon) {
    for (int i = 0; i < _monModel.length; i++) {
      if (_monModel[i].maMon == maMon) {
        return '${_monModel[i].tenMon}';
      }
    }
    return '';
  }

  void deleteMonTang(String maMon) {
    for (int i = 0; i < _listMonTang.length; i++) {
      if (_listMonTang[i].maMon == maMon) {
        _listMonTang.removeAt(i);
      }
    }
    notifyListeners();
  }

  bool checkMa = false;
  void checkLuu(BuildContext context) {
    _errMa = '';
    _errTen = '';
    _errGia = '';
    _errMota = '';
    _errTu = '';
    _errDen = '';
    _errDK = '';
    _errTT = '';
    bool check = false;

    if (_maKM.text.toString() == '') {
      _errMa = 'Chưa nhập mã';
      check = true;
    }

    if (checkMa) {
      _errMa = 'Mã khuyến mãi này đã được dùng';
      check = true;
    }

    if (_tenKM.text.toString() == '') {
      _errTen = 'Chưa nhập tên';
      check = true;
    }

    if (_giaTri.text.toString() == '') {
      _errGia = 'Chưa nhập giá trị khuyến mãi';
      check = true;
    }

    if (_moTa.text.toString() == '') {
      _errMota = 'Chưa nhập mô tả';
      check = true;
    }

    if (_tuNgayt.text.toString() == '') {
      _errTu = 'Chưa chọn ngày bắt đầu';
      check = true;
    }

    if (_denNgayt.text.toString() == '') {
      _errDen = 'Chưa chọn ngày kết thúc';
      check = true;
    }

    String tuNgay = _tuNgayt.text;
    String denNgay = _denNgayt.text;
    final a = tuNgay.split('/');
    final b = denNgay.split('/');
    String TN = '${a[2]}${a[1]}${a[0]}';
    String DN = '${b[2]}${b[1]}${b[0]}';
    if (int.parse(TN) > int.parse(DN)) {
      _errTu = 'Chọn ngày sai';
      _errDen = 'Chọn ngày sai';
      check = true;
    }

    if (_DKapDung == null) {
      _errDK = 'Chưa chọn điều kiện áp dụng';
      check = true;
    } else {
      if (_DKapDung == 'giamgia') {
        if (_tongTienHD.text.toString() == '') {
          _errTT = 'Chưa nhập số tiền';
          check = true;
        }
      } else {
        if (!_listMonTang.isNotEmpty) {
          _errMon = 'Chưa chọn món';
          _errSL = 'Chưa nhập số lượng';
          check = true;
        }
      }
    }

    if (!check) {
      Luu(context);
    }
    notifyListeners();
  }

  void Luu(BuildContext context) async {
    String maKM = _maKM.text;

    String tenKM = _tenKM.text;
    String moTa = _moTa.text;
    String giaTriKM = _giaTri.text;
    String tuNgay = _tuNgayt.text;
    String denNgay = _denNgayt.text;
    final a = tuNgay.split('/');
    final b = denNgay.split('/');
    String TN = '${a[2]}${a[1]}${a[0]}';
    String DN = '${b[2]}${b[1]}${b[0]}';
    String dkApDung = _DKapDung.toString();

    String tienToiThieuHD = _tongTienHD.text;

    String coSo = _coSo!;

    await _khuyenMaiService.addKhuyenMai(
        maKM, tenKM, moTa, giaTriKM, tuNgay, denNgay, TN, DN, dkApDung, coSo);

    if (_DKapDung == 'giamgia') {
      await _khuyenMaiService.addKMgiamGia(maKM, tienToiThieuHD, coSo);
    }

    if (_DKapDung == 'tangmon') {
      for (int i = 0; i < _listMonTang.length; i++) {
        String maMon = _listMonTang[i].maMon.toString();
        String sLuong = _listMonTang[i].sLuong.toString();

        await _khuyenMaiService.addKMtangMon(maKM, maMon, sLuong, coSo);
      }
    }

    Navigator.of(context).pop();
    notifyListeners();
  }
// end thêm khuyến mãi

  void deleteKM(String maKM) async {
    await _khuyenMaiService.dateleOnlyMaKM(maKM, _coSo!);
    getListKhuyenMai();
    notifyListeners();
  }
}
