// To parse this JSON data, do
//
//     final getNurseTypeModel = getNurseTypeModelFromJson(jsonString);

import 'dart:convert';

GetNurseTypeModel getNurseTypeModelFromJson(String str) => GetNurseTypeModel.fromJson(json.decode(str));

String getNurseTypeModelToJson(GetNurseTypeModel data) => json.encode(data.toJson());

class GetNurseTypeModel {
  GetNurseTypeModel({
    required this.nurse,
  });

  List<NurseModels> nurse;

  factory GetNurseTypeModel.fromJson(Map<String, dynamic> json) => GetNurseTypeModel(
    nurse: List<NurseModels>.from(json["Nurse"].map((x) => NurseModels.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Nurse": List<dynamic>.from(nurse.map((x) => x.toJson())),
  };
}

class NurseModels {
  NurseModels({
    required this.id,
    required this.nurseTypeName,
  });

  int id;
  String nurseTypeName;

  factory NurseModels.fromJson(Map<String, dynamic> json) => NurseModels(
    id: json["Id"],
    nurseTypeName: json["NurseTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "NurseTypeName": nurseTypeName,
  };
}
