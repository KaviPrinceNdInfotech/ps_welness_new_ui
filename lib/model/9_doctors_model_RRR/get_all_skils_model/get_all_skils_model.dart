// To parse this JSON data, do
//
//     final getskillsModel = getskillsModelFromJson(jsonString);

import 'dart:convert';

GetskillsModel getskillsModelFromJson(String str) => GetskillsModel.fromJson(json.decode(str));

String getskillsModelToJson(GetskillsModel data) => json.encode(data.toJson());

class GetskillsModel {
  GetskillsModel({
    required this.skills,
  });

  List<SkillModel> skills;

  factory GetskillsModel.fromJson(Map<String, dynamic> json) => GetskillsModel(
    skills: List<SkillModel>.from(json["Skills"].map((x) => SkillModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Skills": List<dynamic>.from(skills.map((x) => x.toJson())),
  };
}

class SkillModel {
  SkillModel({
    required this.id,
    required this.skillName,
  });

  int id;
  String skillName;

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
    id: json["Id"],
    skillName: json["SkillName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "SkillName": skillName,
  };
}
