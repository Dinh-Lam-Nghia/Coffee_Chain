class HoaDonModel {
  String? maHD;
  String? ngayGioTaoHD;
  String? nguoiTaoHD;
  String? soTienPhaiThu;
  String? coSo;

  HoaDonModel({
    this.maHD,
    this.ngayGioTaoHD,
    this.nguoiTaoHD,
    this.soTienPhaiThu,
    this.coSo,
  });

  factory HoaDonModel.fromJson(Map<String, dynamic> json) {
    return HoaDonModel(
      maHD: json["maHD"],
      ngayGioTaoHD: json["ngayGioTaoHD"],
      nguoiTaoHD: json["nguoiTaoHD"],
      soTienPhaiThu: json["soTienPhaiThu"],
      coSo: json["coSo"],
    );
  }
}
