// To parse this JSON data, do
//
//     final userDoctorAppointmentHistory = userDoctorAppointmentHistoryFromJson(jsonString);

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
  String? doctorName;
  DateTime? appointmentDate;
  String? specialistName;
  DateTime? paymentDate;
  String? location;
  num? totalFee;
  String? slotTime;
  num? id;
  String? mobileNumber;
  String? deviceId;
  String? invoiceNumber;
  String? orderId;

  Appointment({
    this.doctorName,
    this.appointmentDate,
    this.specialistName,
    this.paymentDate,
    this.location,
    this.totalFee,
    this.slotTime,
    this.id,
    this.mobileNumber,
    this.deviceId,
    this.invoiceNumber,
    this.orderId,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        doctorName: json["DoctorName"],
        appointmentDate: json["AppointmentDate"] == null
            ? null
            : DateTime.parse(json["AppointmentDate"]),
        specialistName: json["SpecialistName"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
        location: json["Location"],
        totalFee: json["TotalFee"],
        slotTime: json["SlotTime"],
        id: json["Id"],
        mobileNumber: json["MobileNumber"],
        deviceId: json["DeviceId"],
        invoiceNumber: json["InvoiceNumber"],
        orderId: json["OrderId"],
      );

  Map<String, dynamic> toJson() => {
        "DoctorName": doctorName,
        "AppointmentDate": appointmentDate?.toIso8601String(),
        "SpecialistName": specialistName,
        "PaymentDate": paymentDate?.toIso8601String(),
        "Location": location,
        "TotalFee": totalFee,
        "SlotTime": slotTime,
        "Id": id,
        "MobileNumber": mobileNumber,
        "DeviceId": deviceId,
        "InvoiceNumber": invoiceNumber,
        "OrderId": orderId,
      };
}
