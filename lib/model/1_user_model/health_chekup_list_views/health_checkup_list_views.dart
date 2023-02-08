// To parse this JSON data, do
//
//     final healthCheckupListss = healthCheckupListssFromJson(jsonString);

import 'dart:convert';

HealthCheckupListss healthCheckupListssFromJson(String str) =>
    HealthCheckupListss.fromJson(json.decode(str));

String healthCheckupListssToJson(HealthCheckupListss data) =>
    json.encode(data.toJson());

class HealthCheckupListss {
  HealthCheckupListss({
    required this.healthCheckupList,
    this.viewMoreHealth,
    required this.status,
    required this.message,
  });

  List<HealthCheckupList> healthCheckupList;
  dynamic viewMoreHealth;
  int status;
  String message;

  factory HealthCheckupListss.fromJson(Map<String, dynamic> json) =>
      HealthCheckupListss(
        healthCheckupList: List<HealthCheckupList>.from(
            json["HealthCheckupList"]
                .map((x) => HealthCheckupList.fromJson(x))),
        viewMoreHealth: json["ViewMoreHealth"],
        status: json["Status"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "HealthCheckupList":
            List<dynamic>.from(healthCheckupList.map((x) => x.toJson())),
        "ViewMoreHealth": viewMoreHealth,
        "Status": status,
        "Message": message,
      };
}

class HealthCheckupList {
  HealthCheckupList({
    required this.id,
    required this.labName,
    required this.mobileNumber,
    required this.locationName,
    required this.cityName,
    required this.location,
    required this.testAmt,
    required this.packageId,
  });

  int id;
  String labName;
  String mobileNumber;
  String locationName;
  String cityName;
  String location;
  double testAmt;
  int packageId;

  factory HealthCheckupList.fromJson(Map<String, dynamic> json) =>
      HealthCheckupList(
        id: json["Id"],
        labName: json["LabName"],
        mobileNumber: json["MobileNumber"],
        locationName: json["LocationName"],
        cityName: json["CityName"],
        location: json["Location"],
        testAmt: json["TestAmt"],
        packageId: json["PackageId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "MobileNumber": mobileNumber,
        "LocationName": locationName,
        "CityName": cityName,
        "Location": location,
        "TestAmt": testAmt,
        "PackageId": packageId,
      };
}
