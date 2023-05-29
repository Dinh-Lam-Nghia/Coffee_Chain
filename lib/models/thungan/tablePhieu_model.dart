// ignore: file_names
class TablePhieuModel {
  String? id;
  String? maPhieuTC;
  String? loaiPhieuTC;
  String? nguoiTaoPhieuTC;
  String? ngayThuTienTC;
  String? ngayTaoPhieuTC;
  String? soDuDN;
  String? soDuCN;
  String? soTien;

  TablePhieuModel({
    this.id,
    this.maPhieuTC,
    this.loaiPhieuTC,
    this.nguoiTaoPhieuTC,
    this.ngayThuTienTC,
    this.ngayTaoPhieuTC,
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
      ngayTaoPhieuTC: json['ngayTaoPhieuTC'],
      soDuDN: json['soDuDN'],
      soDuCN: json['soDuCN'],
      soTien: json['soTien'],
    );
  }
}
