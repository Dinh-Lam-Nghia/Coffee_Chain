class UserPassModel {
  String? maNV;
  String? user;
  String? pass;
  String? coSo;
  UserPassModel({
    this.maNV,
    this.user,
    this.pass,
    this.coSo,
  });
  factory UserPassModel.fromJson(Map<String, dynamic> json) {
    return UserPassModel(
      maNV: json['maNV'],
      user: json['user'],
      pass: json['pass'],
      coSo: json['coSo'],
    );
  }
}
