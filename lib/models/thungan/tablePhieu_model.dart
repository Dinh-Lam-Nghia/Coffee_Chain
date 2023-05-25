// ignore: file_names
class TablePhieuModel {
  String? id;
  String? maPhieuTC;
  String? loaiPhieuTC;
  String? nguoiTaoPhieuTC;
  String? ngayThuTienTC;
  String? ngayLapPhieuTC;
  String? soDuDN;
  String? soDuCN;
  String? soTien;

  TablePhieuModel({
    this.id,
    this.maPhieuTC,
    this.loaiPhieuTC,
    this.nguoiTaoPhieuTC,
    this.ngayThuTienTC,
    this.ngayLapPhieuTC,
    this.soDuDN,
    this.soDuCN,
    this.soTien,
  });

  factory TablePhieuModel.fromJson(Map<String, dynamic> json) {
    return TablePhieuModel(
      id: json['id'],
      maPhieuTC: json['maPhieuTC'],
      loaiPhieuTC: json['loaiPhieuTC'],
      nguoiTaoPhieuTC: json['nguoiTaoPhieuTC'],
      ngayThuTienTC: json['ngayThuTienTC'],
      ngayLapPhieuTC: json['ngayLapPhieuTC'],
      soDuDN: json['soDuDN'],
      soDuCN: json['soDuCN'],
      soTien: json['soTien'],
    );
  }
}
