class PhieuChiModel{
  int? id;
  String? maPhieuC;
  int? SoTT;
  String? TenKC;
  String? ChiPNVL;
  String? ChiPDN;
  String? Khac;
  double? TongTien;
  String? Ghichu;

  PhieuChiModel({
    this.id,
    this.maPhieuC, 
    this.SoTT, 
    this.TenKC,
    this.ChiPNVL,
    this.ChiPDN,
    this.Khac, 
    this.TongTien, 
    this.Ghichu,
    });

    factory PhieuChiModel.fromJson(Map<String, dynamic> json){
      return PhieuChiModel(
        id: int.parse(json['id'].toString()),
        maPhieuC: json['maPhieuC'],
        SoTT: int.parse(json['SoTT'].toString()),
        TenKC: json["TenKC"],
        ChiPNVL:json["ChiPNVL"],
        ChiPDN: json["ChiPDN"],
        Khac: json["Khac"],
        TongTien: double.parse(json["TongTien"].toString()),
        Ghichu: json["Ghichu"],
      );
    }
}