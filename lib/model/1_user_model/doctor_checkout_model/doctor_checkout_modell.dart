// // To parse this JSON data, do
// //
// //     final doctorCheckoutModel = doctorCheckoutModelFromJson(jsonString);
//
// import 'dart:convert';
//
// DoctorCheckoutModel doctorCheckoutModelFromJson(String str) =>
//     DoctorCheckoutModel.fromJson(json.decode(str));
//
// String doctorCheckoutModelToJson(DoctorCheckoutModel data) =>
//     json.encode(data.toJson());
//
// class DoctorCheckoutModel {
//   final int? id;
//   final String? doctorName;
//   final String? specialistName;
//   final int? experience;
//   final double? fee;
//   final DateTime? appointmentDate;
//   final String? slotTime;
//
//   DoctorCheckoutModel({
//     this.id,
//     this.doctorName,
//     this.specialistName,
//     this.experience,
//     this.fee,
//     this.appointmentDate,
//     this.slotTime,
//   });
//
//   factory DoctorCheckoutModel.fromJson(Map<String, dynamic> json) =>
//       DoctorCheckoutModel(
//         id: json["Id"],
//         doctorName: json["DoctorName"],
//         specialistName: json["SpecialistName"],
//         experience: json["Experience"],
//         fee: json["Fee"],
//         appointmentDate: DateTime.parse(json["AppointmentDate"]),
//         slotTime: json["SlotTime"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DoctorName": doctorName,
//         "SpecialistName": specialistName,
//         "Experience": experience,
//         "Fee": fee,
//         "AppointmentDate": appointmentDate!.toIso8601String(),
//         "SlotTime": slotTime,
//       };
// }

// To parse this JSON data, do
//
//     final doctorCheckoutModel = doctorCheckoutModelFromJson(jsonString);
///

// import 'dart:convert';
//
// DoctorCheckoutModel doctorCheckoutModelFromJson(String str) =>
//     DoctorCheckoutModel.fromJson(json.decode(str));
//
// String doctorCheckoutModelToJson(DoctorCheckoutModel data) =>
//     json.encode(data.toJson());
//
// class DoctorCheckoutModel {
//   int? id;
//   String? doctorName;
//   String? specialistName;
//   num? experience;
//   num? fee;
//   dynamic appointmentDate;
//   String? slotTime;
//
//   DoctorCheckoutModel({
//     this.id,
//     this.doctorName,
//     this.specialistName,
//     this.experience,
//     this.fee,
//     this.appointmentDate,
//     this.slotTime,
//   });
//
//   factory DoctorCheckoutModel.fromJson(Map<String, dynamic> json) =>
//       DoctorCheckoutModel(
//         id: json["Id"],
//         doctorName: json["DoctorName"],
//         specialistName: json["SpecialistName"],
//         experience: json["Experience"],
//         fee: json["Fee"],
//         appointmentDate: json["AppointmentDate"],
//         slotTime: json["SlotTime"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DoctorName": doctorName,
//         "SpecialistName": specialistName,
//         "Experience": experience,
//         "Fee": fee,
//         "AppointmentDate": appointmentDate,
//         "SlotTime": slotTime,
//       };
// }
///
///
import 'dart:convert';

DoctorCheckoutModel doctorCheckoutModelFromJson(String str) =>
    DoctorCheckoutModel.fromJson(json.decode(str));

String doctorCheckoutModelToJson(DoctorCheckoutModel data) =>
    json.encode(data.toJson());

class DoctorCheckoutModel {
  int? id;
  String? doctorName;
  String? specialistName;
  int? experience;
  num? fee;
  num? totalFee;
  DateTime? appointmentDate;
  String? slotTime;

  DoctorCheckoutModel({
    this.id,
    this.doctorName,
    this.specialistName,
    this.experience,
    this.fee,
    this.totalFee,
    this.appointmentDate,
    this.slotTime,
  });

  factory DoctorCheckoutModel.fromJson(Map<String, dynamic> json) =>
      DoctorCheckoutModel(
        id: json["Id"],
        doctorName: json["DoctorName"],
        specialistName: json["SpecialistName"],
        experience: json["Experience"],
        fee: json["Fee"],
        totalFee: json["TotalFee"],
        appointmentDate: json["AppointmentDate"] == null
            ? null
            : DateTime.parse(json["AppointmentDate"]),
        slotTime: json["SlotTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DoctorName": doctorName,
        "SpecialistName": specialistName,
        "Experience": experience,
        "Fee": fee,
        "TotalFee": totalFee,
        "AppointmentDate": appointmentDate?.toIso8601String(),
        "SlotTime": slotTime,
      };
}
