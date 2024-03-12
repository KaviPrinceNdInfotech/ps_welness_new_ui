// To parse this JSON data, do
//
//     final doctorProfileDetail = doctorProfileDetailFromJson(jsonString);

import 'dart:convert';

DoctorProfileDetail doctorProfileDetailFromJson(String str) =>
    DoctorProfileDetail.fromJson(json.decode(str));

String doctorProfileDetailToJson(DoctorProfileDetail data) =>
    json.encode(data.toJson());

class DoctorProfileDetail {
  int? id;
  String? doctorName;
  String? mobileNumber;
  String? stateName;
  String? cityName;
  String? emailId;
  String? location;
  String? clinicName;
  String? departmentName;
  String? pinCode;
  String? availableTime;
  num? stateMasterId;
  num? cityMasterId;

  DoctorProfileDetail({
    this.id,
    this.doctorName,
    this.mobileNumber,
    this.stateName,
    this.cityName,
    this.emailId,
    this.location,
    this.clinicName,
    this.departmentName,
    this.pinCode,
    this.availableTime,
    this.stateMasterId,
    this.cityMasterId,
  });

  factory DoctorProfileDetail.fromJson(Map<String, dynamic> json) =>
      DoctorProfileDetail(
        id: json["Id"],
        doctorName: json["DoctorName"],
        mobileNumber: json["MobileNumber"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        emailId: json["EmailId"],
        location: json["Location"],
        clinicName: json["ClinicName"],
        departmentName: json["DepartmentName"],
        pinCode: json["PinCode"],
        availableTime: json["AvailableTime"],
        stateMasterId: json["StateMaster_Id"],
        cityMasterId: json["CityMaster_Id"],
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
        "PinCode": pinCode,
        "AvailableTime": availableTime,
        "StateMaster_Id": stateMasterId,
        "CityMaster_Id": cityMasterId,
      };
}
