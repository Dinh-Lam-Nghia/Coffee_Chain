class BanHoatDongModel {
  String? maBan;
  String? tenBan;
  String? order;
  String? phucVu;
  int? soLuongNGuoi;
  double? tongTien;
  bool? dangPV;
  bool? thanhToan;
  bool? mangVe;
  bool? ctToan;

  BanHoatDongModel(
      {this.maBan,
      this.tenBan,
      this.order,
      this.phucVu,
      this.soLuongNGuoi,
      this.tongTien,
      this.dangPV,
      this.thanhToan,
      this.mangVe,
      this.ctToan});

  factory BanHoatDongModel.fromJson(Map<String, dynamic> json) {
    return BanHoatDongModel(
      maBan: json['maBan'],
      tenBan: json['tenBan'],
      order: json['order'],
      phucVu: json['phucVu'],
      soLuongNGuoi: json['soLuongNGuoi'],
      tongTien: json['tongTien'],
      dangPV: json['dangPV'],
      thanhToan: json['thanhToan'],
      mangVe: json['mangVe'],
      ctToan: json['chothanhToan']
    );
  }
}
