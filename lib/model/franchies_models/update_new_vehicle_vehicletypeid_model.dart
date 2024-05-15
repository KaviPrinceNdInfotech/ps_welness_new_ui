// To parse this JSON data, do
//
//     final vehicleTypeIddd = vehicleTypeIdddFromJson(jsonString);

import 'dart:convert';

VehicleTypeIddd vehicleTypeIdddFromJson(String str) =>
    VehicleTypeIddd.fromJson(json.decode(str));

String vehicleTypeIdddToJson(VehicleTypeIddd data) =>
    json.encode(data.toJson());

class VehicleTypeIddd {
  List<NewVehicleType> vehicleType;

  VehicleTypeIddd({
    required this.vehicleType,
  });

  factory VehicleTypeIddd.fromJson(Map<String, dynamic> json) =>
      VehicleTypeIddd(
        vehicleType: List<NewVehicleType>.from(
            json["VehicleType"].map((x) => NewVehicleType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "VehicleType": List<dynamic>.from(vehicleType.map((x) => x.toJson())),
      };
}

class NewVehicleType {
  int id;
  String vehicleTypeName;

  NewVehicleType({
    required this.id,
    required this.vehicleTypeName,
  });

  factory NewVehicleType.fromJson(Map<String, dynamic> json) => NewVehicleType(
        id: json["Id"],
        vehicleTypeName: json["VehicleTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VehicleTypeName": vehicleTypeName,
      };
}
