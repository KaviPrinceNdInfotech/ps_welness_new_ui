// To parse this JSON data, do
//
//     final onlineDrHistory = onlineDrHistoryFromJson(jsonString);

import 'dart:convert';

OnlineDrHistory onlineDrHistoryFromJson(String str) =>
    OnlineDrHistory.fromJson(json.decode(str));

String onlineDrHistoryToJson(OnlineDrHistory data) =>
    json.encode(data.toJson());

class OnlineDrHistory {
  List<Appointmentonline>? appointment2;

  OnlineDrHistory({
    this.appointment2,
  });

  factory OnlineDrHistory.fromJson(Map<String, dynamic> json) =>
      OnlineDrHistory(
        appointment2: json["Appointment"] == null
            ? []
            : List<Appointmentonline>.from(
                json["Appointment"]!.map((x) => Appointmentonline.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Appointment": appointment2 == null
            ? []
            : List<dynamic>.from(appointment2!.map((x) => x.toJson())),
      };
}

class Appointmentonline {
  String? doctorName;
  DateTime? appointmentDate;
  String? specialistName;
  DateTime? paymentDate;
  String? location;
  num? totalFee;
  String? slotTime;
  int? id;
  String? mobileNumber;
  String? deviceId;
  String? invoiceNumber;
  String? orderId;

  Appointmentonline({
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

  factory Appointmentonline.fromJson(Map<String, dynamic> json) =>
      Appointmentonline(
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
