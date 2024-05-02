// To parse this JSON data, do
//
//     final frenchiesYmdwLabModel = frenchiesYmdwLabModelFromJson(jsonString);

import 'dart:convert';

FrenchiesYmdwLabModel frenchiesYmdwLabModelFromJson(String str) =>
    FrenchiesYmdwLabModel.fromJson(json.decode(str));

String frenchiesYmdwLabModelToJson(FrenchiesYmdwLabModel data) =>
    json.encode(data.toJson());

class FrenchiesYmdwLabModel {
  List<LabYmwdReport>? labYmwdReport;

  FrenchiesYmdwLabModel({
    this.labYmwdReport,
  });

  factory FrenchiesYmdwLabModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesYmdwLabModel(
        labYmwdReport: json["LabYMWD_Report"] == null
            ? []
            : List<LabYmwdReport>.from(
                json["LabYMWD_Report"]!.map((x) => LabYmwdReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabYMWD_Report": labYmwdReport == null
            ? []
            : List<dynamic>.from(labYmwdReport!.map((x) => x.toJson())),
      };
}

class LabYmwdReport {
  int? id;
  String? lAbId;
  String? labName;
  String? phoneNumber;
  String? mobileNumber;
  String? emailId;
  String? location;
  String? licenceNumber;
  String? gstNumber;
  String? aadharNumber;
  num? totalAmount;
  bool? isApproved;

  LabYmwdReport({
    this.id,
    this.lAbId,
    this.labName,
    this.phoneNumber,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.licenceNumber,
    this.gstNumber,
    this.aadharNumber,
    this.totalAmount,
    this.isApproved,
  });

  factory LabYmwdReport.fromJson(Map<String, dynamic> json) => LabYmwdReport(
        id: json["Id"],
        lAbId: json["lABId"],
        labName: json["LabName"],
        phoneNumber: json["PhoneNumber"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        location: json["Location"],
        licenceNumber: json["LicenceNumber"],
        gstNumber: json["GSTNumber"],
        aadharNumber: json["AadharNumber"],
        totalAmount: json["TotalAmount"],
        isApproved: json["IsApproved"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "lABId": lAbId,
        "LabName": labName,
        "PhoneNumber": phoneNumber,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "Location": location,
        "LicenceNumber": licenceNumber,
        "GSTNumber": gstNumber,
        "AadharNumber": aadharNumber,
        "TotalAmount": totalAmount,
        "IsApproved": isApproved,
      };
}
