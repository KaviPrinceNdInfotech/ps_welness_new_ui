// To parse this JSON data, do
//
//     final frenchiesProfileDetailModel = frenchiesProfileDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesProfileDetailModel frenchiesProfileDetailModelFromJson(String str) => FrenchiesProfileDetailModel.fromJson(json.decode(str));

String frenchiesProfileDetailModelToJson(FrenchiesProfileDetailModel data) => json.encode(data.toJson());

class FrenchiesProfileDetailModel {
  String? vendorName;
  String? mobileNumber;
  String? emailId;
  String? stateName;
  String? cityname;
  String? location;

  FrenchiesProfileDetailModel({
    this.vendorName,
    this.mobileNumber,
    this.emailId,
    this.stateName,
    this.cityname,
    this.location,
  });

  factory FrenchiesProfileDetailModel.fromJson(Map<String, dynamic> json) => FrenchiesProfileDetailModel(
    vendorName: json["VendorName"],
    mobileNumber: json["MobileNumber"],
    emailId: json["EmailId"],
    stateName: json["StateName"],
    cityname: json["cityname"],
    location: json["Location"],
  );

  Map<String, dynamic> toJson() => {
    "VendorName": vendorName,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "StateName": stateName,
    "cityname": cityname,
    "Location": location,
  };
}
