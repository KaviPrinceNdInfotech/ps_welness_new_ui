// To parse this JSON data, do
//
//     final frenchiesChemistDetailModel = frenchiesChemistDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesChemistDetailModel frenchiesChemistDetailModelFromJson(String str) => FrenchiesChemistDetailModel.fromJson(json.decode(str));

String frenchiesChemistDetailModelToJson(FrenchiesChemistDetailModel data) => json.encode(data.toJson());

class FrenchiesChemistDetailModel {
  List<ChemistRegDetail>? chemistRegDetail;

  FrenchiesChemistDetailModel({
    this.chemistRegDetail,
  });

  factory FrenchiesChemistDetailModel.fromJson(Map<String, dynamic> json) => FrenchiesChemistDetailModel(
    chemistRegDetail: json["ChemistRegDetail"] == null ? [] : List<ChemistRegDetail>.from(json["ChemistRegDetail"]!.map((x) => ChemistRegDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ChemistRegDetail": chemistRegDetail == null ? [] : List<dynamic>.from(chemistRegDetail!.map((x) => x.toJson())),
  };
}

class ChemistRegDetail {
  int? id;
  String? chemistId;
  String? chemistName;
  int? vendorId;
  String? shopName;
  String? mobileNumber;
  String? emailId;
  String? location;
  String? gstNumber;
  String? licenceNumber;
  bool? isApproved;

  ChemistRegDetail({
    this.id,
    this.chemistId,
    this.chemistName,
    this.vendorId,
    this.shopName,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.gstNumber,
    this.licenceNumber,
    this.isApproved,
  });

  factory ChemistRegDetail.fromJson(Map<String, dynamic> json) => ChemistRegDetail(
    id: json["Id"],
    chemistId: json["ChemistId"],
    chemistName: json["ChemistName"],
    vendorId: json["Vendor_Id"],
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
    "Vendor_Id": vendorId,
    "ShopName": shopName,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "Location": location,
    "GSTNumber": gstNumber,
    "LicenceNumber": licenceNumber,
    "IsApproved": isApproved,
  };
}
