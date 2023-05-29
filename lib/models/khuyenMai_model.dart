class KhuyenMaiModel {
  String? maKM;
  String? tenKM;
  String? moTa;
  String? giaTriKM;
  String? tuNgay;
  String? denNgay;
  String? TN;
  String? DN;
  String? dkApDung;
  String? coSo;

  KhuyenMaiModel({
    this.maKM,
    this.tenKM,
    this.moTa,
    this.giaTriKM,
    this.tuNgay,
    this.denNgay,
    this.TN,
    this.DN,
    this.dkApDung,
    this.coSo,
  });
  factory KhuyenMaiModel.fromJson(Map<String, dynamic> json) {
    return KhuyenMaiModel(
      maKM: json["maKM"],
      tenKM: json["tenKM"],
      moTa: json["moTa"],
      giaTriKM: json["giaTriKM"],
      tuNgay: json["tuNgay"],
      denNgay: json["denNgay"],
      TN: json["TN"],
      DN: json["DN"],
      dkApDung: json["dkApDung"],
      coSo: json["coSo"],
    );
  }
}
