// To parse this JSON data, do
//
//     final healthCheckupListss = healthCheckupListssFromJson(jsonString);

import 'dart:convert';

HealthCheckupListss healthCheckupListssFromJson(String str) =>
    HealthCheckupListss.fromJson(json.decode(str));

String healthCheckupListssToJson(HealthCheckupListss data) =>
    json.encode(data.toJson());

class HealthCheckupListss {
  final List<HealthCheckupList>? healthCheckupList;
  final String? message;

  HealthCheckupListss({
    this.healthCheckupList,
    this.message,
  });

  factory HealthCheckupListss.fromJson(Map<String, dynamic> json) =>
      HealthCheckupListss(
        healthCheckupList: List<HealthCheckupList>.from(
            json["HealthCheckupList"]
                .map((x) => HealthCheckupList.fromJson(x))),
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "HealthCheckupList":
            List<dynamic>.from(healthCheckupList!.map((x) => x.toJson())),
        "Message": message,
      };
}

class HealthCheckupList {
  final int? id;
  final String? labName;
  final String? mobileNumber;
  final String? cityName;
  final String? locationName;
  final double? testAmount;

  HealthCheckupList({
    this.id,
    this.labName,
    this.mobileNumber,
    this.cityName,
    this.locationName,
    this.testAmount,
  });

  factory HealthCheckupList.fromJson(Map<String, dynamic> json) =>
      HealthCheckupList(
        id: json["Id"],
        labName: json["LabName"],
        mobileNumber: json["MobileNumber"],
        cityName: json["CityName"],
        locationName: json["LocationName"],
        testAmount: json["TestAmount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "MobileNumber": mobileNumber,
        "CityName": cityName,
        "LocationName": locationName,
        "TestAmount": testAmount,
      };
}
