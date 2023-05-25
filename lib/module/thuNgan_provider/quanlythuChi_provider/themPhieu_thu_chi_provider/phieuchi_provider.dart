import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/models/thungan/tablePhieu_model.dart';
import 'package:coffee_chain/models/thungan/them_phieu_nhap_xuat_model/phieuchi_model.dart';
import 'package:coffee_chain/service/DangNhap.service.dart';
import 'package:coffee_chain/service/PhieuChi.services.dart';
import 'package:coffee_chain/service/PhieuThuChi.service.dart';
import 'package:flutter/material.dart';
// import 'package:collection/collection.dart';

class PhieuChiProvider extends ChangeNotifier {
  TextEditingController _maPC = TextEditingController();
  TextEditingController get maPC => _maPC;
  final TextEditingController _ngayLPC = TextEditingController();
  TextEditingController get ngayLPC => _ngayLPC;
  TextEditingController _nguoiLPC = TextEditingController();
  TextEditingController get nguoiLPC => _nguoiLPC;
  final TextEditingController _soDuDauNgay = TextEditingController();
  TextEditingController get soDuDauNgay => _soDuDauNgay;
  final TextEditingController _soDuCuoiNgay = TextEditingController();
  TextEditingController get soDuCuoiNgay => _soDuCuoiNgay;
  final TextEditingController _layDL = TextEditingController();
  TextEditingController get layDL => _layDL;

  TextEditingController _maPhieu = TextEditingController();
  TextEditingController get maphieu => _maPhieu;
  final TextEditingController _soTT = TextEditingController();
  TextEditingController get soTT => _soTT;
  final TextEditingController _tenKC = TextEditingController();
  TextEditingController get tenKC => _tenKC;
  final TextEditingController _chiPNVL = TextEditingController();
  TextEditingController get chiPNVL => _chiPNVL;
  final TextEditingController _chiPDN = TextEditingController();
  TextEditingController get chiPDN => _chiPDN;
  final TextEditingController _khac = TextEditingController();
  TextEditingController get khac => _khac;
  TextEditingController _soTien = TextEditingController();
  TextEditingController get soTien => _soTien;
  final TextEditingController _ghiChu = TextEditingController();
  TextEditingController get ghiChu => _ghiChu;

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

    autoMaPC();
    notifyListeners();
  }

  double _tongTien = 0;
  double get tongTien => _tongTien;

  final TablePhieuTCServices _phieuTCServices = TablePhieuTCServices();
  List<TablePhieuModel> _listPhieuTMP = [];
  String? _ma;
  int cout = 0;
  void autoMaPC() async {
    _listPhieuTMP = await _phieuTCServices.getTablePhieuTC(_coSo!);
    int i = _listPhieuTMP.length;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuTC.toString()) + 1;
    _ma = "pn0$cout";
    _maPC = TextEditingController(text: _ma);
    _maPhieu = TextEditingController(text: _ma);
    _nguoiLPC = TextEditingController(text: _tenNV);
    getListPhieuChi();
    notifyListeners();
  }

  List<PhieuChiModel> _phieuChiTMP = [];
  List<PhieuChiModel> _phieuChi = [];
  List<PhieuChiModel> get phieuChi => _phieuChi;
  final PhieuChiService _phieuChiService = PhieuChiService();
  void getListPhieuChi() async {
    _phieuChiTMP = await _phieuChiService.getPhieuChi(_coSo!);
    for (int i = 0; i < _phieuChiTMP.length; i++) {
      if (_phieuChiTMP[i].maPhieuC == cout.toString()) {
        _phieuChi.add(_phieuChiTMP[i]);
      }
    }
    sumTien();
    notifyListeners();
  }

  double _sum = 0;
  double get sum => sum;
  void sumTien() {
    List<double> numbers = [];
    for (int i = 0; i < _phieuChi.length; i++) {
      numbers.add(double.parse(_phieuChi[i].TongTien.toString()));
    }
    print(numbers);
    // _sum = numbers.sum;
    numbers.clear();
    notifyListeners();
  }

  void addPhieuChi(
    String maPhieuTC,
    String sTT,
    String chiPNVL,
    String chiPDN,
    String khac,
    String soTien,
    String ghiChu,
  ) async {
    await _phieuChiService.addPhieuChi(
      maPhieuTC,
      sTT,
      chiPNVL,
      chiPDN,
      soTien,
      khac,
      ghiChu,
    );
    _phieuChi.clear();
    autoMaPC();
    _soTT.clear();
    _chiPNVL.clear();
    _chiPDN.clear();
    _khac.clear();
    _soTien.clear();
    _ghiChu.clear();
    notifyListeners();
  }

  void luuPhieuTC(context) async {
    int i = _listPhieuTMP.length;
    int cout = 0;
    (i == 0)
        ? cout = i + 1
        : cout = int.parse(_listPhieuTMP[i - 1].maPhieuTC.toString()) + 1;
    String maPhieuTC = cout.toString();
    String nguoiLapPhieu = _nguoiLPC.text;
    final n = _ngayLPC.text.split('/');
    String soDuDN = _soDuDauNgay.text;
    String soDuCN = _soDuCuoiNgay.text;
    String soTien = _sum.toString();

    await _phieuTCServices.savePhieuTC(
      maPhieuTC,
      'aa',
      nguoiLapPhieu,
      ngayLPC as String,
      '00/00/000',
      '0',
      '0',
      soTien as double,
    );
    Navigator.of(context).pop();
    notifyListeners();
  }

  void clickHuy(context) async {
    String maPhieuTC = cout.toString();
    await _phieuChiService.deletePhieuChiMaPhieu(maPhieuTC);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void load() {
    notifyListeners();
  }
}
