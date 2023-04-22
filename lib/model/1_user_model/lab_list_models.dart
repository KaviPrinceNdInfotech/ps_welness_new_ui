// To parse this JSON data, do
//
//     final labListUser = labListUserFromJson(jsonString);

import 'dart:convert';

LabListUser labListUserFromJson(String str) => LabListUser.fromJson(json.decode(str));

String labListUserToJson(LabListUser data) => json.encode(data.toJson());

class LabListUser {
  LabListUser({
    required this.labList,
    this.labListViaTest,
    this.message,
    required this.status,
  });

  List<LabList> labList;
  dynamic labListViaTest;
  dynamic message;
  int status;

  factory LabListUser.fromJson(Map<String, dynamic> json) => LabListUser(
    labList: List<LabList>.from(json["LabList"].map((x) => LabList.fromJson(x))),
    labListViaTest: json["LabListViaTest"],
    message: json["Message"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "LabList": List<dynamic>.from(labList.map((x) => x.toJson())),
    "LabListViaTest": labListViaTest,
    "Message": message,
    "Status": status,
  };
}

class LabList {
  LabList({
    required this.id,
    required this.labName,
    required this.phoneNumber,
    required this.mobileNumber,
    required this.location,
    required this.openingHours,
    required this.workingDay,
    required this.fee,
  });

  int id;
  String labName;
  String phoneNumber;
  String mobileNumber;
  String location;
  String openingHours;
  String workingDay;
  double fee;

  factory LabList.fromJson(Map<String, dynamic> json) => LabList(
    id: json["Id"],
    labName: json["LabName"],
    phoneNumber: json["PhoneNumber"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    openingHours: json["OpeningHours"],
    workingDay: json["WorkingDay"],
    fee: json["Fee"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "LabName": labName,
    "PhoneNumber": phoneNumber,
    "MobileNumber": mobileNumber,
    "Location": location,
    "OpeningHours": openingHours,
    "WorkingDay": workingDay,
    "Fee": fee,
  };
}
