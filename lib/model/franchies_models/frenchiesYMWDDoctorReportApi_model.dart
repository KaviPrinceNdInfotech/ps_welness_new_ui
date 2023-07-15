// To parse this JSON data, do
//
//     final frenchiesYmdwDoctorModel = frenchiesYmdwDoctorModelFromJson(jsonString);

import 'dart:convert';

FrenchiesYmdwDoctorModel frenchiesYmdwDoctorModelFromJson(String str) => FrenchiesYmdwDoctorModel.fromJson(json.decode(str));

String frenchiesYmdwDoctorModelToJson(FrenchiesYmdwDoctorModel data) => json.encode(data.toJson());

class FrenchiesYmdwDoctorModel {
  List<DoctorYmwdReport>? doctorYmwdReport;

  FrenchiesYmdwDoctorModel({
    this.doctorYmwdReport,
  });

  factory FrenchiesYmdwDoctorModel.fromJson(Map<String, dynamic> json) => FrenchiesYmdwDoctorModel(
    doctorYmwdReport: json["DoctorYMWD_Report"] == null ? [] : List<DoctorYmwdReport>.from(json["DoctorYMWD_Report"]!.map((x) => DoctorYmwdReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DoctorYMWD_Report": doctorYmwdReport == null ? [] : List<dynamic>.from(doctorYmwdReport!.map((x) => x.toJson())),
  };
}

class DoctorYmwdReport {
  int? id;
  String? doctorId;
  String? doctorName;
  num? fee;
  String? location;
  String? departmentName;
  String? specialistName;
  String? phoneNumber;
  String? emailId;
  String? licenceNumber;

  DoctorYmwdReport({
    this.id,
    this.doctorId,
    this.doctorName,
    this.fee,
    this.location,
    this.departmentName,
    this.specialistName,
    this.phoneNumber,
    this.emailId,
    this.licenceNumber,
  });

  factory DoctorYmwdReport.fromJson(Map<String, dynamic> json) => DoctorYmwdReport(
    id: json["Id"],
    doctorId: json["DoctorId"],
    doctorName: json["DoctorName"],
    fee: json["Fee"],
    location: json["Location"],
    departmentName: json["DepartmentName"],
    specialistName: json["SpecialistName"],
    phoneNumber: json["PhoneNumber"],
    emailId: json["EmailId"],
    licenceNumber: json["LicenceNumber"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DoctorId": doctorId,
    "DoctorName": doctorName,
    "Fee": fee,
    "Location": location,
    "DepartmentName": departmentName,
    "SpecialistName": specialistName,
    "PhoneNumber": phoneNumber,
    "EmailId": emailId,
    "LicenceNumber": licenceNumber,
  };
}
