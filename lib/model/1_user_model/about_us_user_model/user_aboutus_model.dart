import 'dart:convert';

UseraboutusModel useraboutusModelFromJson(String str) =>
    UseraboutusModel.fromJson(json.decode(str));

String useraboutusModelToJson(UseraboutusModel data) =>
    json.encode(data.toJson());

class UseraboutusModel {
  int? id;
  String? about;

  UseraboutusModel({
    this.id,
    this.about,
  });

  factory UseraboutusModel.fromJson(Map<String, dynamic> json) =>
      UseraboutusModel(
        id: json["Id"],
        about: json["About"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "About": about,
      };
}
