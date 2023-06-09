import 'dart:convert';

DoctorAppoinmentHistorydetailModel doctorAppoinmentHistoryFromJson(
        String str) =>
    DoctorAppoinmentHistorydetailModel.fromJson(json.decode(str));

String doctorAppoinmentHistoryToJson(DoctorAppoinmentHistorydetailModel data) =>
    json.encode(data.toJson());

class DoctorAppoinmentHistorydetailModel {
  DoctorAppoinmentHistorydetailModel({
    this.patients,
  });

  List<PatientAppoitntment>? patients;

  factory DoctorAppoinmentHistorydetailModel.fromJson(
          Map<String, dynamic> json) =>
      DoctorAppoinmentHistorydetailModel(
        patients: json["patients"] == null
            ? []
            : List<PatientAppoitntment>.from(
                json["patients"]!.map((x) => PatientAppoitntment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patients": patients == null
            ? []
            : List<dynamic>.from(patients!.map((x) => x.toJson())),
      };
}

class PatientAppoitntment {
  PatientAppoitntment({
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

  factory PatientAppoitntment.fromJson(Map<String, dynamic> json) =>
      PatientAppoitntment(
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
