// To parse this JSON data, do
//
//     final onlineDoctorApt = onlineDoctorAptFromJson(jsonString);

import 'dart:convert';

OnlineDoctorApt onlineDoctorAptFromJson(String str) =>
    OnlineDoctorApt.fromJson(json.decode(str));

String onlineDoctorAptToJson(OnlineDoctorApt data) =>
    json.encode(data.toJson());

class OnlineDoctorApt {
  List<AppointmentDetailOnline>? appointmentDetail;

  OnlineDoctorApt({
    this.appointmentDetail,
  });

  factory OnlineDoctorApt.fromJson(Map<String, dynamic> json) =>
      OnlineDoctorApt(
        appointmentDetail: json["AppointmentDetail"] == null
            ? []
            : List<AppointmentDetailOnline>.from(json["AppointmentDetail"]!
                .map((x) => AppointmentDetailOnline.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AppointmentDetail": appointmentDetail == null
            ? []
            : List<dynamic>.from(appointmentDetail!.map((x) => x.toJson())),
      };
}

class AppointmentDetailOnline {
  int? id;
  String? patientName;
  String? location;
  String? slotTime;
  DateTime? appointmentdate;
  String? deviceId;
  String? mobileNumber;

  AppointmentDetailOnline({
    this.id,
    this.patientName,
    this.location,
    this.slotTime,
    this.appointmentdate,
    this.deviceId,
    this.mobileNumber,
  });

  factory AppointmentDetailOnline.fromJson(Map<String, dynamic> json) =>
      AppointmentDetailOnline(
        id: json["Id"],
        patientName: json["PatientName"],
        location: json["Location"],
        slotTime: json["SlotTime"],
        appointmentdate: json["Appointmentdate"] == null
            ? null
            : DateTime.parse(json["Appointmentdate"]),
        deviceId: json["DeviceId"],
        mobileNumber: json["MobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "Location": location,
        "SlotTime": slotTime,
        "Appointmentdate": appointmentdate?.toIso8601String(),
        "DeviceId": deviceId,
        "MobileNumber": mobileNumber,
      };
}
