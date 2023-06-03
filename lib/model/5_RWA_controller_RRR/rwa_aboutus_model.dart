// To parse this JSON data, do
//
//     final rwaaboutusModel = rwaaboutusModelFromJson(jsonString);

import 'dart:convert';

RwaaboutusModel rwaaboutusModelFromJson(String str) =>
    RwaaboutusModel.fromJson(json.decode(str));

String rwaaboutusModelToJson(RwaaboutusModel data) =>
    json.encode(data.toJson());

class RwaaboutusModel {
  int? id;
  String? about;

  RwaaboutusModel({
    this.id,
    this.about,
  });

  factory RwaaboutusModel.fromJson(Map<String, dynamic> json) =>
      RwaaboutusModel(
        id: json["Id"],
        about: json["About"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "About": about,
      };
}
