// // import 'dart:convert';
// //
// // List<NurseAppointmentHistoryModel> nurseAppointmentHistoryFromJson(String str) => List<NurseAppointmentHistoryModel>.from(json.decode(str).map((x) => NurseAppointmentHistoryModel.fromJson(x)));
// //
// // String nurseAppointmentHistoryToJson(List<NurseAppointmentHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// //
// // class NurseAppointmentHistoryModel {
// //   NurseAppointmentHistoryModel({
// //     this.id,
// //     this.patientName,
// //     this.mobileNumber,
// //     this.location,
// //     this.amount,
// //     this.startSlotTime,
// //     this.endSlotTime,
// //   });
// //
// //   int? id;
// //   String? patientName;
// //   String? mobileNumber;
// //   String? location;
// //   num? amount;
// //   String? startSlotTime;
// //   String? endSlotTime;
// //
// //   factory NurseAppointmentHistoryModel.fromJson(Map<String, dynamic> json) => NurseAppointmentHistoryModel(
// //     id: json["id"],
// //     patientName: json["PatientName"],
// //     mobileNumber: json["MobileNumber"],
// //     location: json["Location"],
// //     amount: json["Amount"],
// //     startSlotTime: json["StartSlotTime"],
// //     endSlotTime: json["EndSlotTime"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "PatientName": patientName,
// //     "MobileNumber": mobileNumber,
// //     "Location": location,
// //     "Amount": amount,
// //     "StartSlotTime": startSlotTime,
// //     "EndSlotTime": endSlotTime,
// //   };
// // }
// ///
// /// import 'dart:convert';
//
// NurseAppointmentHistoryModel nurseAppointmentHistoryModelFromJson(String str) =>
//     NurseAppointmentHistoryModel.fromJson(json.decode(str));
//
// String nurseAppointmentHistoryModelToJson(NurseAppointmentHistoryModel data) =>
//     json.encode(data.toJson());
//
// class NurseAppointmentHistoryModel {
//   List<Datum>? data;
//
//   NurseAppointmentHistoryModel({
//     this.data,
//   });
//
//   factory NurseAppointmentHistoryModel.fromJson(Map<String, dynamic> json) =>
//       NurseAppointmentHistoryModel(
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
//
// class Datum {
//   int? id;
//   String? patientName;
//   String? mobileNumber;
//   String? location;
//   num? amount;
//   String? startSlotTime;
//   String? endSlotTime;
//
//   Datum({
//     this.id,
//     this.patientName,
//     this.mobileNumber,
//     this.location,
//     this.amount,
//     this.startSlotTime,
//     this.endSlotTime,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         patientName: json["PatientName"],
//         mobileNumber: json["MobileNumber"],
//         location: json["Location"],
//         amount: json["Amount"],
//         startSlotTime: json["StartSlotTime"],
//         endSlotTime: json["EndSlotTime"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "PatientName": patientName,
//         "MobileNumber": mobileNumber,
//         "Location": location,
//         "Amount": amount,
//         "StartSlotTime": startSlotTime,
//         "EndSlotTime": endSlotTime,
//       };
// }
