//To parse this JSON data, do
//
//     final nursedetailbyId = nursedetailbyIdFromJson(jsonString);

import 'dart:convert';

NursedetailbyId nursedetailbyIdFromJson(String str) =>
    NursedetailbyId.fromJson(json.decode(str));

String nursedetailbyIdToJson(NursedetailbyId data) =>
    json.encode(data.toJson());

class NursedetailbyId {
  int? id;
  String? nurseName;
  int? experience;
  double? fee;
  String? about;
  String? nurseTypeName;
  num? rating;

  NursedetailbyId({
    this.id,
    this.nurseName,
    this.experience,
    this.fee,
    this.about,
    this.nurseTypeName,
    this.rating,
  });

  factory NursedetailbyId.fromJson(Map<String, dynamic> json) =>
      NursedetailbyId(
        id: json["Id"],
        nurseName: json["NurseName"],
        experience: json["Experience"],
        fee: json["Fee"],
        about: json["about"],
        nurseTypeName: json["NurseTypeName"],
        rating: json["Rating"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NurseName": nurseName,
        "Experience": experience,
        "Fee": fee,
        "about": about,
        "NurseTypeName": nurseTypeName,
        "Rating": rating,
      };
}
