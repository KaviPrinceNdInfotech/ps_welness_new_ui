// To parse this JSON data, do
//
//     final uploadReportdropdownModel = uploadReportdropdownModelFromJson(jsonString);

import 'dart:convert';

UploadReportdropdownModel uploadReportdropdownModelFromJson(String str) =>
    UploadReportdropdownModel.fromJson(json.decode(str));

String uploadReportdropdownModelToJson(UploadReportdropdownModel data) =>
    json.encode(data.toJson());

class UploadReportdropdownModel {
  List<PatientdropdownName>? patientName;

  UploadReportdropdownModel({
    this.patientName,
  });

  factory UploadReportdropdownModel.fromJson(Map<String, dynamic> json) =>
      UploadReportdropdownModel(
        patientName: json["PatientName"] == null
            ? []
            : List<PatientdropdownName>.from(json["PatientName"]!
                .map((x) => PatientdropdownName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PatientName": patientName == null
            ? []
            : List<dynamic>.from(patientName!.map((x) => x.toJson())),
      };
}

class PatientdropdownName {
  int? id;
  String? patientName;

  PatientdropdownName({
    this.id,
    this.patientName,
  });

  factory PatientdropdownName.fromJson(Map<String, dynamic> json) =>
      PatientdropdownName(
        id: json["Id"],
        patientName: json["PatientName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
      };
}
