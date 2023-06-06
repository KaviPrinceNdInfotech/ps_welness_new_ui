// To parse this JSON data, do
//
//     final nurseViewReportModel = nurseViewReportModelFromJson(jsonString);

import 'dart:convert';

NurseViewReportModel nurseViewReportModelFromJson(String str) =>
    NurseViewReportModel.fromJson(json.decode(str));

String nurseViewReportModelToJson(NurseViewReportModel data) =>
    json.encode(data.toJson());

class NurseViewReportModel {
  List<NurseViewReport>? nurseViewReport;

  NurseViewReportModel({
    this.nurseViewReport,
  });

  factory NurseViewReportModel.fromJson(Map<String, dynamic> json) =>
      NurseViewReportModel(
        nurseViewReport: json["NurseViewReport"] == null
            ? []
            : List<NurseViewReport>.from(json["NurseViewReport"]!
                .map((x) => NurseViewReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "NurseViewReport": nurseViewReport == null
            ? []
            : List<dynamic>.from(nurseViewReport!.map((x) => x.toJson())),
      };
}

class NurseViewReport {
  int? id;
  String? patientName;
  String? file;

  NurseViewReport({
    this.id,
    this.patientName,
    this.file,
  });

  factory NurseViewReport.fromJson(Map<String, dynamic> json) =>
      NurseViewReport(
        id: json["Id"],
        patientName: json["PatientName"],
        file: json["File"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "File": file,
      };
}
