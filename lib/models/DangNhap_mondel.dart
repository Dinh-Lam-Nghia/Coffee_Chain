class DangNhapModel {
  String? maNV;
  String? user;
  String? pass;
  String? coSo;

  DangNhapModel({
    this.maNV,
    this.user,
    this.pass,
    this.coSo,
  });

  factory DangNhapModel.fromJson(Map<String, dynamic> json) {
    return DangNhapModel(
      maNV: json['maNV'].toString(),
      user: json['user'].toString(),
      pass: json['pass'].toString(),
      coSo: json['coSo'].toString(),
    );
  }
}
