// To parse this JSON data, do
//
//     final patientList = patientListFromJson(jsonString);

import 'dart:convert';

List<PatientList> patientListFromJson(String str) => List<PatientList>.from(
    json.decode(str).map((x) => PatientList.fromJson(x)));

String patientListToJson(List<PatientList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientList {
  PatientList({
    required this.id,
    this.patientRegNo,
    this.mobileNumber,
    required this.patientName,
  });

  int id;
  dynamic patientRegNo;
  dynamic mobileNumber;
  String patientName;

  factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
        id: json["Id"],
        patientRegNo: json["PatientRegNo"],
        mobileNumber: json["MobileNumber"],
        patientName: json["PatientName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientRegNo": patientRegNo,
        "MobileNumber": mobileNumber,
        "PatientName": patientName,
      };
}
