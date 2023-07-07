// To parse this JSON data, do
//
//     final doctorViewReportModel = doctorViewReportModelFromJson(jsonString);

import 'dart:convert';

DoctorViewReportModel doctorViewReportModelFromJson(String str) =>
    DoctorViewReportModel.fromJson(json.decode(str));

String doctorViewReportModelToJson(DoctorViewReportModel data) =>
    json.encode(data.toJson());

class DoctorViewReportModel {
  List<DoctorViewReport>? doctorViewReport;

  DoctorViewReportModel({
    this.doctorViewReport,
  });

  factory DoctorViewReportModel.fromJson(Map<String, dynamic> json) =>
      DoctorViewReportModel(
        doctorViewReport: json["DoctorViewReport"] == null
            ? []
            : List<DoctorViewReport>.from(json["DoctorViewReport"]!
                .map((x) => DoctorViewReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DoctorViewReport": doctorViewReport == null
            ? []
            : List<dynamic>.from(doctorViewReport!.map((x) => x.toJson())),
      };
}

class DoctorViewReport {
  int? id;
  String? patientName;
  String? image1;

  DoctorViewReport({
    this.id,
    this.patientName,
    this.image1,
  });

  factory DoctorViewReport.fromJson(Map<String, dynamic> json) =>
      DoctorViewReport(
        id: json["Id"],
        patientName: json["PatientName"],
        image1: json["Image1"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "Image1": image1,
      };
}
