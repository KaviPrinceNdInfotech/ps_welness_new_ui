// To parse this JSON data, do
//
//     final frenchiesVehicleCategoryModel = frenchiesVehicleCategoryModelFromJson(jsonString);

import 'dart:convert';

FrenchiesVehicleCategoryModel frenchiesVehicleCategoryModelFromJson(String str) => FrenchiesVehicleCategoryModel.fromJson(json.decode(str));

String frenchiesVehicleCategoryModelToJson(FrenchiesVehicleCategoryModel data) => json.encode(data.toJson());

class FrenchiesVehicleCategoryModel {
  List<VehicleCatDropdown> vehicleCatDropdown;

  FrenchiesVehicleCategoryModel({
    required this.vehicleCatDropdown,
  });

  factory FrenchiesVehicleCategoryModel.fromJson(Map<String, dynamic> json) => FrenchiesVehicleCategoryModel(
    vehicleCatDropdown: List<VehicleCatDropdown>.from(json["VehicleCatDropdown"].map((x) => VehicleCatDropdown.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "VehicleCatDropdown": List<dynamic>.from(vehicleCatDropdown.map((x) => x.toJson())),
  };
}

class VehicleCatDropdown {
  int id;
  String categoryName;

  VehicleCatDropdown({
    required this.id,
    required this.categoryName,
  });

  factory VehicleCatDropdown.fromJson(Map<String, dynamic> json) => VehicleCatDropdown(
    id: json["Id"],
    categoryName: json["CategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CategoryName": categoryName,
  };
}
