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

DoctorBookingHistoryModel doctorBookingHistoryModelFromJson(String str) =>
    DoctorBookingHistoryModel.fromJson(json.decode(str));

String doctorBookingHistoryModelToJson(DoctorBookingHistoryModel data) =>
    json.encode(data.toJson());

class DoctorBookingHistoryModel {
  List<BookingHistory>? bookingHistory;

  DoctorBookingHistoryModel({
    this.bookingHistory,
  });

  factory DoctorBookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      DoctorBookingHistoryModel(
        bookingHistory: json["BookingHistory"] == null
            ? []
            : List<BookingHistory>.from(
                json["BookingHistory"]!.map((x) => BookingHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BookingHistory": bookingHistory == null
            ? []
            : List<dynamic>.from(bookingHistory!.map((x) => x.toJson())),
      };
}

class BookingHistory {
  int? id;
  String? patientName;
  String? location;
  String? stateName;
  String? cityName;
  String? patientRegNo;
  DateTime? appointmentdate;

  BookingHistory({
    this.id,
    this.patientName,
    this.location,
    this.stateName,
    this.cityName,
    this.patientRegNo,
    this.appointmentdate,
  });

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
        id: json["Id"],
        patientName: json["PatientName"],
        location: json["Location"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        patientRegNo: json["PatientRegNo"],
        appointmentdate: json["Appointmentdate"] == null
            ? null
            : DateTime.parse(json["Appointmentdate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "Location": location,
        "StateName": stateName,
        "CityName": cityName,
        "PatientRegNo": patientRegNo,
        "Appointmentdate": appointmentdate?.toIso8601String(),
      };
}

///

// PatientList patientListFromJson(String str) =>
//     PatientList.fromJson(json.decode(str));
//
// String patientListToJson(PatientList data) => json.encode(data.toJson());
//
// class PatientList {
//   PatientList({
//     this.message,
//     this.response,
//   });
//
//   String? message;
//   List<PatientListss>? response;
//
//   factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
//         message: json["Message"],
//         response: json["response"] == null
//             ? []
//             : List<PatientListss>.from(
//                 json["response"]!.map((x) => PatientListss.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Message": message,
//         "response": response == null
//             ? []
//             : List<dynamic>.from(response!.map((x) => x.toJson())),
//       };
// }
//
// class PatientListss {
//   PatientListss({
//     this.doctorId,
//     this.patientId,
//     this.patientName,
//     this.patientRegNo,
//   });
//
//   int? doctorId;
//   int? patientId;
//   String? patientName;
//   String? patientRegNo;
//
//   factory PatientListss.fromJson(Map<String, dynamic> json) => PatientListss(
//         doctorId: json["DoctorId"],
//         patientId: json["PatientId"],
//         patientName: json["PatientName"],
//         patientRegNo: json["PatientRegNo"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "DoctorId": doctorId,
//         "PatientId": patientId,
//         "PatientName": patientName,
//         "PatientRegNo": patientRegNo,
//       };
// }
