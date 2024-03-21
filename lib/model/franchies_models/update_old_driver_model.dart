// To parse this JSON data, do
//
//     final driverListUpdatedModel = driverListUpdatedModelFromJson(jsonString);

import 'dart:convert';

DriverListUpdatedModel driverListUpdatedModelFromJson(String str) =>
    DriverListUpdatedModel.fromJson(json.decode(str));

String driverListUpdatedModelToJson(DriverListUpdatedModel data) =>
    json.encode(data.toJson());

class DriverListUpdatedModel {
  List<Driver> drivers;

  DriverListUpdatedModel({
    required this.drivers,
  });

  factory DriverListUpdatedModel.fromJson(Map<String, dynamic> json) =>
      DriverListUpdatedModel(
        drivers:
            List<Driver>.from(json["Drivers"].map((x) => Driver.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Drivers": List<dynamic>.from(drivers.map((x) => x.toJson())),
      };
}

class Driver {
  int id;
  String driverName;

  Driver({
    required this.id,
    required this.driverName,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["Id"],
        driverName: json["DriverName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverName": driverName,
      };
}
