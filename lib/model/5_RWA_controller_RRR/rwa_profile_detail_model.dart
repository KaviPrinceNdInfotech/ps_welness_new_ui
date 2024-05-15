// To parse this JSON data, do
//
//     final rwaProfileDetailModel = rwaProfileDetailModelFromJson(jsonString);

import 'dart:convert';

RwaProfileDetailModel rwaProfileDetailModelFromJson(String str) =>
    RwaProfileDetailModel.fromJson(json.decode(str));

String rwaProfileDetailModelToJson(RwaProfileDetailModel data) =>
    json.encode(data.toJson());

class RwaProfileDetailModel {
  int? id;
  String? authorityName;
  String? emailId;
  String? phoneNumber;
  String? stateName;
  String? cityName;
  String? location;
  String? pincode;
  num? stateMasterId;
  num? cityMasterId;

  RwaProfileDetailModel({
    this.id,
    this.authorityName,
    this.emailId,
    this.phoneNumber,
    this.stateName,
    this.cityName,
    this.location,
    this.pincode,
    this.stateMasterId,
    this.cityMasterId,
  });

  factory RwaProfileDetailModel.fromJson(Map<String, dynamic> json) =>
      RwaProfileDetailModel(
        id: json["Id"],
        authorityName: json["AuthorityName"],
        emailId: json["EmailId"],
        phoneNumber: json["PhoneNumber"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        location: json["Location"],
        pincode: json["Pincode"],
        stateMasterId: json["StateMaster_Id"],
        cityMasterId: json["CityMaster_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "AuthorityName": authorityName,
        "EmailId": emailId,
        "PhoneNumber": phoneNumber,
        "StateName": stateName,
        "CityName": cityName,
        "Location": location,
        "Pincode": pincode,
        "StateMaster_Id": stateMasterId,
        "CityMaster_Id": cityMasterId,
      };
}
