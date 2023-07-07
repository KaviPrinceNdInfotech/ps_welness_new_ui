// To parse this JSON data, do
//
//     final nurseListbycityId = nurseListbycityIdFromJson(jsonString);

import 'dart:convert';

NurseListbycityId nurseListbycityIdFromJson(String str) =>
    NurseListbycityId.fromJson(json.decode(str));

String nurseListbycityIdToJson(NurseListbycityId data) =>
    json.encode(data.toJson());

class NurseListbycityId {
  NurseListbycityId({
    this.getNurse,
  });

  List<GetNurse>? getNurse;

  factory NurseListbycityId.fromJson(Map<String, dynamic> json) =>
      NurseListbycityId(
        getNurse: json["getNurse"] == null
            ? []
            : List<GetNurse>.from(
                json["getNurse"]!.map((x) => GetNurse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getNurse": getNurse == null
            ? []
            : List<dynamic>.from(getNurse!.map((x) => x.toJson())),
      };
}

class GetNurse {
  GetNurse({
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

  factory GetNurse.fromJson(Map<String, dynamic> json) => GetNurse(
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

///.....new_model.....for nurse list ....
///
