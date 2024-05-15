// To parse this JSON data, do
//
//     final chemistProfileDetailModel = chemistProfileDetailModelFromJson(jsonString);

import 'dart:convert';

ChemistProfileDetailModel chemistProfileDetailModelFromJson(String str) =>
    ChemistProfileDetailModel.fromJson(json.decode(str));

String chemistProfileDetailModelToJson(ChemistProfileDetailModel data) =>
    json.encode(data.toJson());

class ChemistProfileDetailModel {
  int? id;
  String? chemistName;
  String? emailId;
  String? mobileNumber;
  String? location;
  String? stateName;
  String? cityname;
  String? pinCode;
  num? stateMasterId;
  num? cityMasterId;

  ChemistProfileDetailModel({
    this.id,
    this.chemistName,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.stateName,
    this.cityname,
    this.pinCode,
    this.stateMasterId,
    this.cityMasterId,
  });

  factory ChemistProfileDetailModel.fromJson(Map<String, dynamic> json) =>
      ChemistProfileDetailModel(
        id: json["Id"],
        chemistName: json["ChemistName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        stateName: json["StateName"],
        cityname: json["cityname"],
        pinCode: json["PinCode"],
        stateMasterId: json["StateMaster_Id"],
        cityMasterId: json["CityMaster_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ChemistName": chemistName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "StateName": stateName,
        "cityname": cityname,
        "PinCode": pinCode,
        "StateMaster_Id": stateMasterId,
        "CityMaster_Id": cityMasterId,
      };
}
