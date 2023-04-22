// To parse this JSON data, do
//
//     final nursedetailbyId = nursedetailbyIdFromJson(jsonString);

import 'dart:convert';

NursedetailbyId nursedetailbyIdFromJson(String str) => NursedetailbyId.fromJson(json.decode(str));

String nursedetailbyIdToJson(NursedetailbyId data) => json.encode(data.toJson());

class NursedetailbyId {
  NursedetailbyId({
    this.id,
    this.nurseName,
    this.experience,
    this.fee,
    this.about,
    this.nurseTypeName,
  });

  int? id;
  String? nurseName;
  int? experience;
  double? fee;
  String? about;
  String? nurseTypeName;

  factory NursedetailbyId.fromJson(Map<String, dynamic> json) => NursedetailbyId(
    id: json["Id"],
    nurseName: json["NurseName"],
    experience: json["Experience"],
    fee: json["Fee"],
    about: json["About"],
    nurseTypeName: json["NurseTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "NurseName": nurseName,
    "Experience": experience,
    "Fee": fee,
    "About": about,
    "NurseTypeName": nurseTypeName,
  };
}
