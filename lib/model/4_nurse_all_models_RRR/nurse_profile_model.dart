// To parse this JSON data, do
//
//     final nurseProfileModel = nurseProfileModelFromJson(jsonString);

import 'dart:convert';

NurseProfileModel nurseProfileModelFromJson(String str) =>
    NurseProfileModel.fromJson(json.decode(str));

String nurseProfileModelToJson(NurseProfileModel data) =>
    json.encode(data.toJson());

class NurseProfileModel {
  int? id;
  String? nurseName;
  String? mobileNumber;
  String? emailId;
  String? stateName;
  String? cityName;
  String? pinCode;
  String? location;
  num? cityMasterId;
  num? stateMasterId;

  NurseProfileModel({
    this.id,
    this.nurseName,
    this.mobileNumber,
    this.emailId,
    this.stateName,
    this.cityName,
    this.pinCode,
    this.location,
    this.cityMasterId,
    this.stateMasterId,
  });

  factory NurseProfileModel.fromJson(Map<String, dynamic> json) =>
      NurseProfileModel(
        id: json["Id"],
        nurseName: json["NurseName"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        pinCode: json["PinCode"],
        location: json["Location"],
        cityMasterId: json["CityMaster_Id"],
        stateMasterId: json["StateMaster_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NurseName": nurseName,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "StateName": stateName,
        "CityName": cityName,
        "PinCode": pinCode,
        "Location": location,
        "CityMaster_Id": cityMasterId,
        "StateMaster_Id": stateMasterId,
      };
}
