// To parse this JSON data, do
//
//     final doctorReportUserList = doctorReportUserListFromJson(jsonString);

import 'dart:convert';

DoctorReportUserList doctorReportUserListFromJson(String str) =>
    DoctorReportUserList.fromJson(json.decode(str));

String doctorReportUserListToJson(DoctorReportUserList data) =>
    json.encode(data.toJson());

class DoctorReportUserList {
  List<DoctorReportByPatient>? doctorReportByPatient;

  DoctorReportUserList({
    this.doctorReportByPatient,
  });

  factory DoctorReportUserList.fromJson(Map<String, dynamic> json) =>
      DoctorReportUserList(
        doctorReportByPatient: json["DoctorReportByPatient"] == null
            ? []
            : List<DoctorReportByPatient>.from(json["DoctorReportByPatient"]!
                .map((x) => DoctorReportByPatient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DoctorReportByPatient": doctorReportByPatient == null
            ? []
            : List<dynamic>.from(doctorReportByPatient!.map((x) => x.toJson())),
      };
}

class DoctorReportByPatient {
  int? id;
  String? doctorName;
  String? image1;

  DoctorReportByPatient({
    this.id,
    this.doctorName,
    this.image1,
  });

  factory DoctorReportByPatient.fromJson(Map<String, dynamic> json) =>
      DoctorReportByPatient(
        id: json["Id"],
        doctorName: json["DoctorName"],
        image1: json["Image1"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DoctorName": doctorName,
        "Image1": image1,
      };
}
