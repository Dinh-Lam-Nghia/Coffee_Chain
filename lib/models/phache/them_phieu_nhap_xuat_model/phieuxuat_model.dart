class PhieuXuatModel {
  String? id;
  String? maPhieuNX;
  String? maNVL;
  String? tenNVL;
  String? donViTinh;
  String? sLuong;
  String? donGia;
  String? thanhTien;

  PhieuXuatModel(
      {this.id,
      this.maPhieuNX,
      this.maNVL,
      this.tenNVL,
      this.donViTinh,
      this.sLuong,
      this.donGia,
      this.thanhTien});

  factory PhieuXuatModel.fromJson(Map<String, dynamic> json) {
    return PhieuXuatModel(
      id: json['id'],
      maPhieuNX: json['maPhieuNX'],
      maNVL: json['maNVL'],
      tenNVL: json['tenNVL'],
      donViTinh: json['donViTinh'],
      sLuong: json['sLuong'],
      donGia: json['donGia'],
      thanhTien: json['thanhTien'],
    );
  }
}
