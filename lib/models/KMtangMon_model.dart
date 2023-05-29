class KMtangMonModel {
  String? maKM;
  String? maMon;
  String? sLuong; 
  String? coSo;

  KMtangMonModel({
    this.maKM,
    this.maMon,
    this.sLuong, 
    this.coSo,
  });
  factory KMtangMonModel.fromJson(Map<String, dynamic> json) {
    return KMtangMonModel(
      maKM: json["maKM"],
      maMon: json["maMon "],
      sLuong: json["sLuong"], 
      coSo: json["coSo"],
    );
  }
}
