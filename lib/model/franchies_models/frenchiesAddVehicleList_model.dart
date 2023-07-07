// To parse this JSON data, do
//
//     final frenchiesAddVehicleList = frenchiesAddVehicleListFromJson(jsonString);

import 'dart:convert';

FrenchiesAddVehicleListModel frenchiesAddVehicleListFromJson(String str) => FrenchiesAddVehicleListModel.fromJson(json.decode(str));

String frenchiesAddVehicleListToJson(FrenchiesAddVehicleListModel data) => json.encode(data.toJson());

class FrenchiesAddVehicleListModel {
  List<VehicleList>? vehicleList;
  FrenchiesAddVehicleListModel({
    this.vehicleList,
  });
  factory FrenchiesAddVehicleListModel.fromJson(Map<String, dynamic> json) => FrenchiesAddVehicleListModel(
    vehicleList: json["VehicleList"] == null ? [] : List<VehicleList>.from(json["VehicleList"]!.map((x) => VehicleList.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "VehicleList": vehicleList == null ? [] : List<dynamic>.from(vehicleList!.map((x) => x.toJson())),
  };
}
class VehicleList {
  int? id;
  String? categoryName;
  String? vehicleTypeName;
  String? status;

  VehicleList({
    this.id,
    this.categoryName,
    this.vehicleTypeName,
    this.status,
  });

  factory VehicleList.fromJson(Map<String, dynamic> json) => VehicleList(
    id: json["Id"],
    categoryName: json["CategoryName"],
    vehicleTypeName: json["VehicleTypeName"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CategoryName": categoryName,
    "VehicleTypeName": vehicleTypeName,
    "Status": status,
  };
}
