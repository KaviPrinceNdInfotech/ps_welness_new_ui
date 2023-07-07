// To parse this JSON data, do
//
//     final frenchiesRwaDetailModel = frenchiesRwaDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesRwaDetailModel frenchiesRwaDetailModelFromJson(String str) => FrenchiesRwaDetailModel.fromJson(json.decode(str));

String frenchiesRwaDetailModelToJson(FrenchiesRwaDetailModel data) => json.encode(data.toJson());

class FrenchiesRwaDetailModel {
  List<RwaRegDetail>? rwaRegDetail;

  FrenchiesRwaDetailModel({
    this.rwaRegDetail,
  });

  factory FrenchiesRwaDetailModel.fromJson(Map<String, dynamic> json) => FrenchiesRwaDetailModel(
    rwaRegDetail: json["RWARegDetail"] == null ? [] : List<RwaRegDetail>.from(json["RWARegDetail"]!.map((x) => RwaRegDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "RWARegDetail": rwaRegDetail == null ? [] : List<dynamic>.from(rwaRegDetail!.map((x) => x.toJson())),
  };
}

class RwaRegDetail {
  int? id;
  String? rwaId;
  String? authorityName;
  String? phoneNumber;
  String? mobileNumber;
  String? emailId;
  String? location;
  String? certificateNo;
  bool? isApproved;

  RwaRegDetail({
    this.id,
    this.rwaId,
    this.authorityName,
    this.phoneNumber,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.certificateNo,
    this.isApproved,
  });

  factory RwaRegDetail.fromJson(Map<String, dynamic> json) => RwaRegDetail(
    id: json["Id"],
    rwaId: json["RWAId"],
    authorityName: json["AuthorityName"],
    phoneNumber: json["PhoneNumber"],
    mobileNumber: json["MobileNumber"],
    emailId: json["EmailId"],
    location: json["Location"],
    certificateNo: json["CertificateNo"],
    isApproved: json["IsApproved"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "RWAId": rwaId,
    "AuthorityName": authorityName,
    "PhoneNumber": phoneNumber,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "Location": location,
    "CertificateNo": certificateNo,
    "IsApproved": isApproved,
  };
}
