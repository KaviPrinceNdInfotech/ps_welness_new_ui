// To parse this JSON data, do
//
//     final viewPatientReport = viewPatientReportFromJson(jsonString);

import 'dart:convert';

ViewPatientReport? viewPatientReportFromJson(String str) =>
    ViewPatientReport.fromJson(json.decode(str));

String viewPatientReportToJson(ViewPatientReport? data) =>
    json.encode(data!.toJson());

class ViewPatientReport {
  ViewPatientReport({
    this.message,
    this.patientId,
    this.patientName,
    this.patientRegNo,
    this.mobileNumber,
    this.emailId,
    this.response,
  });

  String? message;
  int? patientId;
  String? patientName;
  String? patientRegNo;
  String? mobileNumber;
  String? emailId;
  List<dynamic>? response;

  factory ViewPatientReport.fromJson(Map<String, dynamic> json) =>
      ViewPatientReport(
        message: json["Message"],
        patientId: json["PatientId"],
        patientName: json["PatientName"],
        patientRegNo: json["PatientRegNo"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        response: json["response"] == null
            ? []
            : List<dynamic>.from(json["response"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "PatientId": patientId,
        "PatientName": patientName,
        "PatientRegNo": patientRegNo,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "response":
            response == null ? [] : List<dynamic>.from(response!.map((x) => x)),
      };
}
