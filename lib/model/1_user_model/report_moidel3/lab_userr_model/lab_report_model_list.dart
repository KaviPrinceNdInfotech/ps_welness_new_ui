// To parse this JSON data, do
//
//     final labReportUserList = labReportUserListFromJson(jsonString);

import 'dart:convert';

LabReportUserList labReportUserListFromJson(String str) =>
    LabReportUserList.fromJson(json.decode(str));

String labReportUserListToJson(LabReportUserList data) =>
    json.encode(data.toJson());

class LabReportUserList {
  List<NurseViewssReport>? viewLabReportByPatient;

  LabReportUserList({
    this.viewLabReportByPatient,
  });

  factory LabReportUserList.fromJson(Map<String, dynamic> json) =>
      LabReportUserList(
        viewLabReportByPatient: json["ViewLabReport_ByPatient"] == null
            ? []
            : List<NurseViewssReport>.from(json["ViewLabReport_ByPatient"]!
                .map((x) => NurseViewssReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ViewLabReport_ByPatient": viewLabReportByPatient == null
            ? []
            : List<dynamic>.from(
                viewLabReportByPatient!.map((x) => x.toJson())),
      };
}

class NurseViewssReport {
  int? id;
  String? labName;
  String? testName;
  String? testDate;
  String? file;

  NurseViewssReport({
    this.id,
    this.labName,
    this.testName,
    this.testDate,
    this.file,
  });

  factory NurseViewssReport.fromJson(Map<String, dynamic> json) =>
      NurseViewssReport(
        id: json["Id"],
        labName: json["LabName"],
        testName: json["TestName"],
        testDate: json["TestDate"],
        file: json["File"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "TestName": testName,
        "TestDate": testDate,
        "File": file,
      };
}
