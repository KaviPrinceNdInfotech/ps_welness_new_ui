// To parse this JSON data, do
//
//     final getdepartmentmodel = getdepartmentmodelFromJson(jsonString);

import 'dart:convert';

Getdepartmentmodel getdepartmentmodelFromJson(String str) => Getdepartmentmodel.fromJson(json.decode(str));

String getdepartmentmodelToJson(Getdepartmentmodel data) => json.encode(data.toJson());

class Getdepartmentmodel {
  Getdepartmentmodel({
    required this.departments,
  });

  List<DepartmentModel> departments;

  factory Getdepartmentmodel.fromJson(Map<String, dynamic> json) => Getdepartmentmodel(
    departments: List<DepartmentModel>.from(json["Departments"].map((x) => DepartmentModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Departments": List<dynamic>.from(departments.map((x) => x.toJson())),
  };
}

class DepartmentModel {
  DepartmentModel({
    required this.id,
    required this.departmentName,
    required this.isDeleted,
  });

  int id;
  String departmentName;
  bool isDeleted;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
    id: json["Id"],
    departmentName: json["DepartmentName"],
    isDeleted: json["IsDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DepartmentName": departmentName,
    "IsDeleted": isDeleted,
  };
}
