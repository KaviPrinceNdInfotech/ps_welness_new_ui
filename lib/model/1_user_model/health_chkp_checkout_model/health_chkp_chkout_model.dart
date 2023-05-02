// To parse this JSON data, do
//
//     final healthCheckupcheckout = healthCheckupcheckoutFromJson(jsonString);

import 'dart:convert';

HealthCheckupcheckout healthCheckupcheckoutFromJson(String str) =>
    HealthCheckupcheckout.fromJson(json.decode(str));

String healthCheckupcheckoutToJson(HealthCheckupcheckout data) =>
    json.encode(data.toJson());

class HealthCheckupcheckout {
  final int? id;
  final String? labName;
  final String? healthType;
  final double? testAmount;
  final DateTime? testDate;
  final String? slotTime;

  HealthCheckupcheckout({
    this.id,
    this.labName,
    this.healthType,
    this.testAmount,
    this.testDate,
    this.slotTime,
  });

  factory HealthCheckupcheckout.fromJson(Map<String, dynamic> json) =>
      HealthCheckupcheckout(
        id: json["Id"],
        labName: json["LabName"],
        healthType: json["HealthType"],
        testAmount: json["TestAmount"],
        testDate: DateTime.parse(json["TestDate"]),
        slotTime: json["SlotTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "HealthType": healthType,
        "TestAmount": testAmount,
        "TestDate": testDate!.toIso8601String(),
        "SlotTime": slotTime,
      };
}
