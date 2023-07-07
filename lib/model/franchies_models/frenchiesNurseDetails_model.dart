// To parse this JSON data, do
//
//     final frenchiesNurseDetailModel = frenchiesNurseDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesNurseDetailModel frenchiesNurseDetailModelFromJson(String str) => FrenchiesNurseDetailModel.fromJson(json.decode(str));

String frenchiesNurseDetailModelToJson(FrenchiesNurseDetailModel data) => json.encode(data.toJson());

class FrenchiesNurseDetailModel {
  List<NurseRegDetail>? nurseRegDetail;

  FrenchiesNurseDetailModel({
    this.nurseRegDetail,
  });

  factory FrenchiesNurseDetailModel.fromJson(Map<String, dynamic> json) => FrenchiesNurseDetailModel(
    nurseRegDetail: json["NurseRegDetail"] == null ? [] : List<NurseRegDetail>.from(json["NurseRegDetail"]!.map((x) => NurseRegDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "NurseRegDetail": nurseRegDetail == null ? [] : List<dynamic>.from(nurseRegDetail!.map((x) => x.toJson())),
  };
}

class NurseRegDetail {
  int? id;
  String? nurseId;
  String? nurseName;
  String? nurseTypeName;
  String? vendorName;
  String? mobileNumber;
  String? emailId;
  String? location;
  String? certificateNumber;
  bool? isApproved;

  NurseRegDetail({
    this.id,
    this.nurseId,
    this.nurseName,
    this.nurseTypeName,
    this.vendorName,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.certificateNumber,
    this.isApproved,
  });

  factory NurseRegDetail.fromJson(Map<String, dynamic> json) => NurseRegDetail(
    id: json["Id"],
    nurseId: json["NurseId"],
    nurseName: json["NurseName"],
    nurseTypeName: json["NurseTypeName"],
    vendorName: json["VendorName"],
    mobileNumber: json["MobileNumber"],
    emailId: json["EmailId"],
    location: json["Location"],
    certificateNumber: json["CertificateNumber"],
    isApproved: json["IsApproved"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "NurseId": nurseId,
    "NurseName": nurseName,
    "NurseTypeName": nurseTypeName,
    "VendorName": vendorName,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "Location": location,
    "CertificateNumber": certificateNumber,
    "IsApproved": isApproved,
  };
}
