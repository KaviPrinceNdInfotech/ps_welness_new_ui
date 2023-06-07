// To parse this JSON data, do
//
//     final userDoctorAppointmentHistory = userDoctorAppointmentHistoryFromJson(jsonString);
///

// import 'dart:convert';
//
// // UserDoctorAppointmentHistory userDoctorAppointmentHistoryFromJson(String str) => UserDoctorAppointmentHistory.fromJson(json.decode(str));
// //
// // String userDoctorAppointmentHistoryToJson(UserDoctorAppointmentHistory data) => json.encode(data.toJson());
// //
// // class UserDoctorAppointmentHistory {
// //   UserDoctorAppointmentHistory({
// //     required this.appointment,
// //   });
// //
// //   List<Appointment> appointment;
// //
// //   factory UserDoctorAppointmentHistory.fromJson(Map<String, dynamic> json) => UserDoctorAppointmentHistory(
// //     appointment: List<Appointment>.from(json["Appointment"].map((x) => Appointment.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "Appointment": List<dynamic>.from(appointment.map((x) => x.toJson())),
// //   };
// // }
// //
// // class Appointment {
// //   Appointment({
// //     required this.doctorId,
// //     required this.doctorName,
// //     required this.clinicName,
// //     required this.clinicAddress,
// //     required this.phoneNo,
// //     required this.mobileNo,
// //     required this.appointmentDate,
// //     required this.specility,
// //     required this.appointedTime,
// //     this.stateName,
// //     this.cityName,
// //     required this.amount,
// //     required this.appointmentId,
// //     required this.specialistId,
// //     required this.isCancelled,
// //     required this.startTime,
// //   });
// //
// //   int doctorId;
// //   String doctorName;
// //   String clinicName;
// //   String clinicAddress;
// //   String phoneNo;
// //   String mobileNo;
// //   DateTime appointmentDate;
// //   String specility;
// //   String appointedTime;
// //   dynamic stateName;
// //   dynamic cityName;
// //   double amount;
// //   int appointmentId;
// //   int specialistId;
// //   bool isCancelled;
// //   String startTime;
// //
// //   factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
// //     doctorId: json["Doctor_Id"],
// //     doctorName: json["DoctorName"],
// //     clinicName: json["ClinicName"],
// //     clinicAddress: json["ClinicAddress"],
// //     phoneNo: json["PhoneNo"],
// //     mobileNo: json["MobileNo"],
// //     appointmentDate: DateTime.parse(json["AppointmentDate"]),
// //     specility: json["Specility"],
// //     appointedTime: json["AppointedTime"],
// //     stateName: json["StateName"],
// //     cityName: json["CityName"],
// //     amount: json["Amount"],
// //     appointmentId: json["AppointmentId"],
// //     specialistId: json["Specialist_Id"],
// //     isCancelled: json["IsCancelled"],
// //     startTime: json["StartTime"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "Doctor_Id": doctorId,
// //     "DoctorName": doctorName,
// //     "ClinicName": clinicName,
// //     "ClinicAddress": clinicAddress,
// //     "PhoneNo": phoneNo,
// //     "MobileNo": mobileNo,
// //     "AppointmentDate": appointmentDate.toIso8601String(),
// //     "Specility": specility,
// //     "AppointedTime": appointedTime,
// //     "StateName": stateName,
// //     "CityName": cityName,
// //     "Amount": amount,
// //     "AppointmentId": appointmentId,
// //     "Specialist_Id": specialistId,
// //     "IsCancelled": isCancelled,
// //     "StartTime": startTime,
// //   };
// // }
//
// // To parse this JSON data, do
// //
// //     final userDoctorAppointmentHistory = userDoctorAppointmentHistoryFromJson(jsonString);
//
// import 'dart:convert';
//
// UserDoctorAppointmentHistory userDoctorAppointmentHistoryFromJson(String str) => UserDoctorAppointmentHistory.fromJson(json.decode(str));
//
// String userDoctorAppointmentHistoryToJson(UserDoctorAppointmentHistory data) => json.encode(data.toJson());
//
// class UserDoctorAppointmentHistory {
//   UserDoctorAppointmentHistory({
//     this.appointment,
//   });
//
//   List<Appointment>? appointment;
//
//   factory UserDoctorAppointmentHistory.fromJson(Map<String, dynamic> json) => UserDoctorAppointmentHistory(
//     appointment: json["Appointment"] == null ? [] : List<Appointment>.from(json["Appointment"]!.map((x) => Appointment.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Appointment": appointment == null ? [] : List<dynamic>.from(appointment!.map((x) => x.toJson())),
//   };
// }
//
// class Appointment {
//   Appointment({
//     this.doctorId,
//     this.doctorName,
//     this.clinicAddress,
//     this.appointmentDate,
//     this.specility,
//     this.appointedTime,
//     this.amount,
//     this.appointmentId,
//     this.specialistId,
//     this.isCancelled,
//     this.startTime,
//   });
//
//   int? doctorId;
//   String? doctorName;
//   String? clinicAddress;
//   DateTime? appointmentDate;
//   String? specility;
//   String? appointedTime;
//   double? amount;
//   int? appointmentId;
//   int? specialistId;
//   bool? isCancelled;
//   String? startTime;
//
//   factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
//     doctorId: json["Doctor_Id"],
//     doctorName: json["DoctorName"],
//     clinicAddress: json["ClinicAddress"],
//     appointmentDate: json["AppointmentDate"] == null ? null : DateTime.parse(json["AppointmentDate"]),
//     specility: json["Specility"],
//     appointedTime: json["AppointedTime"],
//     amount: json["Amount"],
//     appointmentId: json["AppointmentId"],
//     specialistId: json["Specialist_Id"],
//     isCancelled: json["IsCancelled"],
//     startTime: json["StartTime"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Doctor_Id": doctorId,
//     "DoctorName": doctorName,
//     "ClinicAddress": clinicAddress,
//     "AppointmentDate": appointmentDate?.toIso8601String(),
//     "Specility": specility,
//     "AppointedTime": appointedTime,
//     "Amount": amount,
//     "AppointmentId": appointmentId,
//     "Specialist_Id": specialistId,
//     "IsCancelled": isCancelled,
//     "StartTime": startTime,
//   };
// }

///...
///
import 'dart:convert';

UserDoctorAppointmentHistory userDoctorAppointmentHistoryFromJson(String str) =>
    UserDoctorAppointmentHistory.fromJson(json.decode(str));

String userDoctorAppointmentHistoryToJson(UserDoctorAppointmentHistory data) =>
    json.encode(data.toJson());

class UserDoctorAppointmentHistory {
  List<Appointment>? appointment;

  UserDoctorAppointmentHistory({
    this.appointment,
  });

  factory UserDoctorAppointmentHistory.fromJson(Map<String, dynamic> json) =>
      UserDoctorAppointmentHistory(
        appointment: json["Appointment"] == null
            ? []
            : List<Appointment>.from(
                json["Appointment"]!.map((x) => Appointment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Appointment": appointment == null
            ? []
            : List<dynamic>.from(appointment!.map((x) => x.toJson())),
      };
}

class Appointment {
  int? doctorId;
  String? doctorName;
  dynamic location;
  dynamic mobileNumber;
  DateTime? appointmentDate;
  dynamic specialistName;
  String? specility;
  String? appointedTime;
  int? patientId;
  double? totalFee;
  int? appointmentId;
  int? specialistId;
  bool? isCancelled;
  String? startTime;

  Appointment({
    this.doctorId,
    this.doctorName,
    this.location,
    this.mobileNumber,
    this.appointmentDate,
    this.specialistName,
    this.specility,
    this.appointedTime,
    this.patientId,
    this.totalFee,
    this.appointmentId,
    this.specialistId,
    this.isCancelled,
    this.startTime,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        doctorId: json["Doctor_Id"],
        doctorName: json["DoctorName"],
        location: json["Location"],
        mobileNumber: json["MobileNumber"],
        appointmentDate: json["AppointmentDate"] == null
            ? null
            : DateTime.parse(json["AppointmentDate"]),
        specialistName: json["SpecialistName"],
        specility: json["Specility"],
        appointedTime: json["AppointedTime"],
        patientId: json["Patient_Id"],
        totalFee: json["TotalFee"],
        appointmentId: json["AppointmentId"],
        specialistId: json["Specialist_Id"],
        isCancelled: json["IsCancelled"],
        startTime: json["StartTime"],
      );

  Map<String, dynamic> toJson() => {
        "Doctor_Id": doctorId,
        "DoctorName": doctorName,
        "Location": location,
        "MobileNumber": mobileNumber,
        "AppointmentDate": appointmentDate?.toIso8601String(),
        "SpecialistName": specialistName,
        "Specility": specility,
        "AppointedTime": appointedTime,
        "Patient_Id": patientId,
        "TotalFee": totalFee,
        "AppointmentId": appointmentId,
        "Specialist_Id": specialistId,
        "IsCancelled": isCancelled,
        "StartTime": startTime,
      };
}
