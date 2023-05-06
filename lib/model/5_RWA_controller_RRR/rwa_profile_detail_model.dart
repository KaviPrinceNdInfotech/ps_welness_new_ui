// To parse this JSON data, do
//
//     final rwaProfileDetailModel = rwaProfileDetailModelFromJson(jsonString);

import 'dart:convert';

RwaProfileDetailModel rwaProfileDetailModelFromJson(String str) => RwaProfileDetailModel.fromJson(json.decode(str));

String rwaProfileDetailModelToJson(RwaProfileDetailModel data) => json.encode(data.toJson());

class RwaProfileDetailModel {
  List<RwaProfileDetail>? rwaProfileDetails;

  RwaProfileDetailModel({
    this.rwaProfileDetails,
  });

  factory RwaProfileDetailModel.fromJson(Map<String, dynamic> json) => RwaProfileDetailModel(
    rwaProfileDetails: json["RWA_ProfileDetails"] == null ? [] : List<RwaProfileDetail>.from(json["RWA_ProfileDetails"]!.map((x) => RwaProfileDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "RWA_ProfileDetails": rwaProfileDetails == null ? [] : List<dynamic>.from(rwaProfileDetails!.map((x) => x.toJson())),
  };
}

class RwaProfileDetail {
  int? id;
  String? authorityName;
  String? emailId;
  String? phoneNumber;
  String? stateName;
  String? cityName;
  String? location;
  dynamic pincode;

  RwaProfileDetail({
    this.id,
    this.authorityName,
    this.emailId,
    this.phoneNumber,
    this.stateName,
    this.cityName,
    this.location,
    this.pincode,
  });

  factory RwaProfileDetail.fromJson(Map<String, dynamic> json) => RwaProfileDetail(
    id: json["Id"],
    authorityName: json["AuthorityName"],
    emailId: json["EmailId"],
    phoneNumber: json["PhoneNumber"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    location: json["Location"],
    pincode: json["Pincode"],
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
  };
}
