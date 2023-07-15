// To parse this JSON data, do
//
//     final spealistFranchies = spealistFranchiesFromJson(jsonString);

import 'dart:convert';

SpealistFranchies? spealistFranchiesFromJson(String str) =>
    SpealistFranchies.fromJson(json.decode(str));

String spealistFranchiesToJson(SpealistFranchies? data) =>
    json.encode(data!.toJson());

class SpealistFranchies {
  SpealistFranchies({
    this.specialist,
  });

  List<Specialist?>? specialist;

  factory SpealistFranchies.fromJson(Map<String, dynamic> json) =>
      SpealistFranchies(
        specialist: json["Specialist"] == null
            ? []
            : List<Specialist?>.from(
                json["Specialist"]!.map((x) => Specialist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Specialist": specialist == null
            ? []
            : List<dynamic>.from(specialist!.map((x) => x!.toJson())),
      };
}

class Specialist {
  Specialist({
    this.id,
    this.specialistName,
    this.departmentId,
    this.isDeleted,
    this.departmentName,
    this.departments,
  });

  int? id;
  String? specialistName;
  int? departmentId;
  bool? isDeleted;
  dynamic departmentName;
  dynamic departments;

  factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
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
