// To parse this JSON data, do
//
//     final frenchiesProfileDetailModel = frenchiesProfileDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesProfileDetailModel frenchiesProfileDetailModelFromJson(String str) =>
    FrenchiesProfileDetailModel.fromJson(json.decode(str));

String frenchiesProfileDetailModelToJson(FrenchiesProfileDetailModel data) =>
    json.encode(data.toJson());

class FrenchiesProfileDetailModel {
  int? id;
  String? vendorName;
  String? mobileNumber;
  String? emailId;
  String? stateName;
  String? cityname;
  String? location;
  String? companyName;
  String? gstNumber;
  dynamic aadharOrPanImage;
  String? aadharOrPanNumber;
  String? pinCode;
  num? cityId;
  num? stateMasterId;

  FrenchiesProfileDetailModel({
    this.id,
    this.vendorName,
    this.mobileNumber,
    this.emailId,
    this.stateName,
    this.cityname,
    this.location,
    this.companyName,
    this.gstNumber,
    this.aadharOrPanImage,
    this.aadharOrPanNumber,
    this.pinCode,
    this.cityId,
    this.stateMasterId,
  });

  factory FrenchiesProfileDetailModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesProfileDetailModel(
        id: json["Id"],
        vendorName: json["VendorName"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        stateName: json["StateName"],
        cityname: json["cityname"],
        location: json["Location"],
        companyName: json["CompanyName"],
        gstNumber: json["GSTNumber"],
        aadharOrPanImage: json["AadharOrPANImage"],
        aadharOrPanNumber: json["AadharOrPANNumber"],
        pinCode: json["PinCode"],
        cityId: json["City_ID"],
        stateMasterId: json["StateMaster_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VendorName": vendorName,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "StateName": stateName,
        "cityname": cityname,
        "Location": location,
        "CompanyName": companyName,
        "GSTNumber": gstNumber,
        "AadharOrPANImage": aadharOrPanImage,
        "AadharOrPANNumber": aadharOrPanNumber,
        "PinCode": pinCode,
        "City_ID": cityId,
        "StateMaster_Id": stateMasterId,
      };
}
