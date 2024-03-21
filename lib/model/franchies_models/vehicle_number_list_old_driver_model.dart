// To parse this JSON data, do
//
//     final vehicletypebyVehicleNoId = vehicletypebyVehicleNoIdFromJson(jsonString);

import 'dart:convert';

VehicletypebyVehicleNoId vehicletypebyVehicleNoIdFromJson(String str) =>
    VehicletypebyVehicleNoId.fromJson(json.decode(str));

String vehicletypebyVehicleNoIdToJson(VehicletypebyVehicleNoId data) =>
    json.encode(data.toJson());

class VehicletypebyVehicleNoId {
  List<VehicleNumberdetail> vehicleNumberdetail;

  VehicletypebyVehicleNoId({
    required this.vehicleNumberdetail,
  });

  factory VehicletypebyVehicleNoId.fromJson(Map<String, dynamic> json) =>
      VehicletypebyVehicleNoId(
        vehicleNumberdetail: List<VehicleNumberdetail>.from(
            json["VehicleNumberdetail"]
                .map((x) => VehicleNumberdetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "VehicleNumberdetail":
            List<dynamic>.from(vehicleNumberdetail.map((x) => x.toJson())),
      };
}

class VehicleNumberdetail {
  int id;
  String vehicleNumber;
  String driverName;

  VehicleNumberdetail({
    required this.id,
    required this.vehicleNumber,
    required this.driverName,
  });

  factory VehicleNumberdetail.fromJson(Map<String, dynamic> json) =>
      VehicleNumberdetail(
        id: json["Id"],
        vehicleNumber: json["VehicleNumber"],
        driverName: json["DriverName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VehicleNumber": vehicleNumber,
        "DriverName": driverName,
      };
}
