// // To parse this JSON data, do
// //
// //     final nurseAppointment = nurseAppointmentFromJson(jsonString);
//
// import 'dart:convert';
//
// List<NurseAppointment?>? nurseAppointmentFromJson(String str) =>
//     json.decode(str) != null
//         ? []
//         : List<NurseAppointment?>.from(
//             json.decode(str)!.map((x) => NurseAppointment.fromJson(x)));
//
// String nurseAppointmentToJson(List<NurseAppointment?>? data) => json.encode(
//     data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));
//
// class NurseAppointment {
//   NurseAppointment({
//     this.id,
//     this.locationName,
//     this.nurseId,
//     this.patientId,
//     this.mobileNumber,
//     this.startDate,
//     this.endDate,
//     this.serviceDate,
//     this.isPaid,
//     this.paymentDate,
//     this.serviceAcceptanceDate,
//     this.requestDate,
//     this.patientName,
//     this.serviceStatus,
//     this.serviceType,
//     this.serviceTime,
//   });
//
//   int? id;
//   String? locationName;
//   dynamic nurseId;
//   int? patientId;
//   String? mobileNumber;
//   dynamic startDate;
//   dynamic endDate;
//   DateTime? serviceDate;
//   bool? isPaid;
//   dynamic paymentDate;
//   dynamic serviceAcceptanceDate;
//   DateTime? requestDate;
//   String? patientName;
//   String? serviceStatus;
//   String? serviceType;
//   String? serviceTime;
//
//   factory NurseAppointment.fromJson(Map<String, dynamic> json) =>
//       NurseAppointment(
//         id: json["Id"],
//         locationName: json["LocationName"],
//         nurseId: json["Nurse_Id"],
//         patientId: json["Patient_Id"],
//         mobileNumber: json["MobileNumber"],
//         startDate: json["StartDate"],
//         endDate: json["EndDate"],
//         serviceDate: DateTime.parse(json["ServiceDate"]),
//         isPaid: json["IsPaid"],
//         paymentDate: json["PaymentDate"],
//         serviceAcceptanceDate: json["ServiceAcceptanceDate"],
//         requestDate: DateTime.parse(json["RequestDate"]),
//         patientName: json["PatientName"],
//         serviceStatus: json["ServiceStatus"],
//         serviceType: json["ServiceType"],
//         serviceTime: json["ServiceTime"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "LocationName": locationName,
//         "Nurse_Id": nurseId,
//         "Patient_Id": patientId,
//         "MobileNumber": mobileNumber,
//         "StartDate": startDate,
//         "EndDate": endDate,
//         "ServiceDate": serviceDate?.toIso8601String(),
//         "IsPaid": isPaid,
//         "PaymentDate": paymentDate,
//         "ServiceAcceptanceDate": serviceAcceptanceDate,
//         "RequestDate": requestDate?.toIso8601String(),
//         "PatientName": patientName,
//         "ServiceStatus": serviceStatus,
//         "ServiceType": serviceType,
//         "ServiceTime": serviceTime,
//       };
// }
