// To parse this JSON data, do
//
//     final ambulancetype = ambulancetypeFromJson(jsonString);

import 'dart:convert';

Ambulancetype ambulancetypeFromJson(String str) => Ambulancetype.fromJson(json.decode(str));

String ambulancetypeToJson(Ambulancetype data) => json.encode(data.toJson());

class Ambulancetype {
  Ambulancetype({
    this.ambulanceT,
  });

  List<AmbulanceT>? ambulanceT;

  factory Ambulancetype.fromJson(Map<String, dynamic> json) => Ambulancetype(
    ambulanceT: json["AmbulanceT"] == null ? [] : List<AmbulanceT>.from(json["AmbulanceT"]!.map((x) => AmbulanceT.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "AmbulanceT": ambulanceT == null ? [] : List<dynamic>.from(ambulanceT!.map((x) => x.toJson())),
  };
}

class AmbulanceT {
  AmbulanceT({
    this.id,
    this.ambulanceType,
  });

  int? id;
  String? ambulanceType;

  factory AmbulanceT.fromJson(Map<String, dynamic> json) => AmbulanceT(
    id: json["id"],
    ambulanceType: json["AmbulanceType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "AmbulanceType": ambulanceType,
  };
}
