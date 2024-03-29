// To parse this JSON data, do
//
//     final nurseListbylocationId = nurseListbylocationIdFromJson(jsonString);
import 'dart:convert';

///
// import 'dart:convert';
//
// NurseListbylocationId nurseListbylocationIdFromJson(String str) =>
//     NurseListbylocationId.fromJson(json.decode(str));
//
// String nurseListbylocationIdToJson(NurseListbylocationId data) =>
//     json.encode(data.toJson());
//
// class NurseListbylocationId {
//   List<NurseListuser>? nurseLists;
//
//   NurseListbylocationId({
//     this.nurseLists,
//   });
//
//   factory NurseListbylocationId.fromJson(Map<String, dynamic> json) =>
//       NurseListbylocationId(
//         nurseLists: json["NurseLists"] == null
//             ? []
//             : List<NurseListuser>.from(
//                 json["NurseLists"]!.map((x) => NurseListuser.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "NurseLists": nurseLists == null
//             ? []
//             : List<dynamic>.from(nurseLists!.map((x) => x.toJson())),
//       };
// }
//
// class NurseListuser {
//   int? id;
//   String? nurseName;
//   int? experience;
//   double? fee;
//   String? about;
//   String? nurseTypeName;
//
//   NurseListuser({
//     this.id,
//     this.nurseName,
//     this.experience,
//     this.fee,
//     this.about,
//     this.nurseTypeName,
//   });
//
//   factory NurseListuser.fromJson(Map<String, dynamic> json) => NurseListuser(
//         id: json["Id"],
//         nurseName: json["NurseName"],
//         experience: json["Experience"],
//         fee: json["Fee"],
//         about: json["About"],
//         nurseTypeName: json["NurseTypeName"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "NurseName": nurseName,
//         "Experience": experience,
//         "Fee": fee,
//         "About": about,
//         "NurseTypeName": nurseTypeName,
//       };
// }
///
/// import 'dart:convert';

NurseListbylocationId nurseListbylocationIdFromJson(String str) =>
    NurseListbylocationId.fromJson(json.decode(str));

String nurseListbylocationIdToJson(NurseListbylocationId data) =>
    json.encode(data.toJson());

class NurseListbylocationId {
  List<NurseListlucationid>? nurseLists;

  NurseListbylocationId({
    this.nurseLists,
  });

  factory NurseListbylocationId.fromJson(Map<String, dynamic> json) =>
      NurseListbylocationId(
        nurseLists: json["NurseLists"] == null
            ? []
            : List<NurseListlucationid>.from(json["NurseLists"]!
                .map((x) => NurseListlucationid.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "NurseLists": nurseLists == null
            ? []
            : List<dynamic>.from(nurseLists!.map((x) => x.toJson())),
      };
}

class NurseListlucationid {
  int? id;
  String? nurseName;
  int? experience;
  num? fee;
  String? about;
  String? nurseTypeName;
  num? rating;

  NurseListlucationid({
    this.id,
    this.nurseName,
    this.experience,
    this.fee,
    this.about,
    this.nurseTypeName,
    this.rating,
  });

  factory NurseListlucationid.fromJson(Map<String, dynamic> json) =>
      NurseListlucationid(
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
