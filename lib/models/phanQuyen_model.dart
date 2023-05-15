class PhanQuyenModel{
  String? maNV;
  String? phucVu;
  String? thuNgan;
  String? admin;
  String? phaChe;
  PhanQuyenModel({
    this.maNV,
    this.phucVu,
    this.thuNgan,
    this.admin,
    this.phaChe,
  });
  factory PhanQuyenModel.fromJson(Map<String, dynamic> json){
    return PhanQuyenModel(
      maNV: json['maNV'],
      phucVu: json['phucVu'],
      thuNgan: json['thuNgan'],
      admin: json['admin'],
      phaChe: json['phaChe'],
    );
  }
}