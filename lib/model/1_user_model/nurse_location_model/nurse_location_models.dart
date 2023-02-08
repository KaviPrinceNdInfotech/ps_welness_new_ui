// To parse this JSON data, do
//
//     final getNurseLocationModel = getNurseLocationModelFromJson(jsonString);

import 'dart:convert';

GetNurseLocationModel getNurseLocationModelFromJson(String str) => GetNurseLocationModel.fromJson(json.decode(str));

String getNurseLocationModelToJson(GetNurseLocationModel data) => json.encode(data.toJson());

class GetNurseLocationModel {
  GetNurseLocationModel({
    required this.location,
  });

  List<NurseLocationModel> location;

  factory GetNurseLocationModel.fromJson(Map<String, dynamic> json) => GetNurseLocationModel(
    location: List<NurseLocationModel>.from(json["Location"].map((x) => NurseLocationModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Location": List<dynamic>.from(location.map((x) => x.toJson())),
  };
}

class NurseLocationModel {
  NurseLocationModel({
    required this.id,
    required this.cityId,
    required this.isDeleted,
    this.cityList,
    required this.lat,
    required this.lng,
    this.states,
    this.cities,
    this.locations,
    this.stateName,
    this.cityName,
    required this.locationName,
  });

  int id;
  int cityId;
  bool isDeleted;
  dynamic cityList;
  double lat;
  double lng;
  dynamic states;
  dynamic cities;
  dynamic locations;
  dynamic stateName;
  dynamic cityName;
  String locationName;

  factory NurseLocationModel.fromJson(Map<String, dynamic> json) => NurseLocationModel(
    id: json["Id"],
    cityId: json["City_Id"],
    isDeleted: json["IsDeleted"],
    cityList: json["CityList"],
    lat: json["Lat"]?.toDouble(),
    lng: json["Lng"]?.toDouble(),
    states: json["States"],
    cities: json["Cities"],
    locations: json["Locations"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    locationName: json["LocationName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "City_Id": cityId,
    "IsDeleted": isDeleted,
    "CityList": cityList,
    "Lat": lat,
    "Lng": lng,
    "States": states,
    "Cities": cities,
    "Locations": locations,
    "StateName": stateName,
    "CityName": cityName,
    "LocationName": locationName,
  };
}
