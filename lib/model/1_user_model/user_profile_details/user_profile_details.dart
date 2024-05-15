// To parse this JSON data, do
//
//     final userprofilepersonal = userprofilepersonalFromJson(jsonString);

import 'dart:convert';

Userprofilepersonal userprofilepersonalFromJson(String str) =>
    Userprofilepersonal.fromJson(json.decode(str));

String userprofilepersonalToJson(Userprofilepersonal data) =>
    json.encode(data.toJson());

class Userprofilepersonal {
  Userprofilepersonal({
    this.id,
    this.stateMasterId,
    this.cityMasterId,
    this.patientName,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.cityName,
    this.stateName,
    this.pincode,
  });

  int? id;
  num? stateMasterId;
  num? cityMasterId;
  String? patientName;
  String? emailId;
  String? mobileNumber;
  String? location;
  String? cityName;
  String? stateName;
  String? pincode;

  factory Userprofilepersonal.fromJson(Map<String, dynamic> json) =>
      Userprofilepersonal(
        id: json["id"],
        stateMasterId: json["StateMaster_Id"],
        cityMasterId: json["CityMaster_Id"],
        patientName: json["PatientName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        cityName: json["CityName"],
        stateName: json["StateName"],
        pincode: json["Pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "StateMaster_Id": stateMasterId,
        "CityMaster_Id": cityMasterId,
        "PatientName": patientName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "CityName": cityName,
        "StateName": stateName,
        "Pincode": pincode,
      };
}
