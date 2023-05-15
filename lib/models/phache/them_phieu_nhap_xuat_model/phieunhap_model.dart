class PhieuNhapModel {
  int? id;
  String? maPhieuNX;
  String? maNVL;
  String? tenNVL; 
  String? donViTinh;
  int? sLuong;
  String? hsd;
  double? donGia;
  double? thanhTien;
  String? coSo;

  PhieuNhapModel({
    this.id,
    this.maPhieuNX,
    this.maNVL,
    this.tenNVL,
    this.donViTinh,
    this.sLuong,
    this.hsd,
    this.donGia,
    this.thanhTien,
    this.coSo,
  });

  factory PhieuNhapModel.fromJson(Map<String, dynamic> json) {
    return PhieuNhapModel(
      id: int.parse(json['id'].toString()),
      maPhieuNX: json["maPhieuNX"],
      maNVL: json["maNVL"],
      tenNVL: json["tenNVL"],
      donViTinh: json["donViTinh"],
      sLuong: int.parse(json['sLuong'].toString()),
      hsd: json["hsd"],
      donGia: double.parse(json["donGia"].toString()),
      thanhTien: double.parse(json["thanhTien"].toString()),
      coSo: json["coSo"],
    );
  }
}
