// To parse this JSON data, do
//
//     final vehicleType = vehicleTypeFromJson(jsonString);

import 'dart:convert';

VehicleType vehicleTypeFromJson(String str) =>
    VehicleType.fromJson(json.decode(str));

String vehicleTypeToJson(VehicleType data) => json.encode(data.toJson());

class VehicleType {
  List<VehicleTypeElement>? vehicleType;

  VehicleType({
    this.vehicleType,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
        vehicleType: json["VehicleType"] == null
            ? []
            : List<VehicleTypeElement>.from(json["VehicleType"]!
                .map((x) => VehicleTypeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "VehicleType": vehicleType == null
            ? []
            : List<dynamic>.from(vehicleType!.map((x) => x.toJson())),
      };
}

class VehicleTypeElement {
  int? id;
  String? vehicleTypeName;

  VehicleTypeElement({
    this.id,
    this.vehicleTypeName,
  });

  factory VehicleTypeElement.fromJson(Map<String, dynamic> json) =>
      VehicleTypeElement(
        id: json["Id"],
        vehicleTypeName: json["VehicleTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VehicleTypeName": vehicleTypeName,
      };
}
