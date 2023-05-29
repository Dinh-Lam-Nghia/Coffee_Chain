class KMgiamGiaModel {
  String? maKM;
  String? tienToiThieuHD; 
  String? coSo;

  KMgiamGiaModel({
    this.maKM,
    this.tienToiThieuHD, 
    this.coSo,
  });
  factory KMgiamGiaModel.fromJson(Map<String, dynamic> json) {
    return KMgiamGiaModel(
      maKM: json["maKM"],
      tienToiThieuHD: json["tienToiThieuHD"], 
      coSo: json["coSo"],
    );
  }
}
