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
///

// NurseAppointmentDetail nurseAppointmentDetailFromJson(String str) => NurseAppointmentDetail.fromJson(json.decode(str));
//
// String nurseAppointmentDetailToJson(NurseAppointmentDetail data) => json.encode(data.toJson());
//
// class NurseAppointmentDetail {
//   NurseAppointmentDetail({
//     this.result,
//   });
//
//   List<Result>? result;
//
//   factory NurseAppointmentDetail.fromJson(Map<String, dynamic> json) => NurseAppointmentDetail(
//     result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
//   };
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
//     serviceType: json["ServiceType"],
//     serviceTime: json["ServiceTime"],
//     id: json["Id"],
//     serviceStatus: json["ServiceStatus"],
//     nurseId: json["Nurse_Id"],
//     patientName: json["PatientName"],
//     registeredMobileNumber: json["RegisteredMobileNumber"],
//     contactNumber: json["ContactNumber"],
//     serviceTiming: json["ServiceTiming"],
//     serviceDate: json["ServiceDate"],
//     isPaid: json["IsPaid"],
//     paymentDate: json["PaymentDate"],
//     serviceAcceptanceDate: json["ServiceAcceptanceDate"],
//     requestDate: json["RequestDate"],
//     rDate: json["rDate"] == null ? null : DateTime.parse(json["rDate"]),
//     totalDays: json["TotalDays"],
//     totalFee: json["TotalFee"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "ServiceType": serviceType,
//     "ServiceTime": serviceTime,
//     "Id": id,
//     "ServiceStatus": serviceStatus,
//     "Nurse_Id": nurseId,
//     "PatientName": patientName,
//     "RegisteredMobileNumber": registeredMobileNumber,
//     "ContactNumber": contactNumber,
//     "ServiceTiming": serviceTiming,
//     "ServiceDate": serviceDate,
//     "IsPaid": isPaid,
//     "PaymentDate": paymentDate,
//     "ServiceAcceptanceDate": serviceAcceptanceDate,
//     "RequestDate": requestDate,
//     "rDate": rDate?.toIso8601String(),
//     "TotalDays": totalDays,
//     "TotalFee": totalFee,
//   };
// }


// To parse this JSON data, do
//
//     final nurseAppointmentDetail = nurseAppointmentDetailFromJson(jsonString);

import 'dart:convert';

NurseAppointmentDetail nurseAppointmentDetailFromJson(String str) => NurseAppointmentDetail.fromJson(json.decode(str));

String nurseAppointmentDetailToJson(NurseAppointmentDetail data) => json.encode(data.toJson());

class NurseAppointmentDetail {
  NurseAppointmentDetail({
    this.nurseAppointments,
  });

  List<NurseAppointment> ?nurseAppointments;

  factory NurseAppointmentDetail.fromJson(Map<String, dynamic> json) => NurseAppointmentDetail(
    nurseAppointments: List<NurseAppointment>.from(json["NurseAppointments"].map((x) => NurseAppointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "NurseAppointments": List<dynamic>.from(nurseAppointments!.map((x) => x.toJson())),
  };
}

class NurseAppointment {
  NurseAppointment({
    this.id,
    this.nurseName,
    this.location,
    this.startDate,
    this.endDate,
    this.paymentDate,
    this.fee,
    this.totalFee,
    this.totaNumberofdays,
  });

  int? id;
  String ?nurseName;
  String ?location;
  StartDate? startDate;
  EndDate ?endDate;
  DateTime ?paymentDate;
  double ?fee;
  double ?totalFee;
  int? totaNumberofdays;

  factory NurseAppointment.fromJson(Map<String, dynamic> json) => NurseAppointment(
    id: json["ID"],
    nurseName: json["NurseName"],
    location: json["Location"],
    startDate: startDateValues.map[json["StartDate"]],
    endDate: endDateValues.map[json["EndDate"]],
    paymentDate: DateTime.parse(json["PaymentDate"]),
    fee: json["Fee"],
    totalFee: json["TotalFee"],
    totaNumberofdays: json["TotaNumberofdays"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "NurseName": nurseName,
    "Location": location,
    "StartDate": startDateValues.reverse[startDate],
    "EndDate": endDateValues.reverse[endDate],
    "PaymentDate": paymentDate!.toIso8601String(),
    "Fee": fee,
    "TotalFee": totalFee,
    "TotaNumberofdays": totaNumberofdays,
  };
}

enum EndDate { THE_31052020 }

final endDateValues = EnumValues({
  "31/05/2020": EndDate.THE_31052020
});

enum StartDate { THE_29052020 }

final startDateValues = EnumValues({
  "29/05/2020": StartDate.THE_29052020
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}


