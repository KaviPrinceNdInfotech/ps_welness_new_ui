// To parse this JSON data, do
//
//     final frenchiesPatientDetailModel = frenchiesPatientDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesPatientDetailModel frenchiesPatientDetailModelFromJson(String str) => FrenchiesPatientDetailModel.fromJson(json.decode(str));

String frenchiesPatientDetailModelToJson(FrenchiesPatientDetailModel data) => json.encode(data.toJson());

class FrenchiesPatientDetailModel {
  List<PatientRegDetail>? patientRegDetail;

  FrenchiesPatientDetailModel({
    this.patientRegDetail,
  });

  factory FrenchiesPatientDetailModel.fromJson(Map<String, dynamic> json) => FrenchiesPatientDetailModel(
    patientRegDetail: json["PatientRegDetail"] == null ? [] : List<PatientRegDetail>.from(json["PatientRegDetail"]!.map((x) => PatientRegDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PatientRegDetail": patientRegDetail == null ? [] : List<dynamic>.from(patientRegDetail!.map((x) => x.toJson())),
  };
}

class PatientRegDetail {
  int? id;
  String? patientName;
  String? vendorName;
  String? mobileNumber;
  String? location;
  String? cityName;
  String? stateName;
  bool? isApproved;

  PatientRegDetail({
    this.id,
    this.patientName,
    this.vendorName,
    this.mobileNumber,
    this.location,
    this.cityName,
    this.stateName,
    this.isApproved,
  });

  factory PatientRegDetail.fromJson(Map<String, dynamic> json) => PatientRegDetail(
    id: json["Id"],
    patientName: json["PatientName"],
    vendorName: json["VendorName"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    cityName: json["CityName"],
    stateName: json["StateName"],
    isApproved: json["IsApproved"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PatientName": patientName,
    "VendorName": vendorName,
    "MobileNumber": mobileNumber,
    "Location": location,
    "CityName": cityName,
    "StateName": stateName,
    "IsApproved": isApproved,
  };
}
