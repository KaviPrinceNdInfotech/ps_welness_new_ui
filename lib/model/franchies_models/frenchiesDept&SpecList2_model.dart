// To parse this JSON data, do
//
//     final deptSpecListModel = deptSpecListModelFromJson(jsonString);

import 'dart:convert';

DeptSpecList2Model deptSpecListModelFromJson(String str) => DeptSpecList2Model.fromJson(json.decode(str));

String deptSpecListModelToJson(DeptSpecList2Model data) => json.encode(data.toJson());

class DeptSpecList2Model {
  List<DeptspecList>? deptspecList;

  DeptSpecList2Model({
    this.deptspecList,
  });

  factory DeptSpecList2Model.fromJson(Map<String, dynamic> json) => DeptSpecList2Model(
    deptspecList: json["DeptspecList"] == null ? [] : List<DeptspecList>.from(json["DeptspecList"]!.map((x) => DeptspecList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DeptspecList": deptspecList == null ? [] : List<dynamic>.from(deptspecList!.map((x) => x.toJson())),
  };
}

class DeptspecList {
  int? id;
  String? departmentName;
  String? specialistName;
  String? status;

  DeptspecList({
    this.id,
    this.departmentName,
    this.specialistName,
    this.status,
  });

  factory DeptspecList.fromJson(Map<String, dynamic> json) => DeptspecList(
    id: json["Id"],
    departmentName: json["DepartmentName"],
    specialistName: json["SpecialistName"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DepartmentName": departmentName,
    "SpecialistName": specialistName,
    "Status": status,
  };
}
