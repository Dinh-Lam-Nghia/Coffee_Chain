class TablePhieuModel {
  String? maPhieuNX;
  String? loaiPhieuNX;
  String? nguoiTaoPhieuNX;
  String? ngayTaoPhieuNX;
  String? ngayTPNX;
  String? tuNgay;
  String? denNgay;
  String? nguoiGiao;
  String? nhaCungCap;
  String? soTienNX;
  String? tienThuTuDichVu;
  String? tienThuKhac;
  String? tongTien;

  TablePhieuModel({
    this.maPhieuNX,
    this.loaiPhieuNX,
    this.nguoiTaoPhieuNX,
    this.ngayTaoPhieuNX,
    this.ngayTPNX,
    this.tuNgay,
    this.denNgay,
    this.nguoiGiao,
    this.nhaCungCap,
    this.soTienNX,
    this.tienThuTuDichVu,
    this.tienThuKhac,
    this.tongTien,
  });

  factory TablePhieuModel.fromJson(Map<String, dynamic> json) {
    return TablePhieuModel(
      maPhieuNX: json['maPhieuNX'],
      loaiPhieuNX: json['loaiPhieuNX'],
      nguoiTaoPhieuNX: json['nguoiTaoPhieuNX'],
      ngayTaoPhieuNX: json['ngayTaoPhieuNX'],
      ngayTPNX: json['ngayTPNX'],
      tuNgay: json['tuNgay'],
      denNgay: json['denNgay'],
      nguoiGiao: json['nguoiGiao'],
      nhaCungCap: json['nhaCungCap'],
      soTienNX: json['soTienNX'].toString(),
      tienThuTuDichVu: json['tienThuTuDichVu'].toString(),
      tienThuKhac: json['tienThuKhac'].toString(),
      tongTien: json['tongTien'].toString(),
    );
  }
}
