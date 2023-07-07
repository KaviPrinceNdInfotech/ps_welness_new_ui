// To parse this JSON data, do
//
//     final frenchiesYmdwVehicleModel = frenchiesYmdwVehicleModelFromJson(jsonString);

import 'dart:convert';

FrenchiesYmdwVehicleModel frenchiesYmdwVehicleModelFromJson(String str) => FrenchiesYmdwVehicleModel.fromJson(json.decode(str));

String frenchiesYmdwVehicleModelToJson(FrenchiesYmdwVehicleModel data) => json.encode(data.toJson());

class FrenchiesYmdwVehicleModel {
  List<VehicleYmwdReport>? vehicleYmwdReport;

  FrenchiesYmdwVehicleModel({
    this.vehicleYmwdReport,
  });

  factory FrenchiesYmdwVehicleModel.fromJson(Map<String, dynamic> json) => FrenchiesYmdwVehicleModel(
    vehicleYmwdReport: json["VehicleYMWD_Report"] == null ? [] : List<VehicleYmwdReport>.from(json["VehicleYMWD_Report"]!.map((x) => VehicleYmwdReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "VehicleYMWD_Report": vehicleYmwdReport == null ? [] : List<dynamic>.from(vehicleYmwdReport!.map((x) => x.toJson())),
  };
}

class VehicleYmwdReport {
  int? id;
  String? vehicleNumber;
  String? vehicleOwnerName;
  String? franchise;
  String? type;
  String? categoryName;
  num? driverCharges;

  VehicleYmwdReport({
    this.id,
    this.vehicleNumber,
    this.vehicleOwnerName,
    this.franchise,
    this.type,
    this.categoryName,
    this.driverCharges,
  });

  factory VehicleYmwdReport.fromJson(Map<String, dynamic> json) => VehicleYmwdReport(
    id: json["Id"],
    vehicleNumber: json["VehicleNumber"],
    vehicleOwnerName: json["VehicleOwnerName"],
    franchise: json["Franchise"],
    type: json["Type"],
    categoryName: json["CategoryName"],
    driverCharges: json["DriverCharges"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "VehicleNumber": vehicleNumber,
    "VehicleOwnerName": vehicleOwnerName,
    "Franchise": franchise,
    "Type": type,
    "CategoryName": categoryName,
    "DriverCharges": driverCharges,
  };
}