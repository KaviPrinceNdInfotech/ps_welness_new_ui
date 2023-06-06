// To parse this JSON data, do
//
//     final nurseaboutusModel = nurseaboutusModelFromJson(jsonString);

import 'dart:convert';

NurseaboutusModel nurseaboutusModelFromJson(String str) =>
    NurseaboutusModel.fromJson(json.decode(str));

String nurseaboutusModelToJson(NurseaboutusModel data) =>
    json.encode(data.toJson());

class NurseaboutusModel {
  int? id;
  String? about;

  NurseaboutusModel({
    this.id,
    this.about,
  });

  factory NurseaboutusModel.fromJson(Map<String, dynamic> json) =>
      NurseaboutusModel(
        id: json["Id"],
        about: json["About"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "About": about,
      };
}
