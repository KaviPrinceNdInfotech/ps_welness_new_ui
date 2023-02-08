// To parse this JSON data, do
//
//     final healthCheckupList = healthCheckupListFromJson(jsonString);

import 'dart:convert';

HealthCheckupList healthCheckupListFromJson(String str) =>
    HealthCheckupList.fromJson(json.decode(str));

String healthCheckupListToJson(HealthCheckupList data) =>
    json.encode(data.toJson());

class HealthCheckupList {
  HealthCheckupList({
    this.healthCheckupList,
    required this.viewMoreHealth,
    required this.status,
    required this.message,
  });

  dynamic healthCheckupList;
  List<ViewMoreHealth> viewMoreHealth;
  int status;
  String message;

  factory HealthCheckupList.fromJson(Map<String, dynamic> json) =>
      HealthCheckupList(
        healthCheckupList: json["HealthCheckupList"],
        viewMoreHealth: List<ViewMoreHealth>.from(
            json["ViewMoreHealth"].map((x) => ViewMoreHealth.fromJson(x))),
        status: json["Status"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "HealthCheckupList": healthCheckupList,
        "ViewMoreHealth":
            List<dynamic>.from(viewMoreHealth.map((x) => x.toJson())),
        "Status": status,
        "Message": message,
      };
}

class ViewMoreHealth {
  ViewMoreHealth({
    required this.id,
    required this.packageId,
    required this.testAmt,
    required this.labName,
  });

  int id;
  int packageId;
  double testAmt;
  String labName;

  factory ViewMoreHealth.fromJson(Map<String, dynamic> json) => ViewMoreHealth(
        id: json["Id"],
        packageId: json["PackageId"],
        testAmt: json["TestAmt"],
        labName: json["LabName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PackageId": packageId,
        "TestAmt": testAmt,
        "LabName": labName,
      };
}
