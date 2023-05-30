import 'dart:convert';
import 'dart:io';

import 'package:coffee_chain/models/NhanVien_model.dart';
import 'package:coffee_chain/models/UserPass.dart';
import 'package:coffee_chain/models/mon_model.dart';
import 'package:coffee_chain/models/phanQuyen_model.dart';
import 'package:coffee_chain/service/NhanVien.service.dart';
import 'package:coffee_chain/service/thucdon.service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// enum ChonLoaiMon { douong, monan }

// enum NhomTD { khac, cafe, trasua, nuocngot }

class ThucDonPageProvider extends ChangeNotifier {
  final ThucDonService _thucDonService = ThucDonService();

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

    _phanQuyen = await _nhanVienService.PhanQuyen(maNV, _coSo!);
    _PQPV = int.parse(_phanQuyen!.phucVu.toString());
    _PQTN = int.parse(_phanQuyen!.thuNgan.toString());
    _PQAD = int.parse(_phanQuyen!.admin.toString());
    _PQPC = int.parse(_phanQuyen!.phaChe.toString());

    getListTD();
    notifyListeners();
  }

  List<MonModel> _thucDonModelTMP = [];
  List<MonModel> _thucDonModel = [];
  List<MonModel> get thucDonModel => _thucDonModel;
  void getListTD() async {
    _thucDonModelTMP = await _thucDonService.getThucDon(_coSo!);
    _thucDonModel = _thucDonModelTMP;
    _DVTmonModel.clear();
    _CBTmonModel.clear();
    getDVT();
    getCBT();
    notifyListeners();
  }

  // thêm món

  String _loaiMon = 'douong';
  String get loaiMon => _loaiMon;
  void clickChonLM(String? value) {
    _loaiMon = value!;
    notifyListeners();
  }

  TextEditingController _tenMon = TextEditingController();
  TextEditingController get tenMon => _tenMon;
  TextEditingController _maMon = TextEditingController();
  TextEditingController get maMon => _maMon;
  TextEditingController _giaBan = TextEditingController();
  TextEditingController get giaBan => _giaBan;
  TextEditingController _nhomTD = TextEditingController();
  TextEditingController get nhomTD => _nhomTD;
  TextEditingController _donViTinh = TextEditingController();
  TextEditingController get donViTinh => _donViTinh;
  TextEditingController _cheBienTai = TextEditingController();
  TextEditingController get cheBienTai => _cheBienTai;

  void checkMaMon(String value) {
    _errMa = '';
    for (int i = 0; i < _thucDonModelTMP.length; i++) {
      if (_thucDonModelTMP[i].maMon!.toLowerCase() == value.toLowerCase()) {
        _errMa = 'Mã món đã tồn tại';
      }
    }
    notifyListeners();
  }

  bool _checkNTD = false;
  bool get checkNTD => _checkNTD;
  bool _checkDVT = false;
  bool get checkDVT => _checkDVT;
  bool _checkCBT = false;
  bool get checkCBT => _checkCBT;

  void checkClickadd(int i) {
    if (i == 1) {
      _checkNTD = true;
      print('object');
    }
    if (i == 2) {
      _checkDVT = true;
    }
    if (i == 3) {
      _checkCBT = true;
    }
    notifyListeners();
  }

  void checkClickclear(int i) {
    if (i == 1) {
      _checkNTD = false;
      print('object');
    }
    if (i == 2) {
      _checkDVT = false;
    }
    if (i == 3) {
      _checkCBT = false;
    }
    notifyListeners();
  }

  String _chonNhomTD = 'khac';
  String get chonNhomTD => _chonNhomTD;
  void clickNhomTD(String value) {
    _chonNhomTD = value;
    notifyListeners();
  }

  List<MonModel> _DVTmonModel = [];
  List<MonModel> get DVTmonModel => _DVTmonModel;
  void getDVT() async {
    for (int i = 0; i < _thucDonModelTMP.length; i++) {
      bool check = false;
      for (int j = 0; j < _DVTmonModel.length; j++) {
        if (_thucDonModelTMP[i].donViTinh == _DVTmonModel[j].donViTinh) {
          check = true;
        }
      }
      if (!check) {
        _DVTmonModel.add(_thucDonModelTMP[i]);
      }
    }
    notifyListeners();
  }

  String _DVT = "ly";
  String get DVT => _DVT;
  void clickChonDVT(String value) {
    _DVT = value;
    notifyListeners();
  }

  List<MonModel> _CBTmonModel = [];
  List<MonModel> get CBTmonModel => _CBTmonModel;
  void getCBT() async {
    for (int i = 0; i < _thucDonModelTMP.length; i++) {
      bool check = false;
      for (int j = 0; j < _CBTmonModel.length; j++) {
        if (_thucDonModelTMP[i].noiNhanMon == _CBTmonModel[j].noiNhanMon) {
          check = true;
        }
      }
      if (!check) {
        _CBTmonModel.add(_thucDonModelTMP[i]);
      }
    }
    notifyListeners();
  }

  String _CBT = "pc";
  String get CBT => _CBT;
  void clickChonCBT(String value) {
    _CBT = value;
    notifyListeners();
  }

  //chọn ảnh
  File? _pickedImage;
  File? get pickedImage => _pickedImage;
  Uint8List webImage = Uint8List(8);
  Uint8List _bytesImage = Uint8List(8);
  Uint8List get bytesImage => _bytesImage;
  FilePickerResult? result;
  String? imageData;
  bool img = false;
  Future<void> pickedImages() async {
    if (kIsWeb) {
      final ImagePicker pickerWeb = ImagePicker();
      XFile? image = await pickerWeb.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        webImage = f;
        _pickedImage = File('a');
        imageData = base64Encode(f);
        img = true;
      } else {
        img = false;
        print('No Image had been picked.');
      }
    } else {
      result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png'],
          allowMultiple: false);
      if (result != null) {
        _pickedImage = File(result!.paths.first!);
        imageData = base64Encode(_pickedImage!.readAsBytesSync());
        img = true;
      } else {
        img = false;
        print('No Image had been picked.');
      }
    }
    // print(imageData);
    _bytesImage = Base64Decoder().convert(imageData!);
    // print(_bytesImage);
    notifyListeners();
  }
  //end chọn ảnh

  bool _luuMonOK = false;
  bool get luuMonOK => _luuMonOK;
  String _errTen = '';
  String get errTen => _errTen;
  String _errMa = '';
  String get errMa => _errMa;
  String _errGia = '';
  String get errGia => _errGia;
  bool _anh = true;
  bool get anh => _anh;
  void ktTruocLuu(BuildContext context) {
    _errTen = '';
    _errMa = '';
    _errGia = '';
    _anh = true;
    _luuMonOK = false;

    int ntd = 0;
    int dvt = 0;
    int cbt = 0;

    if (_tenMon.text.toString() == '') {
      _errTen = 'Chưa nhập tên món';
      _luuMonOK = true;
    }

    if (_maMon.text.toString() == '') {
      _errMa = 'Chưa nhập mã món';
      _luuMonOK = true;
    }

    if (_giaBan.text.toString() == '') {
      _errGia = 'Chưa nhập giá món';
      _luuMonOK = true;
    }

    if (_checkNTD) {
      if (_nhomTD.text.toString() == '') {
        ntd = 0;
      } else {
        ntd = 1;
      }
    } else {
      ntd = 0;
    }

    if (_checkDVT) {
      if (_donViTinh.text.toString() == '') {
        dvt = 0;
      } else {
        dvt = 1;
      }
    } else {
      dvt = 0;
    }

    if (_checkCBT) {
      if (_cheBienTai.text.toString() == '') {
        cbt = 0;
      } else {
        cbt = 1;
      }
    } else {
      cbt = 0;
    }

    if (!img) {
      _anh = false;
      _luuMonOK = true;
    }

    if (!_luuMonOK) {
      luuMon(ntd, dvt, cbt, context);
    }
    notifyListeners();
  }

  void luuMon(int ntd, int dvt, int cbt, BuildContext context) async {
    // String maMon
    String maMon = _maMon.text.toString();
    String tenMon = _tenMon.text.toString();
    String loaiMon = _loaiMon.toString();

    String NTD = '';
    if (ntd == 1) {
      NTD = _nhomTD.text.toString();
    } else {
      if (_chonNhomTD.toString() == 'khac') {
        NTD = 'khác';
      }
      if (_chonNhomTD.toString() == 'cafe') {
        NTD = 'coffee';
      }
      if (_chonNhomTD.toString() == 'nuocngot') {
        NTD = 'nước ngọt';
      }
      if (_chonNhomTD.toString() == 'nuocpc') {
        NTD = 'nước uống pha chế';
      }
    }

    String DVT = '';
    if (dvt == 1) {
      DVT = _donViTinh.text.toString();
    } else {
      DVT = _DVT.toString();
    }

    String NNT = '';
    if (cbt == 1) {
      NNT = _cheBienTai.text.toString();
    } else {
      NNT = _CBT.toString();
    }

    String gtien = _giaBan.text.toString();
    String img = '${maMon.toString()}.png';
    String coSo = _coSo!;

    await _thucDonService.uploadImage('${maMon}.png', imageData!);

    await _thucDonService.addMon(
        maMon, tenMon, loaiMon, NTD, DVT, NNT, gtien, img, coSo);

    Navigator.of(context).pop();
    notifyListeners();
  }
  // end thêm món

  void timkiem(String value) {
    _thucDonModel = _thucDonModelTMP
        .where((element) =>
            element.tenMon!.toUpperCase().contains(value.toUpperCase()))
        .toList();
    notifyListeners();
  }

  void delete(String maMon) async {
    await _thucDonService.deleteMon(maMon, _coSo!);
    getListTD();
    notifyListeners();
  }
}
