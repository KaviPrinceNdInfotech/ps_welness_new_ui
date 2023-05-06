// To parse this JSON data, do
//
//     final driverAppoinmentDetail = driverAppoinmentDetailFromJson(jsonString);

import 'dart:convert';

List<DriverAppoinmentDetailModel> driverAppoinmentDetailFromJson(String str) => List<DriverAppoinmentDetailModel>.from(json.decode(str).map((x) => DriverAppoinmentDetailModel.fromJson(x)));

String driverAppoinmentDetailToJson(List<DriverAppoinmentDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverAppoinmentDetailModel {
  DriverAppoinmentDetailModel({
    this.id,
    this.driverName,
    this.vehicleName,
    this.location,
    this.dlImage,
    this.joiningDate,
  });

  int? id;
  String? driverName;
  String? vehicleName;
  String? location;
  String? dlImage;
  DateTime? joiningDate;

  factory DriverAppoinmentDetailModel.fromJson(Map<String, dynamic> json) => DriverAppoinmentDetailModel(
    id: json["Id"],
    driverName: json["DriverName"],
    vehicleName: json["VehicleName"],
    location: json["Location"],
    dlImage: json["DlImage"],
    joiningDate: json["JoiningDate"] == null ? null : DateTime.parse(json["JoiningDate"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DriverName": driverName,
    "VehicleName": vehicleName,
    "Location": location,
    "DlImage": dlImage,
    "JoiningDate": joiningDate?.toIso8601String(),
  };
}
