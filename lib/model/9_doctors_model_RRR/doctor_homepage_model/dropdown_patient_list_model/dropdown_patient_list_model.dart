// To parse this JSON data, do
//
//     final patientlistDoctorModel = patientlistDoctorModelFromJson(jsonString);

import 'dart:convert';

PatientlistDoctorModel patientlistDoctorModelFromJson(String str) =>
    PatientlistDoctorModel.fromJson(json.decode(str));

String patientlistDoctorModelToJson(PatientlistDoctorModel data) =>
    json.encode(data.toJson());

class PatientlistDoctorModel {
  List<PatientDropdownDoctorName>? patientName;

  PatientlistDoctorModel({
    this.patientName,
  });

  factory PatientlistDoctorModel.fromJson(Map<String, dynamic> json) =>
      PatientlistDoctorModel(
        patientName: json["PatientName"] == null
            ? []
            : List<PatientDropdownDoctorName>.from(json["PatientName"]!
                .map((x) => PatientDropdownDoctorName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PatientName": patientName == null
            ? []
            : List<dynamic>.from(patientName!.map((x) => x.toJson())),
      };
}

class PatientDropdownDoctorName {
  int? id;
  String? patientName;

  PatientDropdownDoctorName({
    this.id,
    this.patientName,
  });

  factory PatientDropdownDoctorName.fromJson(Map<String, dynamic> json) =>
      PatientDropdownDoctorName(
        id: json["Id"],
        patientName: json["PatientName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
      };
}
