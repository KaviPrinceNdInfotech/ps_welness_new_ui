// To parse this JSON data, do
//
//     final frenchiesDriverDetailModel = frenchiesDriverDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesDriverDetailModel frenchiesDriverDetailModelFromJson(String str) => FrenchiesDriverDetailModel.fromJson(json.decode(str));

String frenchiesDriverDetailModelToJson(FrenchiesDriverDetailModel data) => json.encode(data.toJson());

class FrenchiesDriverDetailModel {
  List<DriverRegDetail>? driverRegDetail;

  FrenchiesDriverDetailModel({
    this.driverRegDetail,
  });

  factory FrenchiesDriverDetailModel.fromJson(Map<String, dynamic> json) => FrenchiesDriverDetailModel(
    driverRegDetail: json["DriverRegDetail"] == null ? [] : List<DriverRegDetail>.from(json["DriverRegDetail"]!.map((x) => DriverRegDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DriverRegDetail": driverRegDetail == null ? [] : List<dynamic>.from(driverRegDetail!.map((x) => x.toJson())),
  };
}

class DriverRegDetail {
  int? id;
  String? driverName;
  String? mobileNumber;
  String? location;
  String? vehicleTypeName;
  String? dlNumber;

  DriverRegDetail({
    this.id,
    this.driverName,
    this.mobileNumber,
    this.location,
    this.vehicleTypeName,
    this.dlNumber,
  });

  factory DriverRegDetail.fromJson(Map<String, dynamic> json) => DriverRegDetail(
    id: json["Id"],
    driverName: json["DriverName"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    vehicleTypeName: json["VehicleTypeName"],
    dlNumber: json["DlNumber"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DriverName": driverName,
    "MobileNumber": mobileNumber,
    "Location": location,
    "VehicleTypeName": vehicleTypeName,
    "DlNumber": dlNumber,
  };
}
