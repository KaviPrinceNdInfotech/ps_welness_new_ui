// To parse this JSON data, do
//
//     final chemistProfileDetail = chemistProfileDetailFromJson(jsonString);

import 'dart:convert';

ChemistProfileDetailModel chemistProfileDetailFromJson(String str) => ChemistProfileDetailModel.fromJson(json.decode(str));

String chemistProfileDetailToJson(ChemistProfileDetailModel data) => json.encode(data.toJson());

class ChemistProfileDetailModel {
  String? chemistName;
  String? emailId;
  String? mobileNumber;
  String? location;
  dynamic stateName;
  String? cityname;
  String? pinCode;

  ChemistProfileDetailModel({
    this.chemistName,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.stateName,
    this.cityname,
    this.pinCode,
  });

  factory ChemistProfileDetailModel.fromJson(Map<String, dynamic> json) => ChemistProfileDetailModel(
    chemistName: json["ChemistName"],
    emailId: json["EmailId"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    stateName: json["StateName"],
    cityname: json["cityname"],
    pinCode: json["PinCode"],
  );

  Map<String, dynamic> toJson() => {
    "ChemistName": chemistName,
    "EmailId": emailId,
    "MobileNumber": mobileNumber,
    "Location": location,
    "StateName": stateName,
    "cityname": cityname,
    "PinCode": pinCode,
  };
}
