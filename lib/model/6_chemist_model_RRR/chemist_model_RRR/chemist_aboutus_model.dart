// To parse this JSON data, do
//
//     final chemistaboutus = chemistaboutusFromJson(jsonString);

import 'dart:convert';

Chemistaboutus chemistaboutusFromJson(String str) =>
    Chemistaboutus.fromJson(json.decode(str));

String chemistaboutusToJson(Chemistaboutus data) => json.encode(data.toJson());

class Chemistaboutus {
  int? id;
  String? about;

  Chemistaboutus({
    this.id,
    this.about,
  });

  factory Chemistaboutus.fromJson(Map<String, dynamic> json) => Chemistaboutus(
        id: json["Id"],
        about: json["About"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "About": about,
      };
}
