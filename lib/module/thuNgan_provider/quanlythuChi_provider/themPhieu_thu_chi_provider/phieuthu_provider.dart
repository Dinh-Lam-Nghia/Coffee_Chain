import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/models/thungan/tablePhieu_model.dart';
import 'package:coffee_chain/models/thungan/them_phieu_nhap_xuat_model/phieuthu_model.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:coffee_chain/service/PhieuThu.services.dart';
import 'package:coffee_chain/service/PhieuThuChi.service.dart';
import 'package:flutter/material.dart';

class PhieuThuProvider extends ChangeNotifier{
  TextEditingController _maPT = TextEditingController();
  TextEditingController get maPT => _maPT;
  TextEditingController _nguoiLPT = TextEditingController();
  TextEditingController get nguoiLPT => _nguoiLPT;
  final TextEditingController _ngayThuTien = TextEditingController();
  TextEditingController get ngayThuTien => _ngayThuTien;
  final TextEditingController _soDuDauNgay = TextEditingController();
  TextEditingController get soDuDauNgay => _soDuDauNgay;
  final TextEditingController _soDuCuoiNgay = TextEditingController();
  TextEditingController get soDuCuoiNgay => _soDuCuoiNgay;
  final TextEditingController _layDL = TextEditingController();
  TextEditingController get layDL => _layDL;
  final TextEditingController _chiPhiDV = TextEditingController();
  TextEditingController get chiPhiDV => _chiPhiDV;
  final TextEditingController _chiPhiKhac = TextEditingController();
  TextEditingController get chiPhiKhac => _chiPhiKhac;

  TextEditingController _maPhieu = TextEditingController();
  TextEditingController get maphieu => _maPhieu;
  final TextEditingController _ngayGLHD = TextEditingController();
  TextEditingController get ngayGLHD => _ngayGLHD;
  final TextEditingController _maHD = TextEditingController();
  TextEditingController get maHD => _maHD;
  final TextEditingController _nguoiTHD = TextEditingController();
  TextEditingController get nguoiTHD => _nguoiTHD;
  final TextEditingController _soTPT = TextEditingController();
  TextEditingController get soTPT => _soTPT;
  final TextEditingController _xemLHD = TextEditingController();
  TextEditingController get xemLHD => _xemLHD;

  double _tongPhaiThu = 0;
  double get tongPhaiThu => _tongPhaiThu;

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
    _nhanVien = await _nhanVienService.getNhanVien(maNV);
    _tenNV = _nhanVien!.tenNV.toString();

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());

    _CScoffee = await _nhanVienService.getCoSo(maNV);
    _coSo = _CScoffee!.coSo.toString();

    autoMaPT();
    notifyListeners();
  }

  final TablePhieuTCServices _phieuTCServices = TablePhieuTCServices();
  List<TablePhieuModel> _listPhieuTMP = [];
  String? _ma;
  int cout = 0;
  void autoMaPT() async {
    _listPhieuTMP = await _phieuTCServices.getTablePhieuTC(_coSo!);
    int i = _listPhieuTMP.length;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuTC.toString()) + 1;
    _ma = "pn0$cout";
    _maPT = TextEditingController(text: _ma);
    _maPhieu = TextEditingController(text: _ma);
    _nguoiLPT = TextEditingController(text: _tenNV);
    getListPhieuThu();
    notifyListeners();
  }

  List<PhieuThuModel> _phieuThuTMP = [];
  List<PhieuThuModel> _phieuThu = [];
  List<PhieuThuModel> get phieuThu => _phieuThu;
  PhieuThuService _phieuThuService = PhieuThuService();
  void getListPhieuThu() async{
    _phieuThuTMP = await _phieuThuService.getPhieuThu(_coSo!);
    for (int i = 0; i < _phieuThuTMP.length; i++) {
      if (_phieuThuTMP[i].maPhieuT == cout.toString()) {
        _phieuThu.add(_phieuThuTMP[i]);
      }
    }
    sumTien();
    notifyListeners();
  }

  double _sum = 0;
  double get sum => _sum;
  void sumTien(){
    List<double> numbers = [];
    for (int i = 0; i < _phieuThu.length; i++){
      numbers.add(double.parse(_phieuThu[i].TongTien.toString()));
    }
    print(numbers);
    notifyListeners();
    numbers.clear();
  }

  void addPhieuThu(
    String maPhieuTC,
    String ngayGLHD,
    String maHD,
    String nguoiTHD,
    String soTPT,
    String xemLHD
  ) async{
    await _phieuThuService.addPhieuThu(
      maPhieuTC,
      ngayGLHD,
      maHD,
      nguoiTHD,
      soTPT,
      xemLHD,
    );
    _phieuThu.clear();
    autoMaPT();
    _ngayGLHD.clear();
    _maHD.clear();
    _nguoiTHD.clear();
    _soTPT.clear();
    _xemLHD.clear();
    notifyListeners();
  }

  void xoaDong(String id) async {
    await _phieuThuService.deletePhieuThuId(id);
    _phieuThu.clear();
    autoMaPT();
    notifyListeners();
  }

  void luuPhieuTC(context) async{
    int i = _listPhieuTMP.length;
    int cout = 0;
    (i == 0)
      ? cout = i + 1
      : cout = int.parse(_listPhieuTMP[i - 1].maPhieuTC.toString()) + 1;
    String maPhieuTC = cout.toString();
    String nguoiTaoPhieuTC = _nguoiLPT.text;
    final n = _ngayThuTien.text.split('/');
    String soDuDN = _soDuDauNgay.text;
    String soDuCN = _soDuCuoiNgay.text;
    String soTien = _sum.toString();

    await _phieuTCServices.savePhieuTC(
      maPhieuTC,
      'aa',
      nguoiTaoPhieuTC,
      ngayThuTien as String,
      '00/00/000',
      soDuCN,
      soDuDN,
      soTien as double,
    );
    Navigator.of(context).pop();
    notifyListeners();
  }
  
void clickHuy(context) async {
    String maPhieuTC = cout.toString();
    await _phieuThuService.deletePhieuThuMaPhieu(maPhieuTC);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void timkiem(String value) {
    List<PhieuThuModel> _TK = [];
    _phieuThu.clear();
    (value == '')
        ? _TK = _phieuThuTMP
        : _TK = _phieuThuTMP
            .toList();
    for (int i = 0; i < _TK.length; i++) {
      if (_TK[i].maPhieuT == cout.toString()) {
        _phieuThu.add(_TK[i]);
      }
    }
    notifyListeners();
  }
  void load() {
    notifyListeners();
  }

}