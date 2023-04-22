// To parse this JSON data, do
//
//     final labappointmentbyuserid = labappointmentbyuseridFromJson(jsonString);

import 'dart:convert';

Labappointmentbyuserid labappointmentbyuseridFromJson(String str) => Labappointmentbyuserid.fromJson(json.decode(str));

String labappointmentbyuseridToJson(Labappointmentbyuserid data) => json.encode(data.toJson());

class Labappointmentbyuserid {
  Labappointmentbyuserid({
    this.labModel,
    this.message,
    this.status,
  });

  List<LabModel>? labModel;
  dynamic message;
  int? status;

  factory Labappointmentbyuserid.fromJson(Map<String, dynamic> json) => Labappointmentbyuserid(
    labModel: json["LabModel"] == null ? [] : List<LabModel>.from(json["LabModel"]!.map((x) => LabModel.fromJson(x))),
    message: json["Message"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "LabModel": labModel == null ? [] : List<dynamic>.from(labModel!.map((x) => x.toJson())),
    "Message": message,
    "Status": status,
  };
}

class LabModel {
  LabModel({
    this.id,
    this.labName,
    this.testName,
    this.bookingDate,
    this.fee,
    this.location,
  });

  int? id;
  String? labName;
  String? testName;
  DateTime? bookingDate;
  double? fee;
  String? location;

  factory LabModel.fromJson(Map<String, dynamic> json) => LabModel(
    id: json["Id"],
    labName: json["LabName"],
    testName: json["TestName"],
    bookingDate: json["BookingDate"] == null ? null : DateTime.parse(json["BookingDate"]),
    fee: json["Fee"],
    location: json["Location"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "LabName": labName,
    "TestName": testName,
    "BookingDate": bookingDate?.toIso8601String(),
    "Fee": fee,
    "Location": location,
  };
}
