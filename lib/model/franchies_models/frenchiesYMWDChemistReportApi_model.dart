// To parse this JSON data, do
//
//     final frenchiesYmdwChemistModel = frenchiesYmdwChemistModelFromJson(jsonString);

import 'dart:convert';

FrenchiesYmdwChemistModel frenchiesYmdwChemistModelFromJson(String str) => FrenchiesYmdwChemistModel.fromJson(json.decode(str));

String frenchiesYmdwChemistModelToJson(FrenchiesYmdwChemistModel data) => json.encode(data.toJson());

class FrenchiesYmdwChemistModel {
  List<ChemistYmwdReport>? chemistYmwdReport;

  FrenchiesYmdwChemistModel({
    this.chemistYmwdReport,
  });

  factory FrenchiesYmdwChemistModel.fromJson(Map<String, dynamic> json) => FrenchiesYmdwChemistModel(
    chemistYmwdReport: json["ChemistYMWD_Report"] == null ? [] : List<ChemistYmwdReport>.from(json["ChemistYMWD_Report"]!.map((x) => ChemistYmwdReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ChemistYMWD_Report": chemistYmwdReport == null ? [] : List<dynamic>.from(chemistYmwdReport!.map((x) => x.toJson())),
  };
}

class ChemistYmwdReport {
  int? id;
  String? chemistId;
  String? chemistName;
  String? franchise;
  String? shopName;
  String? mobileNumber;
  String? emailId;
  String? location;
  String? gstNumber;
  String? licenceNumber;
  bool? isApproved;

  ChemistYmwdReport({
    this.id,
    this.chemistId,
    this.chemistName,
    this.franchise,
    this.shopName,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.gstNumber,
    this.licenceNumber,
    this.isApproved,
  });

  factory ChemistYmwdReport.fromJson(Map<String, dynamic> json) => ChemistYmwdReport(
    id: json["Id"],
    chemistId: json["ChemistId"],
    chemistName: json["ChemistName"],
    franchise: json["Franchise"],
    shopName: json["ShopName"],
    mobileNumber: json["MobileNumber"],
    emailId: json["EmailId"],
    location: json["Location"],
    gstNumber: json["GSTNumber"],
    licenceNumber: json["LicenceNumber"],
    isApproved: json["IsApproved"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ChemistId": chemistId,
    "ChemistName": chemistName,
    "Franchise": franchise,
    "ShopName": shopName,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "Location": location,
    "GSTNumber": gstNumber,
    "LicenceNumber": licenceNumber,
    "IsApproved": isApproved,
  };
}
