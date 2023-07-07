// To parse this JSON data, do
//
//     final labcheckoutmodel = labcheckoutmodelFromJson(jsonString);

import 'dart:convert';

Labcheckoutmodel labcheckoutmodelFromJson(String str) =>
    Labcheckoutmodel.fromJson(json.decode(str));

String labcheckoutmodelToJson(Labcheckoutmodel data) =>
    json.encode(data.toJson());

class Labcheckoutmodel {
  int? id;
  String? labName;
  String? labTypeName;
  String? year;
  double? fee;
  DateTime? testDate;
  String? slotTime;

  Labcheckoutmodel({
    this.id,
    this.labName,
    this.labTypeName,
    this.year,
    this.fee,
    this.testDate,
    this.slotTime,
  });

  factory Labcheckoutmodel.fromJson(Map<String, dynamic> json) =>
      Labcheckoutmodel(
        id: json["Id"],
        labName: json["LabName"],
        labTypeName: json["LabTypeName"],
        year: json["year"],
        fee: json["Fee"],
        testDate: DateTime.parse(json["TestDate"]),
        slotTime: json["SlotTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "LabTypeName": labTypeName,
        "year": year,
        "Fee": fee,
        "TestDate": testDate?.toIso8601String(),
        "SlotTime": slotTime,
      };
}
