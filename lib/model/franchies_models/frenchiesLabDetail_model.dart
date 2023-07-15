// To parse this JSON data, do
//
//     final frenchiesLabDetailModel = frenchiesLabDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesLabDetailModel frenchiesLabDetailModelFromJson(String str) => FrenchiesLabDetailModel.fromJson(json.decode(str));

String frenchiesLabDetailModelToJson(FrenchiesLabDetailModel data) => json.encode(data.toJson());

class FrenchiesLabDetailModel {
  List<LabRegDetail>? labRegDetail;

  FrenchiesLabDetailModel({
    this.labRegDetail,
  });

  factory FrenchiesLabDetailModel.fromJson(Map<String, dynamic> json) => FrenchiesLabDetailModel(
    labRegDetail: json["LabRegDetail"] == null ? [] : List<LabRegDetail>.from(json["LabRegDetail"]!.map((x) => LabRegDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LabRegDetail": labRegDetail == null ? [] : List<dynamic>.from(labRegDetail!.map((x) => x.toJson())),
  };
}

class LabRegDetail {
  int? id;
  String? lAbId;
  String? labName;
  String? franchise;
  String? phoneNumber;
  String? mobileNumber;
  String? emailId;
  String? location;
  String? licenceNumber;
  String? gstNumber;
  String? aadharNumber;
  bool? isApproved;

  LabRegDetail({
    this.id,
    this.lAbId,
    this.labName,
    this.franchise,
    this.phoneNumber,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.licenceNumber,
    this.gstNumber,
    this.aadharNumber,
    this.isApproved,
  });

  factory LabRegDetail.fromJson(Map<String, dynamic> json) => LabRegDetail(
    id: json["Id"],
    lAbId: json["lABId"],
    labName: json["LabName"],
    franchise: json["Franchise"],
    phoneNumber: json["PhoneNumber"],
    mobileNumber: json["MobileNumber"],
    emailId: json["EmailId"],
    location: json["Location"],
    licenceNumber: json["LicenceNumber"],
    gstNumber: json["GSTNumber"],
    aadharNumber: json["AadharNumber"],
    isApproved: json["IsApproved"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "lABId": lAbId,
    "LabName": labName,
    "Franchise": franchise,
    "PhoneNumber": phoneNumber,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "Location": location,
    "LicenceNumber": licenceNumber,
    "GSTNumber": gstNumber,
    "AadharNumber": aadharNumber,
    "IsApproved": isApproved,
  };
}