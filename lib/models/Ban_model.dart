class BanModel {
  String? maBan;
  String? tenBan;
  String? soChoNgoi;
  String? coSo; 

  BanModel({
    this.maBan,
    this.tenBan,
    this.soChoNgoi,
    this.coSo, 
  });

  factory BanModel.fromJson(Map<String, dynamic> json) {
    return BanModel(
      maBan: json['maBan'],
      tenBan: json['tenBan'],
      soChoNgoi: json['soChoNgoi'],
      coSo: json['coSo'], 
    );
  }
}
