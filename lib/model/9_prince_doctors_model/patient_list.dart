// // To parse this JSON data, do
// //
// //     final patientList = patientListFromJson(jsonString);
//
// import 'dart:convert';
//
// List<PatientList> patientListFromJson(String str) => List<PatientList>.from(
//     json.decode(str).map((x) => PatientList.fromJson(x)));
//
// String patientListToJson(List<PatientList> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class PatientList {
//   PatientList({
//     required this.id,
//     this.patientRegNo,
//     this.mobileNumber,
//     required this.patientName,
//   });
//
//   int id;
//   dynamic patientRegNo;
//   dynamic mobileNumber;
//   String patientName;
//
//   factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
//         id: json["Id"],
//         patientRegNo: json["PatientRegNo"],
//         mobileNumber: json["MobileNumber"],
//         patientName: json["PatientName"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "PatientRegNo": patientRegNo,
//         "MobileNumber": mobileNumber,
//         "PatientName": patientName,
//       };
// }
// To parse this JSON data, do
//
//     final patientList = patientListFromJson(jsonString);

import 'dart:convert';

PatientList patientListFromJson(String str) => PatientList.fromJson(json.decode(str));

String patientListToJson(PatientList data) => json.encode(data.toJson());

class PatientList {
  PatientList({
    this.message,
    this.response,
  });

  String? message;
  List<Response>? response;

  factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
    message: json["Message"],
    response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
  };
}

class Response {
  Response({
    this.doctorId,
    this.patientId,
    this.patientName,
    this.patientRegNo,
  });

  int? doctorId;
  int? patientId;
  String? patientName;
  String? patientRegNo;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    doctorId: json["DoctorId"],
    patientId: json["PatientId"],
    patientName: json["PatientName"],
    patientRegNo: json["PatientRegNo"],
  );

  Map<String, dynamic> toJson() => {
    "DoctorId": doctorId,
    "PatientId": patientId,
    "PatientName": patientName,
    "PatientRegNo": patientRegNo,
  };
}
