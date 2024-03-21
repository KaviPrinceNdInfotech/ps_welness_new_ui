// To parse this JSON data, do
//
//     final vehicleNumberListdropdown = vehicleNumberListdropdownFromJson(jsonString);

import 'dart:convert';

VehicleNumberListdropdown vehicleNumberListdropdownFromJson(String str) =>
    VehicleNumberListdropdown.fromJson(json.decode(str));

String vehicleNumberListdropdownToJson(VehicleNumberListdropdown data) =>
    json.encode(data.toJson());

class VehicleNumberListdropdown {
  List<VehicleNumberListdrop> vehicleNumberList;

  VehicleNumberListdropdown({
    required this.vehicleNumberList,
  });

  factory VehicleNumberListdropdown.fromJson(Map<String, dynamic> json) =>
      VehicleNumberListdropdown(
        vehicleNumberList: List<VehicleNumberListdrop>.from(
            json["VehicleNumberList"]
                .map((x) => VehicleNumberListdrop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "VehicleNumberList":
            List<dynamic>.from(vehicleNumberList.map((x) => x.toJson())),
      };
}

class VehicleNumberListdrop {
  int id;
  String vehicleNumber;
  dynamic driverName;

  VehicleNumberListdrop({
    required this.id,
    required this.vehicleNumber,
    required this.driverName,
  });

  factory VehicleNumberListdrop.fromJson(Map<String, dynamic> json) =>
      VehicleNumberListdrop(
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
