// To parse this JSON data, do
//
//     final labListUser = labListUserFromJson(jsonString);

import 'dart:convert';

// LabListUser labListUserFromJson(String str) => LabListUser.fromJson(json.decode(str));
//
// String labListUserToJson(LabListUser data) => json.encode(data.toJson());
//
// class LabListUser {
//   LabListUser({
//     required this.labList,
//     this.labListViaTest,
//     this.message,
//     required this.status,
//   });
//
//   List<LabList> labList;
//   dynamic labListViaTest;
//   dynamic message;
//   int status;
//
//   factory LabListUser.fromJson(Map<String, dynamic> json) => LabListUser(
//     labList: List<LabList>.from(json["LabList"].map((x) => LabList.fromJson(x))),
//     labListViaTest: json["LabListViaTest"],
//     message: json["Message"],
//     status: json["Status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "LabList": List<dynamic>.from(labList.map((x) => x.toJson())),
//     "LabListViaTest": labListViaTest,
//     "Message": message,
//     "Status": status,
//   };
// }
//
// class LabList {
//   LabList({
//     required this.id,
//     required this.labName,
//     required this.phoneNumber,
//     required this.mobileNumber,
//     required this.location,
//     required this.openingHours,
//     required this.workingDay,
//     required this.fee,
//   });
//
//   int id;
//   String labName;
//   String phoneNumber;
//   String mobileNumber;
//   String location;
//   String openingHours;
//   String workingDay;
//   double fee;
//
//   factory LabList.fromJson(Map<String, dynamic> json) => LabList(
//     id: json["Id"],
//     labName: json["LabName"],
//     phoneNumber: json["PhoneNumber"],
//     mobileNumber: json["MobileNumber"],
//     location: json["Location"],
//     openingHours: json["OpeningHours"],
//     workingDay: json["WorkingDay"],
//     fee: json["Fee"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "LabName": labName,
//     "PhoneNumber": phoneNumber,
//     "MobileNumber": mobileNumber,
//     "Location": location,
//     "OpeningHours": openingHours,
//     "WorkingDay": workingDay,
//     "Fee": fee,
//   };
// }

// To parse this JSON data, do
//
//     final labListUser = labListUserFromJson(jsonString);


///

// LabListUser labListUserFromJson(String str) => LabListUser.fromJson(json.decode(str));
//
// String labListUserToJson(LabListUser data) => json.encode(data.toJson());
//
// class LabListUser {
//   List<LabList>? labList;
//   dynamic labListViaTest;
//   dynamic message;
//   int? status;
//
//   LabListUser({
//     this.labList,
//     this.labListViaTest,
//     this.message,
//     this.status,
//   });
//
//   factory LabListUser.fromJson(Map<String, dynamic> json) => LabListUser(
//     labList: json["LabList"] == null ? [] : List<LabList>.from(json["LabList"]!.map((x) => LabList.fromJson(x))),
//     labListViaTest: json["LabListViaTest"],
//     message: json["Message"],
//     status: json["Status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "LabList": labList == null ? [] : List<dynamic>.from(labList!.map((x) => x.toJson())),
//     "LabListViaTest": labListViaTest,
//     "Message": message,
//     "Status": status,
//   };
// }
//
// class LabList {
//   int? id;
//   String? labName;
//   String? mobileNumber;
//   String? location;
//   String? openingHours;
//   String? workingDay;
//   double? fee;
//
//   LabList({
//     this.id,
//     this.labName,
//     this.mobileNumber,
//     this.location,
//     this.openingHours,
//     this.workingDay,
//     this.fee,
//   });
//
//   factory LabList.fromJson(Map<String, dynamic> json) => LabList(
//     id: json["Id"],
//     labName: json["LabName"],
//     mobileNumber: json["MobileNumber"],
//     location: json["Location"],
//     openingHours: json["OpeningHours"],
//     workingDay: json["WorkingDay"],
//     fee: json["Fee"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "LabName": labName,
//     "MobileNumber": mobileNumber,
//     "Location": location,
//     "OpeningHours": openingHours,
//     "WorkingDay": workingDay,
//     "Fee": fee,
//   };
// }

// To parse this JSON data, do
//
//     final labListUser = labListUserFromJson(jsonString);

import 'dart:convert';

LabListUser labListUserFromJson(String str) => LabListUser.fromJson(json.decode(str));

String labListUserToJson(LabListUser data) => json.encode(data.toJson());

class LabListUser {
  List<LabBooking>? labBookings;

  LabListUser({
    this.labBookings,
  });

  factory LabListUser.fromJson(Map<String, dynamic> json) => LabListUser(
    labBookings: json["LabBookings"] == null ? [] : List<LabBooking>.from(json["LabBookings"]!.map((x) => LabBooking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LabBookings": labBookings == null ? [] : List<dynamic>.from(labBookings!.map((x) => x.toJson())),
  };
}

class LabBooking {
  int? id;
  String? labName;
  String? mobileNumber;
  String? openingHours;
  String? location;
  double? fee;
  String? workingDay;

  LabBooking({
    this.id,
    this.labName,
    this.mobileNumber,
    this.openingHours,
    this.location,
    this.fee,
    this.workingDay,
  });

  factory LabBooking.fromJson(Map<String, dynamic> json) => LabBooking(
    id: json["id"],
    labName: json["LabName"],
    mobileNumber: json["MobileNumber"],
    openingHours: json["OpeningHours"],
    location: json["Location"],
    fee: json["Fee"],
    workingDay: json["WorkingDay"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "LabName": labName,
    "MobileNumber": mobileNumber,
    "OpeningHours": openingHours,
    "Location": location,
    "Fee": fee,
    "WorkingDay": workingDay,
  };
}


