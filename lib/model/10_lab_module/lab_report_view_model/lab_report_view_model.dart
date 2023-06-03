// To parse this JSON data, do
//
//     final viewreportModel = viewreportModelFromJson(jsonString);

import 'dart:convert';

ViewreportModel viewreportModelFromJson(String str) =>
    ViewreportModel.fromJson(json.decode(str));

String viewreportModelToJson(ViewreportModel data) =>
    json.encode(data.toJson());

class ViewreportModel {
  List<LabViewReport>? labViewReport;

  ViewreportModel({
    this.labViewReport,
  });

  factory ViewreportModel.fromJson(Map<String, dynamic> json) =>
      ViewreportModel(
        labViewReport: json["LabViewReport"] == null
            ? []
            : List<LabViewReport>.from(
                json["LabViewReport"]!.map((x) => LabViewReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabViewReport": labViewReport == null
            ? []
            : List<dynamic>.from(labViewReport!.map((x) => x.toJson())),
      };
}

class LabViewReport {
  int? id;
  String? patientName;
  String? testName;
  //DateTime? testDate;
  String? file;

  LabViewReport({
    this.id,
    this.patientName,
    this.testName,
    //this.testDate,
    this.file,
  });

  factory LabViewReport.fromJson(Map<String, dynamic> json) => LabViewReport(
        id: json["Id"],
        patientName: json["PatientName"],
        testName: json["TestName"],
        //testDate:
        // json["TestDate"] == null ? null : DateTime.parse(json["TestDate"]),
        file: json["File"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "TestName": testName,
        //"TestDate": testDate?.toIso8601String(),
        "File": file,
      };
}

// enum TestName { HAEMATOLOGY, ACT }
//
// final testNameValues =
//     EnumValues({"ACT": TestName.ACT, "HAEMATOLOGY": TestName.HAEMATOLOGY});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
