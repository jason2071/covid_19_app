import 'dart:convert';

TimelineModel timelineFromJson(String str) =>
    TimelineModel.fromJson(json.decode(str));

String timelineToJson(TimelineModel data) => json.encode(data.toJson());

class TimelineModel {
  TimelineModel({
    this.updateDate,
    this.source,
    this.devBy,
    this.severBy,
    this.data,
  });

  String updateDate;
  String source;
  String devBy;
  String severBy;
  List<TimelineData> data;

  factory TimelineModel.fromJson(Map<String, dynamic> json) => TimelineModel(
        updateDate: json["UpdateDate"],
        source: json["Source"],
        devBy: json["DevBy"],
        severBy: json["SeverBy"],
        data: List<TimelineData>.from(
            json["Data"].map((x) => TimelineData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UpdateDate": updateDate,
        "Source": source,
        "DevBy": devBy,
        "SeverBy": severBy,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TimelineData {
  TimelineData({
    this.date,
    this.newConfirmed,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
  });

  String date;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;

  factory TimelineData.fromJson(Map<String, dynamic> json) => TimelineData(
        date: json["Date"],
        newConfirmed: json["NewConfirmed"],
        newRecovered: json["NewRecovered"],
        newHospitalized: json["NewHospitalized"],
        newDeaths: json["NewDeaths"],
        confirmed: json["Confirmed"],
        recovered: json["Recovered"],
        hospitalized: json["Hospitalized"],
        deaths: json["Deaths"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date,
        "NewConfirmed": newConfirmed,
        "NewRecovered": newRecovered,
        "NewHospitalized": newHospitalized,
        "NewDeaths": newDeaths,
        "Confirmed": confirmed,
        "Recovered": recovered,
        "Hospitalized": hospitalized,
        "Deaths": deaths,
      };
}

// TimelineModel timelineModel;
