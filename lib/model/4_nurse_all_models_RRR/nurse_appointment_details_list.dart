// To parse this JSON data, do
//
//     final nurseAppointmentDetail = nurseAppointmentDetailFromJson(jsonString);
///

// import 'dart:convert';
//
// NurseAppointmentDetail nurseAppointmentDetailFromJson(String str) =>
//     NurseAppointmentDetail.fromJson(json.decode(str));
//
// String nurseAppointmentDetailToJson(NurseAppointmentDetail data) =>
//     json.encode(data.toJson());
//
// class NurseAppointmentDetail {
//   NurseAppointmentDetail({
//     this.result,
//   });
//
//   List<Result>? result;
//
//   factory NurseAppointmentDetail.fromJson(Map<String, dynamic> json) =>
//       NurseAppointmentDetail(
//         result: json["result"] == null
//             ? []
//             : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": result == null
//             ? []
//             : List<dynamic>.from(result!.map((x) => x.toJson())),
//       };
// }
//
// class Result {
//   Result({
//     this.serviceType,
//     this.serviceTime,
//     this.id,
//     this.serviceStatus,
//     this.nurseId,
//     this.patientName,
//     this.registeredMobileNumber,
//     this.contactNumber,
//     this.serviceTiming,
//     this.serviceDate,
//     this.isPaid,
//     this.paymentDate,
//     this.serviceAcceptanceDate,
//     this.requestDate,
//     this.rDate,
//     this.totalDays,
//     this.totalFee,
//   });
//
//   dynamic serviceType;
//   dynamic serviceTime;
//   dynamic id;
//   dynamic serviceStatus;
//   dynamic nurseId;
//   String? patientName;
//   String? registeredMobileNumber;
//   String? contactNumber;
//   String? serviceTiming;
//   dynamic serviceDate;
//   bool? isPaid;
//   String? paymentDate;
//   String? serviceAcceptanceDate;
//   String? requestDate;
//   DateTime? rDate;
//   int? totalDays;
//   double? totalFee;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         serviceType: json["ServiceType"],
//         serviceTime: json["ServiceTime"],
//         id: json["Id"],
//         serviceStatus: json["ServiceStatus"],
//         nurseId: json["Nurse_Id"],
//         patientName: json["PatientName"],
//         registeredMobileNumber: json["RegisteredMobileNumber"],
//         contactNumber: json["ContactNumber"],
//         serviceTiming: json["ServiceTiming"],
//         serviceDate: json["ServiceDate"],
//         isPaid: json["IsPaid"],
//         paymentDate: json["PaymentDate"],
//         serviceAcceptanceDate: json["ServiceAcceptanceDate"],
//         requestDate: json["RequestDate"],
//         rDate: json["rDate"] == null ? null : DateTime.parse(json["rDate"]),
//         totalDays: json["TotalDays"],
//         totalFee: json["TotalFee"],
//
//       );
//
//   Map<String, dynamic> toJson() => {
//         "ServiceType": serviceType,
//         "ServiceTime": serviceTime,
//         "Id": id,
//         "ServiceStatus": serviceStatus,
//         "Nurse_Id": nurseId,
//         "PatientName": patientName,
//         "RegisteredMobileNumber": registeredMobileNumber,
//         "ContactNumber": contactNumber,
//         "ServiceTiming": serviceTiming,
//         "ServiceDate": serviceDate,
//         "IsPaid": isPaid,
//         "PaymentDate": paymentDate,
//         "ServiceAcceptanceDate": serviceAcceptanceDate,
//         "RequestDate": requestDate,
//         "rDate": rDate?.toIso8601String(),
//         "TotalDays": totalDays,
//         "TotalFee": totalFee,
//       };
// }
/// new 4 feb 2023....................

// To parse this JSON data, do
//
//     final nurseAppointmentDetail = nurseAppointmentDetailFromJson(jsonString);

import 'dart:convert';

NurseAppointmentDetail nurseAppointmentDetailFromJson(String str) => NurseAppointmentDetail.fromJson(json.decode(str));

String nurseAppointmentDetailToJson(NurseAppointmentDetail data) => json.encode(data.toJson());

class NurseAppointmentDetail {
  NurseAppointmentDetail({
    this.result,
  });

  List<Result>? result;

  factory NurseAppointmentDetail.fromJson(Map<String, dynamic> json) => NurseAppointmentDetail(
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.serviceType,
    this.serviceTime,
    this.id,
    this.serviceStatus,
    this.nurseId,
    this.patientName,
    this.registeredMobileNumber,
    this.contactNumber,
    this.serviceTiming,
    this.serviceDate,
    this.isPaid,
    this.paymentDate,
    this.serviceAcceptanceDate,
    this.requestDate,
    this.rDate,
    this.totalDays,
    this.totalFee,
  });

  dynamic serviceType;
  dynamic serviceTime;
  dynamic id;
  dynamic serviceStatus;
  dynamic nurseId;
  String? patientName;
  String? registeredMobileNumber;
  String? contactNumber;
  String? serviceTiming;
  dynamic serviceDate;
  bool? isPaid;
  String? paymentDate;
  String? serviceAcceptanceDate;
  String? requestDate;
  DateTime? rDate;
  int? totalDays;
  double? totalFee;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    serviceType: json["ServiceType"],
    serviceTime: json["ServiceTime"],
    id: json["Id"],
    serviceStatus: json["ServiceStatus"],
    nurseId: json["Nurse_Id"],
    patientName: json["PatientName"],
    registeredMobileNumber: json["RegisteredMobileNumber"],
    contactNumber: json["ContactNumber"],
    serviceTiming: json["ServiceTiming"],
    serviceDate: json["ServiceDate"],
    isPaid: json["IsPaid"],
    paymentDate: json["PaymentDate"],
    serviceAcceptanceDate: json["ServiceAcceptanceDate"],
    requestDate: json["RequestDate"],
    rDate: json["rDate"] == null ? null : DateTime.parse(json["rDate"]),
    totalDays: json["TotalDays"],
    totalFee: json["TotalFee"],
  );

  Map<String, dynamic> toJson() => {
    "ServiceType": serviceType,
    "ServiceTime": serviceTime,
    "Id": id,
    "ServiceStatus": serviceStatus,
    "Nurse_Id": nurseId,
    "PatientName": patientName,
    "RegisteredMobileNumber": registeredMobileNumber,
    "ContactNumber": contactNumber,
    "ServiceTiming": serviceTiming,
    "ServiceDate": serviceDate,
    "IsPaid": isPaid,
    "PaymentDate": paymentDate,
    "ServiceAcceptanceDate": serviceAcceptanceDate,
    "RequestDate": requestDate,
    "rDate": rDate?.toIso8601String(),
    "TotalDays": totalDays,
    "TotalFee": totalFee,
  };
}

