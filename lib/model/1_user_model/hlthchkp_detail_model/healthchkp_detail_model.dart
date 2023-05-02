// To parse this JSON data, do
//
//     final healthCheckupcheDetail = healthCheckupcheDetailFromJson(jsonString);

import 'dart:convert';

HealthCheckupcheDetail healthCheckupcheDetailFromJson(String str) =>
    HealthCheckupcheDetail.fromJson(json.decode(str));

String healthCheckupcheDetailToJson(HealthCheckupcheDetail data) =>
    json.encode(data.toJson());

class HealthCheckupcheDetail {
  final int? id;
  final String? labName;
  final String? locationName;
  final String? year;
  final String? about;
  final String? healthType;

  HealthCheckupcheDetail({
    this.id,
    this.labName,
    this.locationName,
    this.year,
    this.about,
    this.healthType,
  });

  factory HealthCheckupcheDetail.fromJson(Map<String, dynamic> json) =>
      HealthCheckupcheDetail(
        id: json["Id"],
        labName: json["LabName"],
        locationName: json["LocationName"],
        year: json["year"],
        about: json["About"],
        healthType: json["HealthType"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "LocationName": locationName,
        "year": year,
        "About": about,
        "HealthType": healthType,
      };
}
