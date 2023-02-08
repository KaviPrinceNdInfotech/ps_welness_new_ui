// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    required this.cities,
  });

  List<City> cities;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        cities: List<City>.from(json["Cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  City({
    required this.id,
    required this.cityName,
    required this.stateMasterId,
    required this.isDeleted,
    this.stateName,
    this.states,
  });

  int id;
  String cityName;
  int stateMasterId;
  bool isDeleted;
  dynamic stateName;
  dynamic states;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["Id"],
        cityName: json["CityName"],
        stateMasterId: json["StateMaster_Id"],
        isDeleted: json["IsDeleted"],
        stateName: json["StateName"],
        states: json["States"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CityName": cityName,
        "StateMaster_Id": stateMasterId,
        "IsDeleted": isDeleted,
        "StateName": stateName,
        "States": states,
      };
}
