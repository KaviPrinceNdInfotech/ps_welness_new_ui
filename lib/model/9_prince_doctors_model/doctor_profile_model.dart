// To parse this JSON data, do
//
//     final doctorProfile = doctorProfileFromJson(jsonString);

import 'dart:convert';

DoctorProfile? doctorProfileFromJson(String str) =>
    DoctorProfile.fromJson(json.decode(str));

String doctorProfileToJson(DoctorProfile? data) => json.encode(data!.toJson());

class DoctorProfile {
  DoctorProfile({
    this.id,
    this.doctorName,
    this.mobileNumber,
    this.stateName,
    this.cityName,
    this.emailId,
    this.location,
    this.clinicName,
    this.departmentName,
    this.availableTime,
  });

  int? id;
  String? doctorName;
  String? mobileNumber;
  String? stateName;
  String? cityName;
  String? emailId;
  String? location;
  String? clinicName;
  String? departmentName;
  String? availableTime;

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => DoctorProfile(
        id: json["Id"],
        doctorName: json["DoctorName"],
        mobileNumber: json["MobileNumber"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        emailId: json["EmailId"],
        location: json["Location"],
        clinicName: json["ClinicName"],
        departmentName: json["DepartmentName"],
        availableTime: json["AvailableTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DoctorName": doctorName,
        "MobileNumber": mobileNumber,
        "StateName": stateName,
        "CityName": cityName,
        "EmailId": emailId,
        "Location": location,
        "ClinicName": clinicName,
        "DepartmentName": departmentName,
        "AvailableTime": availableTime,
      };
}
