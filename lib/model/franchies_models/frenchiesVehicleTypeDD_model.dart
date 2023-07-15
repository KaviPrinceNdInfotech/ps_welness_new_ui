// To parse this JSON data, do
//
//     final frenchiesVehicleTypeModel = frenchiesVehicleTypeModelFromJson(jsonString);

import 'dart:convert';

FrenchiesVehicleTypeModel frenchiesVehicleTypeModelFromJson(String str) => FrenchiesVehicleTypeModel.fromJson(json.decode(str));

String frenchiesVehicleTypeModelToJson(FrenchiesVehicleTypeModel data) => json.encode(data.toJson());

class FrenchiesVehicleTypeModel {
  List<VehicleTypeName> vehicleTypeName;

  FrenchiesVehicleTypeModel({
    required this.vehicleTypeName,
  });

  factory FrenchiesVehicleTypeModel.fromJson(Map<String, dynamic> json) => FrenchiesVehicleTypeModel(
    vehicleTypeName: List<VehicleTypeName>.from(json["VehicleTypeName"].map((x) => VehicleTypeName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "VehicleTypeName": List<dynamic>.from(vehicleTypeName.map((x) => x.toJson())),
  };
}

class VehicleTypeName {
  int id;
  String vehicleTypeName;

  VehicleTypeName({
    required this.id,
    required this.vehicleTypeName,
  });

  factory VehicleTypeName.fromJson(Map<String, dynamic> json) => VehicleTypeName(
    id: json["Id"],
    vehicleTypeName: json["VehicleTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "VehicleTypeName": vehicleTypeName,
  };
}
