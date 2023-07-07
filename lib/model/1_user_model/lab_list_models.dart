// To parse this JSON data, do
//
//     final labListUser = labListUserFromJson(jsonString);

import 'dart:convert';

LabListUser labListUserFromJson(String str) =>
    LabListUser.fromJson(json.decode(str));

String labListUserToJson(LabListUser data) => json.encode(data.toJson());

class LabListUser {
  List<LabBooking>? labBookings;

  LabListUser({
    this.labBookings,
  });

  factory LabListUser.fromJson(Map<String, dynamic> json) => LabListUser(
        labBookings: json["LabBookings"] == null
            ? []
            : List<LabBooking>.from(
                json["LabBookings"]!.map((x) => LabBooking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabBookings": labBookings == null
            ? []
            : List<dynamic>.from(labBookings!.map((x) => x.toJson())),
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
  num? rating;

  LabBooking({
    this.id,
    this.labName,
    this.mobileNumber,
    this.openingHours,
    this.location,
    this.fee,
    this.workingDay,
    this.rating,
  });

  factory LabBooking.fromJson(Map<String, dynamic> json) => LabBooking(
        id: json["id"],
        labName: json["LabName"],
        mobileNumber: json["MobileNumber"],
        openingHours: json["OpeningHours"],
        location: json["Location"],
        fee: json["Fee"],
        workingDay: json["WorkingDay"],
        rating: json["Rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "LabName": labName,
        "MobileNumber": mobileNumber,
        "OpeningHours": openingHours,
        "Location": location,
        "Fee": fee,
        "WorkingDay": workingDay,
        "Rating": rating,
      };
}
