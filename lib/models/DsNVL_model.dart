class DsNVLModel {
  String? maNVL;
  String? tenNVL;

  DsNVLModel({
    this.maNVL,
    this.tenNVL,
  });

  factory DsNVLModel.fromJson(Map<String, dynamic> json) {
    return DsNVLModel(
      maNVL: json['maNVL'],
      tenNVL: json['tenNVL'],
    );
  }
}
