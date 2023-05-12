// To parse this JSON data, do
//
//     final lababoutusModel = lababoutusModelFromJson(jsonString);

import 'dart:convert';

LababoutusModel lababoutusModelFromJson(String str) =>
    LababoutusModel.fromJson(json.decode(str));

String lababoutusModelToJson(LababoutusModel data) =>
    json.encode(data.toJson());

class LababoutusModel {
  String? about;

  LababoutusModel({
    this.about,
  });

  factory LababoutusModel.fromJson(Map<String, dynamic> json) =>
      LababoutusModel(
        about: json["About"],
      );

  Map<String, dynamic> toJson() => {
        "About": about,
      };
}
