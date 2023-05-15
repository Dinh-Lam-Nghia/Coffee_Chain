class BanHoatDongModel {
  String? maBan;
  String? tenBan;
  String? order;
  String? nguoiPhucVu;
  int? slKhach;
  int? hoanThanhMon;
  double? tongTien;
  int? dangPhucVu;
  int? thanhToan;
  int? mangve;
  String? coSo;

  BanHoatDongModel({
    this.maBan,
    this.tenBan,
    this.order,
    this.nguoiPhucVu,
    this.slKhach,
    this.hoanThanhMon,
    this.tongTien,
    this.dangPhucVu,
    this.thanhToan,
    this.mangve,
    this.coSo,
  });

  factory BanHoatDongModel.fromJson(Map<String, dynamic> json) {
    return BanHoatDongModel(
      maBan: json['maBan'],
      tenBan: json['tenBan'],
      order: json['order'],
      nguoiPhucVu: json['nguoiPhucVu'],
      slKhach: int.parse(json['slKhach'].toString()),
      hoanThanhMon: int.parse(json['hoanThanhMon'].toString()),
      tongTien: double.parse(json['tongTien'].toString()),
      dangPhucVu: int.parse(json['dangPhucVu'].toString()),
      thanhToan: int.parse(json['thanhToan'].toString()),
      mangve: int.parse(json['mangve'].toString()),
      coSo: json['coSo'].toString(),
    );
  }
}
