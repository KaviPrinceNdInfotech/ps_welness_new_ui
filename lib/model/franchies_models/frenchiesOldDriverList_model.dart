// To parse this JSON data, do
//
//     final frenchiesOldDriverListModel = frenchiesOldDriverListModelFromJson(jsonString);

import 'dart:convert';

FrenchiesOldDriverListModel frenchiesOldDriverListModelFromJson(String str) => FrenchiesOldDriverListModel.fromJson(json.decode(str));

String frenchiesOldDriverListModelToJson(FrenchiesOldDriverListModel data) => json.encode(data.toJson());

class FrenchiesOldDriverListModel {
  List<GetOldDriver>? getOldDriver;

  FrenchiesOldDriverListModel({
    this.getOldDriver,
  });

  factory FrenchiesOldDriverListModel.fromJson(Map<String, dynamic> json) => FrenchiesOldDriverListModel(
    getOldDriver: json["GetOldDriver"] == null ? [] : List<GetOldDriver>.from(json["GetOldDriver"]!.map((x) => GetOldDriver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "GetOldDriver": getOldDriver == null ? [] : List<dynamic>.from(getOldDriver!.map((x) => x.toJson())),
  };
}

class GetOldDriver {
  int? id;
  int? driverId;
  String? vehicleNumber;
  String? driverName;

  GetOldDriver({
    this.id,
    this.driverId,
    this.vehicleNumber,
    this.driverName,
  });

  factory GetOldDriver.fromJson(Map<String, dynamic> json) => GetOldDriver(
    id: json["Id"],
    driverId: json["Driver_Id"],
    vehicleNumber: json["VehicleNumber"],
    driverName: json["DriverName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Driver_Id": driverId,
    "VehicleNumber": vehicleNumber,
    "DriverName": driverName,
  };
}
