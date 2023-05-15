class MonModel {
  String? maMon;
  String? tenMon;
  String? loaiMon;
  String? nhomThucDon;
  String? donViTinh;
  String? noiNhanMon;
  double? giaTien;
  String? image;
  String? coSo;

  MonModel(
    {
      this.maMon,
      this.tenMon,
      this.loaiMon,
      this.nhomThucDon,
      this.donViTinh,
      this.noiNhanMon,
      this.giaTien,
      this.image,
      this.coSo,
    }
  );

  factory MonModel.fromJson(Map<String,dynamic>json){
    return MonModel(
      maMon: json['maMon'],
      tenMon: json['tenMon'],
      loaiMon: json['loaiMon'],
      nhomThucDon: json['nhomThucDon'],
      donViTinh: json['donViTinh'],
      noiNhanMon: json['noiNhanMon'],
      giaTien: double.parse(json['giaTien'].toString()),
      image: json['image'],
      coSo: json['coSo'],
    );
  }
}