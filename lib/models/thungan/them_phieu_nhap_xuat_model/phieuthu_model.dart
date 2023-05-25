class PhieuThuModel{
  int? id;
  String? maPhieuT;
  String? NgayGLHD;
  String? MaHD;
  String? NguoiTHD;
  double? SoTPT;
  double? TongTien;
  String? XemLHD;

  PhieuThuModel({
    this.id,
    this.maPhieuT, 
    this.NgayGLHD,
    this.MaHD, 
    this.NguoiTHD, 
    this.SoTPT, 
    this.TongTien,
    this.XemLHD
  });

  factory PhieuThuModel.fromJson(Map<String, dynamic> json){
    return PhieuThuModel(
      id: int.parse(json['id'].toString()),
      maPhieuT: json["maPhieuTC"],
      NgayGLHD: json["NgayGLHD"],
      MaHD: json["MaHD"],
      NguoiTHD: json["NguoiTHD"],
      SoTPT: double.parse(json["SoTPT"].toString()),
      TongTien: double.parse(json["TongTien"].toString()),
      XemLHD: json["XemLHD"],
    );
  }
}