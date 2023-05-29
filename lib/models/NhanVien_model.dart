class NhanVienModel {
  String? maNV;
  String? tenNV;
  String? ngaySinh;
  String? gioiTinh;
  String? cccd;
  String? ngayCap;
  String? caLamViec;
  String? avt;
  String? coSo;

  NhanVienModel({
    this.maNV,
    this.tenNV,
    this.ngaySinh,
    this.gioiTinh,
    this.cccd,
    this.ngayCap,
    this.caLamViec,
    this.avt,
    this.coSo,
  });

  factory NhanVienModel.fromJson(Map<String, dynamic> json) {
    return NhanVienModel(
      maNV: json["maNV"],
      tenNV: json["tenNV"],
      ngaySinh: json["ngaySinh"],
      gioiTinh: json["gioiTinh"],
      cccd: json["cccd"],
      ngayCap: json["ngayCap"],
      caLamViec: json["caLamViec"],
      avt: json["avt"],
      coSo: json["coSo"],
    );
  }
}
