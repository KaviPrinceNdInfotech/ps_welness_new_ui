// To parse this JSON data, do
//
//     final getspecialistdeptbyId = getspecialistdeptbyIdFromJson(jsonString);

import 'dart:convert';

GetspecialistdeptbyId getspecialistdeptbyIdFromJson(String str) => GetspecialistdeptbyId.fromJson(json.decode(str));

String getspecialistdeptbyIdToJson(GetspecialistdeptbyId data) => json.encode(data.toJson());

class GetspecialistdeptbyId {
  GetspecialistdeptbyId({
    required this.specialist,
  });

  List<SpecialistModel> specialist;

  factory GetspecialistdeptbyId.fromJson(Map<String, dynamic> json) => GetspecialistdeptbyId(
    specialist: List<SpecialistModel>.from(json["Specialist"].map((x) => SpecialistModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Specialist": List<dynamic>.from(specialist.map((x) => x.toJson())),
  };
}

class SpecialistModel {
  SpecialistModel({
    required this.id,
    required this.specialistName,
    required this.departmentId,
    required this.isDeleted,
    this.departmentName,
    this.departments,
  });

  int id;
  String specialistName;
  int departmentId;
  bool isDeleted;
  dynamic departmentName;
  dynamic departments;

  factory SpecialistModel.fromJson(Map<String, dynamic> json) => SpecialistModel(
    id: json["Id"],
    specialistName: json["SpecialistName"],
    departmentId: json["Department_Id"],
    isDeleted: json["IsDeleted"],
    departmentName: json["DepartmentName"],
    departments: json["Departments"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "SpecialistName": specialistName,
    "Department_Id": departmentId,
    "IsDeleted": isDeleted,
    "DepartmentName": departmentName,
    "Departments": departments,
  };
}
