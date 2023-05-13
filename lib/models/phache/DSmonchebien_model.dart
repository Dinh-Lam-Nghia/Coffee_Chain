class DSmonCheBienModel {
  String? maBan;
  String? maMon;
  String? tenMon;
  int? slMon;
  int? hoanThanh;
  String? note;

  DSmonCheBienModel(
      {this.maBan,
      this.maMon,
      this.tenMon,
      this.slMon,
      this.hoanThanh,
      this.note});

  factory DSmonCheBienModel.fromJson(Map<String, dynamic> json) {
    return DSmonCheBienModel(
      maBan: json['maBan'],
      maMon: json['maMon'],
      tenMon: json['tenMon'],
      slMon: int.parse(json['slMon'].toString()),
      hoanThanh: int.parse(json['hoanThanh'].toString()),
      note: json['note'],
    );
  }
}
