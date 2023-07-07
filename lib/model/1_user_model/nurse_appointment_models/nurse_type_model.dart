// To parse this JSON data, do
//
//     final nurseList = nurseListFromJson(jsonString);

import 'dart:convert';

NurseList nurseListFromJson(String str) => NurseList.fromJson(json.decode(str));

String nurseListToJson(NurseList data) => json.encode(data.toJson());

class NurseList {
  NurseList({
    required this.nurse,
  });

  List<Nurse> nurse;

  factory NurseList.fromJson(Map<String, dynamic> json) => NurseList(
        nurse: List<Nurse>.from(json["Nurse"].map((x) => Nurse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Nurse": List<dynamic>.from(nurse.map((x) => x.toJson())),
      };
}

class Nurse {
  Nurse({
    required this.id,
    required this.nurseTypeName,
  });

  int id;
  String nurseTypeName;

  factory Nurse.fromJson(Map<String, dynamic> json) => Nurse(
        id: json["Id"],
        nurseTypeName: json["NurseTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NurseTypeName": nurseTypeName,
      };
}
