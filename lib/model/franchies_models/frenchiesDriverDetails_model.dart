// To parse this JSON data, do
//
//     final frenchiesDriverDetailModel = frenchiesDriverDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesDriverDetailModel frenchiesDriverDetailModelFromJson(String str) =>
    FrenchiesDriverDetailModel.fromJson(json.decode(str));

String frenchiesDriverDetailModelToJson(FrenchiesDriverDetailModel data) =>
    json.encode(data.toJson());

class FrenchiesDriverDetailModel {
  List<DriverRegDetail>? driverRegDetail;

  FrenchiesDriverDetailModel({
    this.driverRegDetail,
  });

  factory FrenchiesDriverDetailModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesDriverDetailModel(
        driverRegDetail: json["DriverRegDetail"] == null
            ? []
            : List<DriverRegDetail>.from(json["DriverRegDetail"]!
                .map((x) => DriverRegDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DriverRegDetail": driverRegDetail == null
            ? []
            : List<dynamic>.from(driverRegDetail!.map((x) => x.toJson())),
      };
}

class DriverRegDetail {
  int? id;
  String? driverId;
  String? driverName;
  String? mobileNumber;
  String? emailId;
  String? location;
  dynamic vehicleTypeName;
  String? dlNumber;

  DriverRegDetail({
    this.id,
    this.driverId,
    this.driverName,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.vehicleTypeName,
    this.dlNumber,
  });

  factory DriverRegDetail.fromJson(Map<String, dynamic> json) =>
      DriverRegDetail(
        id: json["Id"],
        driverId: json["DriverId"],
        driverName: json["DriverName"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        location: json["Location"],
        vehicleTypeName: json["VehicleTypeName"],
        dlNumber: json["DlNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "Location": location,
        "VehicleTypeName": vehicleTypeName,
        "DlNumber": dlNumber,
      };
}
