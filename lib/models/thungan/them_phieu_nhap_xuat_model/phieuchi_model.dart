class PhieuChiModel {
  int? id;
  String? maPhieuTC;
  String? ngayLPC;
  String? nguoiLapPhieuTC;
  String? soTT;
  String? chiPhiNVL;
  String? chiPhiDienNuoc;
  String? chiPhiKhac;
  double? soTien;
  double? note;
  double? thanhTien;
  String? coSo;

  PhieuChiModel({
    this.id,
    this.ngayLPC,
    this.nguoiLapPhieuTC,
    this.soTT,
    this.maPhieuTC,
    this.chiPhiNVL,
    this.chiPhiDienNuoc,
    this.soTien,
    this.chiPhiKhac,
    this.note,
    this.thanhTien,
    this.coSo,
  });

  factory PhieuChiModel.fromJson(Map<String, dynamic> json) {
    return PhieuChiModel(
      id: int.parse(json['id'].toString()),
      maPhieuTC: json['maPhieuTC'],
      ngayLPC: json['ngayLPC'],
      nguoiLapPhieuTC: json['nguoiLapPhieuTC'],
      soTT: json['soTT'],
      chiPhiNVL: json["chiPhiNVL"],
      chiPhiDienNuoc: json["chiPhiDienNuoc"],
      chiPhiKhac: json["chiPhiKhac"],
      soTien: double.parse(json["soTien"].toString()),
      note: double.parse(json["note"].toString()),
      thanhTien: double.parse(json["thanhTien"].toString()),
      coSo: json["coSo"],
    );
  }
}
