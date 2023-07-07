import 'dart:convert';

DoctorAppoinmentHistoryModel doctorAppoinmentHistoryFromJson(String str) => DoctorAppoinmentHistoryModel.fromJson(json.decode(str));

String doctorAppoinmentHistoryToJson(DoctorAppoinmentHistoryModel data) => json.encode(data.toJson());

class DoctorAppoinmentHistoryModel {
  DoctorAppoinmentHistoryModel({
    this.patients,
  });

  List<Patient>? patients;

  factory DoctorAppoinmentHistoryModel.fromJson(Map<String, dynamic> json) => DoctorAppoinmentHistoryModel(
    patients: json["patients"] == null ? [] : List<Patient>.from(json["patients"]!.map((x) => Patient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "patients": patients == null ? [] : List<dynamic>.from(patients!.map((x) => x.toJson())),
  };
}

class Patient {
  Patient({
    this.patientName,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.cityName,
    this.stateName,
    this.patientRegNo,
  });

  String? patientName;
  String? emailId;
  String? mobileNumber;
  String? location;
  String? cityName;
  String? stateName;
  String? patientRegNo;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    patientName: json["PatientName"],
    emailId: json["EmailId"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    cityName: json["CityName"],
    stateName: json["StateName"],
    patientRegNo: json["PatientRegNo"],
  );

  Map<String, dynamic> toJson() => {
    "PatientName": patientName,
    "EmailId": emailId,
    "MobileNumber": mobileNumber,
    "Location": location,
    "CityName": cityName,
    "StateName": stateName,
    "PatientRegNo": patientRegNo,
  };
}
