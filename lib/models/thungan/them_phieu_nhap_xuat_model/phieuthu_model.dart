class PhieuThuModel{
  int? id;
  String? maPhieuTC;
  String? nguoiLapPhieuTC;
  String? ngayThuTien;
  String? soDuDauNgay;
  String? soDuCuoiNgay;
  String? ngayGioLHD;
  String? maHD;
  String? nguoiTHD;
  double? soTPT;
  double? tongTien;
  String? xemLHD;

  PhieuThuModel({
    this.id,
    this.maPhieuTC,
    this.nguoiLapPhieuTC,
    this.ngayThuTien,
    this.soDuDauNgay,
    this.soDuCuoiNgay,
    this.ngayGioLHD,
    this.maHD, 
    this.nguoiTHD, 
    this.soTPT, 
    this.tongTien,
    this.xemLHD
  });

  factory PhieuThuModel.fromJson(Map<String, dynamic> json){
    return PhieuThuModel(
      id: int.parse(json['id'].toString()),
      maPhieuTC: json["maPhieuTC"],
      nguoiLapPhieuTC: json["nguoiLapPhieuTC"],
      ngayThuTien: json["ngayThuTien"],
      soDuDauNgay: json["soDuDauNgay"],
      soDuCuoiNgay: json["soDuCuoiNgay"],
      maHD: json["MaHD"],
      nguoiTHD: json["NguoiTHD"],
      soTPT: double.parse(json["SoTPT"].toString()),
      tongTien: double.parse(json["TongTien"].toString()),
      xemLHD: json["XemLHD"],
    );
  }
}