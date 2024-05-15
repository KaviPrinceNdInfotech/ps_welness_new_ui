// To parse this JSON data, do
//
//     final frenchiesVehicleDetailModel = frenchiesVehicleDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesVehicleDetailModel frenchiesVehicleDetailModelFromJson(String str) =>
    FrenchiesVehicleDetailModel.fromJson(json.decode(str));

String frenchiesVehicleDetailModelToJson(FrenchiesVehicleDetailModel data) =>
    json.encode(data.toJson());

class FrenchiesVehicleDetailModel {
  List<VehicleRegDetail>? vehicleRegDetail;

  FrenchiesVehicleDetailModel({
    this.vehicleRegDetail,
  });

  factory FrenchiesVehicleDetailModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesVehicleDetailModel(
        vehicleRegDetail: json["VehicleRegDetail"] == null
            ? []
            : List<VehicleRegDetail>.from(json["VehicleRegDetail"]!
                .map((x) => VehicleRegDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "VehicleRegDetail": vehicleRegDetail == null
            ? []
            : List<dynamic>.from(vehicleRegDetail!.map((x) => x.toJson())),
      };
}

class VehicleRegDetail {
  int? id;
  String? vehicleNumber;
  String? vehicleOwnerName;
  String? franchise;
  String? vehicleTypeName;
  String? categoryName;
  num? driverCharges;

  VehicleRegDetail({
    this.id,
    this.vehicleNumber,
    this.vehicleOwnerName,
    this.franchise,
    this.vehicleTypeName,
    this.categoryName,
    this.driverCharges,
  });

  factory VehicleRegDetail.fromJson(Map<String, dynamic> json) =>
      VehicleRegDetail(
        id: json["Id"],
        vehicleNumber: json["VehicleNumber"],
        vehicleOwnerName: json["VehicleOwnerName"],
        franchise: json["Franchise"],
        vehicleTypeName: json["VehicleTypeName"],
        categoryName: json["CategoryName"],
        driverCharges: json["DriverCharges"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VehicleNumber": vehicleNumber,
        "VehicleOwnerName": vehicleOwnerName,
        "Franchise": franchise,
        "VehicleTypeName": vehicleTypeName,
        "CategoryName": categoryName,
        "DriverCharges": driverCharges,
      };
}
