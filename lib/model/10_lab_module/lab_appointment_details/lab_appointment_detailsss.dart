// To parse this JSON data, do
//
//     final labappointmentdetailsModel = labappointmentdetailsModelFromJson(jsonString);

import 'dart:convert';

LabappointmentdetailsModel labappointmentdetailsModelFromJson(String str) =>
    LabappointmentdetailsModel.fromJson(json.decode(str));

String labappointmentdetailsModelToJson(LabappointmentdetailsModel data) =>
    json.encode(data.toJson());

class LabappointmentdetailsModel {
  List<LabAd>? labAd;

  LabappointmentdetailsModel({
    this.labAd,
  });

  factory LabappointmentdetailsModel.fromJson(Map<String, dynamic> json) =>
      LabappointmentdetailsModel(
        labAd: json["LabAD"] == null
            ? []
            : List<LabAd>.from(json["LabAD"]!.map((x) => LabAd.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabAD": labAd == null
            ? []
            : List<dynamic>.from(labAd!.map((x) => x.toJson())),
      };
}

class LabAd {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? location;
  String? cityName;
  double? amount;
  String? startSlotTime;
  String? endSlotTime;

  LabAd({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.location,
    this.cityName,
    this.amount,
    this.startSlotTime,
    this.endSlotTime,
  });

  factory LabAd.fromJson(Map<String, dynamic> json) => LabAd(
        id: json["id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        cityName: json["CityName"],
        amount: json["Amount"],
        startSlotTime: json["StartSlotTime"],
        endSlotTime: json["EndSlotTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "Location": location,
        "CityName": cityName,
        "Amount": amount,
        "StartSlotTime": startSlotTime,
        "EndSlotTime": endSlotTime,
      };
}
