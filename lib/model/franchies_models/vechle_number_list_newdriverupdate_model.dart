// To parse this JSON data, do
//
//     final vehicleNumberList = vehicleNumberListFromJson(jsonString);

import 'dart:convert';

VehicleNumberList vehicleNumberListFromJson(String str) =>
    VehicleNumberList.fromJson(json.decode(str));

String vehicleNumberListToJson(VehicleNumberList data) =>
    json.encode(data.toJson());

class VehicleNumberList {
  List<VehicleNumberListElement> vehicleNumberList;

  VehicleNumberList({
    required this.vehicleNumberList,
  });

  factory VehicleNumberList.fromJson(Map<String, dynamic> json) =>
      VehicleNumberList(
        vehicleNumberList: List<VehicleNumberListElement>.from(
            json["VehicleNumberList"]
                .map((x) => VehicleNumberListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "VehicleNumberList":
            List<dynamic>.from(vehicleNumberList.map((x) => x.toJson())),
      };
}

class VehicleNumberListElement {
  int id;
  String vehicleNumber;

  VehicleNumberListElement({
    required this.id,
    required this.vehicleNumber,
  });

  factory VehicleNumberListElement.fromJson(Map<String, dynamic> json) =>
      VehicleNumberListElement(
        id: json["Id"],
        vehicleNumber: json["VehicleNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VehicleNumber": vehicleNumber,
      };
}
