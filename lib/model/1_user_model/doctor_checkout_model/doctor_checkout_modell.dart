// To parse this JSON data, do
//
//     final doctorCheckoutModel = doctorCheckoutModelFromJson(jsonString);

import 'dart:convert';

DoctorCheckoutModel doctorCheckoutModelFromJson(String str) =>
    DoctorCheckoutModel.fromJson(json.decode(str));

String doctorCheckoutModelToJson(DoctorCheckoutModel data) =>
    json.encode(data.toJson());

class DoctorCheckoutModel {
  num? id;
  String? doctorName;
  num? gst;
  String? specialistName;
  num? experience;
  num? fee;
  num? totalFee;
  DateTime? appointmentDate;
  String? slotTime;
  String? deviceId;

  DoctorCheckoutModel({
    this.id,
    this.doctorName,
    this.gst,
    this.specialistName,
    this.experience,
    this.fee,
    this.totalFee,
    this.appointmentDate,
    this.slotTime,
    this.deviceId,
  });

  factory DoctorCheckoutModel.fromJson(Map<String, dynamic> json) =>
      DoctorCheckoutModel(
        id: json["Id"],
        doctorName: json["DoctorName"],
        gst: json["GST"],
        specialistName: json["SpecialistName"],
        experience: json["Experience"],
        fee: json["Fee"],
        totalFee: json["TotalFee"],
        appointmentDate: json["AppointmentDate"] == null
            ? null
            : DateTime.parse(json["AppointmentDate"]),
        slotTime: json["SlotTime"],
        deviceId: json["DeviceId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DoctorName": doctorName,
        "GST": gst,
        "SpecialistName": specialistName,
        "Experience": experience,
        "Fee": fee,
        "TotalFee": totalFee,
        "AppointmentDate": appointmentDate?.toIso8601String(),
        "SlotTime": slotTime,
        "DeviceId": deviceId,
      };
}
