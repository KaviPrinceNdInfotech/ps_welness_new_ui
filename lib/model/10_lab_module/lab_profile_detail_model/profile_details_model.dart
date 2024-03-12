// To parse this JSON data, do
//
//     final labprofileModel = labprofileModelFromJson(jsonString);

import 'dart:convert';

LabprofileModel labprofileModelFromJson(String str) =>
    LabprofileModel.fromJson(json.decode(str));

String labprofileModelToJson(LabprofileModel data) =>
    json.encode(data.toJson());

class LabprofileModel {
  int? id;
  String? labName;
  String? mobileNumber;
  String? emailId;
  String? stateName;
  String? cityName;
  dynamic pinCode;
  String? location;
  num? stateMasterId;
  num? cityMasterId;

  LabprofileModel({
    this.id,
    this.labName,
    this.mobileNumber,
    this.emailId,
    this.stateName,
    this.cityName,
    this.pinCode,
    this.location,
    this.stateMasterId,
    this.cityMasterId,
  });

  factory LabprofileModel.fromJson(Map<String, dynamic> json) =>
      LabprofileModel(
        id: json["Id"],
        labName: json["LabName"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        pinCode: json["PinCode"],
        location: json["Location"],
        stateMasterId: json["StateMaster_Id"],
        cityMasterId: json["CityMaster_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "StateName": stateName,
        "CityName": cityName,
        "PinCode": pinCode,
        "Location": location,
        "StateMaster_Id": stateMasterId,
        "CityMaster_Id": cityMasterId,
      };
}
