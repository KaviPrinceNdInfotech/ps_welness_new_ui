// To parse this JSON data, do
//
//     final frenchiesDepartmentListModel = frenchiesDepartmentListModelFromJson(jsonString);

import 'dart:convert';

FrenchiesDepartmentListModel frenchiesDepartmentListModelFromJson(String str) => FrenchiesDepartmentListModel.fromJson(json.decode(str));

String frenchiesDepartmentListModelToJson(FrenchiesDepartmentListModel data) => json.encode(data.toJson());

class FrenchiesDepartmentListModel {
  List<DeptList>? deptList;

  FrenchiesDepartmentListModel({
    this.deptList,
  });

  factory FrenchiesDepartmentListModel.fromJson(Map<String, dynamic> json) => FrenchiesDepartmentListModel(
    deptList: json["DeptList"] == null ? [] : List<DeptList>.from(json["DeptList"]!.map((x) => DeptList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DeptList": deptList == null ? [] : List<dynamic>.from(deptList!.map((x) => x.toJson())),
  };
}

class DeptList {
  int? id;
  String? departmentName;

  DeptList({
    this.id,
    this.departmentName,
  });

  factory DeptList.fromJson(Map<String, dynamic> json) => DeptList(
    id: json["Id"],
    departmentName: json["DepartmentName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DepartmentName": departmentName,
  };
}
