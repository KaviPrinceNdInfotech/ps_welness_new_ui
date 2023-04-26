// To parse this JSON data, do
//
//     final labdetailbyid = labdetailbyidFromJson(jsonString);

import 'dart:convert';

Labdetailbyid labdetailbyidFromJson(String str) => Labdetailbyid.fromJson(json.decode(str));

String labdetailbyidToJson(Labdetailbyid data) => json.encode(data.toJson());

class Labdetailbyid {
  Labdetailbyid({
    required this.id,
    required this.labName,
    required this.about,
    required this.labTypeName,
    required this.year,
    required this.location,
    required this.workingDay,
    required this.fee,
  });

  int id;
  String labName;
  String about;
  String labTypeName;
  String year;
  String location;
  String workingDay;
  double fee;

  factory Labdetailbyid.fromJson(Map<String, dynamic> json) => Labdetailbyid(
    id: json["Id"],
    labName: json["LabName"],
    about: json["About"],
    labTypeName: json["LabTypeName"],
    year: json["year"],
    location: json["Location"],
    workingDay: json["WorkingDay"],
    fee: json["Fee"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "LabName": labName,
    "About": about,
    "LabTypeName": labTypeName,
    "year": year,
    "Location": location,
    "WorkingDay": workingDay,
    "Fee": fee,
  };
}