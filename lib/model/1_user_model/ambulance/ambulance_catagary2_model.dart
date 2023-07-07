// To parse this JSON data, do
//
//     final ambulancecatagarybyId = ambulancecatagarybyIdFromJson(jsonString);

import 'dart:convert';

AmbulancecatagarybyId ambulancecatagarybyIdFromJson(String str) => AmbulancecatagarybyId.fromJson(json.decode(str));

String ambulancecatagarybyIdToJson(AmbulancecatagarybyId data) => json.encode(data.toJson());

class AmbulancecatagarybyId {
  AmbulancecatagarybyId({
    this.message,
    this.status,
    this.vehicle,
  });

  dynamic message;
  int? status;
  List<Vehicle>? vehicle;

  factory AmbulancecatagarybyId.fromJson(Map<String, dynamic> json) => AmbulancecatagarybyId(
    message: json["Message"],
    status: json["Status"],
    vehicle: json["Vehicle"] == null ? [] : List<Vehicle>.from(json["Vehicle"]!.map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Status": status,
    "Vehicle": vehicle == null ? [] : List<dynamic>.from(vehicle!.map((x) => x.toJson())),
  };
}

class Vehicle {
  Vehicle({
    this.id,
    this.categoryName,
  });

  int? id;
  String? categoryName;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["Id"],
    categoryName: json["CategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CategoryName": categoryName,
  };
}
