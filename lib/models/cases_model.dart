import 'dart:convert';

Cases casesFromJson(String str) => Cases.fromJson(json.decode(str));

String casesToJson(Cases data) => json.encode(data.toJson());

class Cases {
  Cases({
    this.data,
  });

  List<CasesData> data;

  factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        data: List<CasesData>.from(
            json["Data"].map((x) => CasesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CasesData {
  CasesData({
    this.confirmDate,
    this.no,
    this.age,
    this.gender,
    this.genderEn,
    this.nation,
    this.nationEn,
    this.province,
    this.provinceId,
    this.district,
    this.provinceEn,
    this.detail,
    this.statQuarantine,
  });

  DateTime confirmDate;
  String no;
  int age;
  String gender;
  String genderEn;
  String nation;
  String nationEn;
  String province;
  int provinceId;
  String district;
  String provinceEn;
  dynamic detail;
  int statQuarantine;

  factory CasesData.fromJson(Map<String, dynamic> json) => CasesData(
        confirmDate: DateTime.parse(json["ConfirmDate"]),
        no: json["No"],
        age: json["Age"],
        gender: json["Gender"],
        genderEn: json["GenderEn"],
        nation: json["Nation"],
        nationEn: json["NationEn"],
        province: json["Province"],
        provinceId: json["ProvinceId"],
        district: json["District"],
        provinceEn: json["ProvinceEn"],
        detail: json["Detail"],
        statQuarantine: json["StatQuarantine"],
      );

  Map<String, dynamic> toJson() => {
        "ConfirmDate": confirmDate,
        "No": no,
        "Age": age,
        "Gender": gender,
        "GenderEn": genderEn,
        "Nation": nation,
        "NationEn": nationEn,
        "Province": province,
        "ProvinceId": provinceId,
        "District": district,
        "ProvinceEn": provinceEn,
        "Detail": detail,
        "StatQuarantine": statQuarantine,
      };
}
