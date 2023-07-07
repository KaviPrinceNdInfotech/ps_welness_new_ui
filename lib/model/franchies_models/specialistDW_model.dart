// To parse this JSON data, do
//
//     final specialistDwModel = specialistDwModelFromJson(jsonString);

import 'dart:convert';

SpecialistDwModel specialistDwModelFromJson(String str) => SpecialistDwModel.fromJson(json.decode(str));

String specialistDwModelToJson(SpecialistDwModel data) => json.encode(data.toJson());

class SpecialistDwModel {
  List<FranchiseSpecialist> franchiseSpecialist;

  SpecialistDwModel({
    required this.franchiseSpecialist,
  });

  factory SpecialistDwModel.fromJson(Map<String, dynamic> json) => SpecialistDwModel(
    franchiseSpecialist: List<FranchiseSpecialist>.from(json["Franchise_Specialist"].map((x) => FranchiseSpecialist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Franchise_Specialist": List<dynamic>.from(franchiseSpecialist.map((x) => x.toJson())),
  };
}

class FranchiseSpecialist {
  int id;
  String specialistName;
  int departmentId;
  bool isDeleted;

  FranchiseSpecialist({
    required this.id,
    required this.specialistName,
    required this.departmentId,
    required this.isDeleted,
  });

  factory FranchiseSpecialist.fromJson(Map<String, dynamic> json) => FranchiseSpecialist(
    id: json["Id"],
    specialistName: json["SpecialistName"],
    departmentId: json["Department_Id"],
    isDeleted: json["IsDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "SpecialistName": specialistName,
    "Department_Id": departmentId,
    "IsDeleted": isDeleted,
  };
}
