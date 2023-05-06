// To parse this JSON data, do
//
//     final rwaPatientListModel = rwaPatientListModelFromJson(jsonString);

import 'dart:convert';

RwaPatientListModel rwaPatientListModelFromJson(String str) => RwaPatientListModel.fromJson(json.decode(str));

String rwaPatientListModelToJson(RwaPatientListModel data) => json.encode(data.toJson());

class RwaPatientListModel {
  List<Patient>? patient;

  RwaPatientListModel({
    this.patient,
  });

  factory RwaPatientListModel.fromJson(Map<String, dynamic> json) => RwaPatientListModel(
    patient: json["Patient"] == null ? [] : List<Patient>.from(json["Patient"]!.map((x) => Patient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Patient": patient == null ? [] : List<dynamic>.from(patient!.map((x) => x.toJson())),
  };
}

class Patient {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? stateName;
  String? cityName;
  String? location;
  String? pincode;

  Patient({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.stateName,
    this.cityName,
    this.location,
    this.pincode,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["Id"],
    patientName: json["PatientName"],
    mobileNumber: json["MobileNumber"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    location: json["Location"],
    pincode: json["Pincode"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PatientName": patientName,
    "MobileNumber": mobileNumber,
    "StateName": stateName,
    "CityName": cityName,
    "Location": location,
    "Pincode": pincode,
  };
}
