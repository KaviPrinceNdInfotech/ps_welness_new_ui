// To parse this JSON data, do
//
//     final vehicletypebycatagaryId = vehicletypebycatagaryIdFromJson(jsonString);

import 'dart:convert';

VehicletypebycatagaryId vehicletypebycatagaryIdFromJson(String str) => VehicletypebycatagaryId.fromJson(json.decode(str));

String vehicletypebycatagaryIdToJson(VehicletypebycatagaryId data) => json.encode(data.toJson());

class VehicletypebycatagaryId {
  VehicletypebycatagaryId({
    this.vehicleDetailes,
  });

  List<VehicleDetaile>? vehicleDetailes;

  factory VehicletypebycatagaryId.fromJson(Map<String, dynamic> json) => VehicletypebycatagaryId(
    vehicleDetailes: json["VehicleDetailes"] == null ? [] : List<VehicleDetaile>.from(json["VehicleDetailes"]!.map((x) => VehicleDetaile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "VehicleDetailes": vehicleDetailes == null ? [] : List<dynamic>.from(vehicleDetailes!.map((x) => x.toJson())),
  };
}

class VehicleDetaile {
  VehicleDetaile({
    this.id,
    this.vehicleTypeName,
  });

  int? id;
  String? vehicleTypeName;

  factory VehicleDetaile.fromJson(Map<String, dynamic> json) => VehicleDetaile(
    id: json["Id"],
    vehicleTypeName: json["VehicleTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "VehicleTypeName": vehicleTypeName,
  };
}
