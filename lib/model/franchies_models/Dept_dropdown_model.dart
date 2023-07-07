// To parse this JSON data, do
//
//     final departmentsDwModel = departmentsDwModelFromJson(jsonString);

import 'dart:convert';

DepartmentsDwModel departmentsDwModelFromJson(String str) => DepartmentsDwModel.fromJson(json.decode(str));

String departmentsDwModelToJson(DepartmentsDwModel data) => json.encode(data.toJson());

class DepartmentsDwModel {
  List<FranchiseDepartment> franchiseDepartment;

  DepartmentsDwModel({
    required this.franchiseDepartment,
  });

  factory DepartmentsDwModel.fromJson(Map<String, dynamic> json) => DepartmentsDwModel(
    franchiseDepartment: List<FranchiseDepartment>.from(json["Franchise_Department"].map((x) => FranchiseDepartment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Franchise_Department": List<dynamic>.from(franchiseDepartment.map((x) => x.toJson())),
  };
}

class FranchiseDepartment {
  int id;
  String departmentName;
  bool isDeleted;

  FranchiseDepartment({
    required this.id,
    required this.departmentName,
    required this.isDeleted,
  });

  factory FranchiseDepartment.fromJson(Map<String, dynamic> json) => FranchiseDepartment(
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





//
// // To parse this JSON data, do
// //
// //     final departmentsDwModel = departmentsDwModelFromJson(jsonString);
//
// import 'dart:convert';
//
// DepartmentsDwModel departmentsDwModelFromJson(String str) => DepartmentsDwModel.fromJson(json.decode(str));
//
// String departmentsDwModelToJson(DepartmentsDwModel data) => json.encode(data.toJson());
//
// class DepartmentsDwModel {
//   List<DepartmentDName> departmentName;
//
//   DepartmentsDwModel({
//     required this.departmentName,
//   });
//
//   factory DepartmentsDwModel.fromJson(Map<String, dynamic> json) => DepartmentsDwModel(
//     departmentName: List<DepartmentDName>.from(json["DepartmentName"].map((x) => DepartmentDName.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "DepartmentName": List<dynamic>.from(departmentName.map((x) => x.toJson())),
//   };
// }
//
// class DepartmentDName {
//   int id;
//   String departmentName;
//
//   DepartmentDName({
//     required this.id,
//     required this.departmentName,
//   });
//
//   factory DepartmentDName.fromJson(Map<String, dynamic> json) => DepartmentDName(
//     id: json["Id"],
//     departmentName: json["DepartmentName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "DepartmentName": departmentName,
//   };
// }
