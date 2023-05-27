// To parse this JSON data, do
//
//     final labappointmentbyuserid = labappointmentbyuseridFromJson(jsonString);

///

// import 'dart:convert';
//
// Labappointmentbyuserid labappointmentbyuseridFromJson(String str) => Labappointmentbyuserid.fromJson(json.decode(str));
//
// String labappointmentbyuseridToJson(Labappointmentbyuserid data) => json.encode(data.toJson());
//
// class Labappointmentbyuserid {
//   Labappointmentbyuserid({
//     this.labModel,
//     this.message,
//     this.status,
//   });
//
//   List<LabModel>? labModel;
//   dynamic message;
//   int? status;
//
//   factory Labappointmentbyuserid.fromJson(Map<String, dynamic> json) => Labappointmentbyuserid(
//     labModel: json["LabModel"] == null ? [] : List<LabModel>.from(json["LabModel"]!.map((x) => LabModel.fromJson(x))),
//     message: json["Message"],
//     status: json["Status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "LabModel": labModel == null ? [] : List<dynamic>.from(labModel!.map((x) => x.toJson())),
//     "Message": message,
//     "Status": status,
//   };
// }
//
// class LabModel {
//   LabModel({
//     this.id,
//     this.labName,
//     this.testName,
//     this.testDate,
//     this.testAmount,
//     this.location,
//   });
//
//   int? id;
//   String? labName;
//   String? testName;
//   DateTime? testDate;
//   double? testAmount;
//   String? location;
//
//   factory LabModel.fromJson(Map<String, dynamic> json) => LabModel(
//     id: json["Id"],
//     labName: json["LabName"],
//     testName: json["TestName"],
//     testDate: json["TestDate"] == null ? null : DateTime.parse(json["TestDate"]),
//     testAmount: json["TestAmount"],
//     location: json["Location"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "LabName": labName,
//     "TestName": testName,
//     "TestDate": testDate?.toIso8601String(),
//     "TestAmount": testAmount,
//     "Location": location,
//   };
// }
///
import 'dart:convert';

Labappointmentbyuserid labappointmentbyuseridFromJson(String str) =>
    Labappointmentbyuserid.fromJson(json.decode(str));

String labappointmentbyuseridToJson(Labappointmentbyuserid data) =>
    json.encode(data.toJson());

class Labappointmentbyuserid {
  List<Kk>? kk;

  Labappointmentbyuserid({
    this.kk,
  });

  factory Labappointmentbyuserid.fromJson(Map<String, dynamic> json) =>
      Labappointmentbyuserid(
        kk: json["kk"] == null
            ? []
            : List<Kk>.from(json["kk"]!.map((x) => Kk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kk": kk == null ? [] : List<dynamic>.from(kk!.map((x) => x.toJson())),
      };
}

class Kk {
  int? id;
  String? labName;
  String? testName;
  DateTime? testDate;
  double? testAmount;
  String? location;

  Kk({
    this.id,
    this.labName,
    this.testName,
    this.testDate,
    this.testAmount,
    this.location,
  });

  factory Kk.fromJson(Map<String, dynamic> json) => Kk(
        id: json["Id"],
        labName: json["LabName"],
        testName: json["TestName"],
        testDate:
            json["TestDate"] == null ? null : DateTime.parse(json["TestDate"]),
        testAmount: json["TestAmount"],
        location: json["Location"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "TestName": testName,
        "TestDate": testDate?.toIso8601String(),
        "TestAmount": testAmount,
        "Location": location,
      };
}

// enum LabName { DEEPLAB }
//
// final labNameValues = EnumValues({
//   "deeplab": LabName.DEEPLAB
// });
//
// enum Location { ACDF }
//
// final locationValues = EnumValues({
//   "acdf": Location.ACDF
// });
//
// enum TestName { BLOOD }
//
// final testNameValues = EnumValues({
//   "Blood": TestName.BLOOD
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
