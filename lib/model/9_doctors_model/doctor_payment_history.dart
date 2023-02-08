// To parse this JSON data, do
//
//     final paymentHistory = paymentHistoryFromJson(jsonString);

import 'dart:convert';

List<PaymentHistory?>? paymentHistoryFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<PaymentHistory?>.from(
            json.decode(str)!.map((x) => PaymentHistory.fromJson(x)));

String paymentHistoryToJson(List<PaymentHistory?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class PaymentHistory {
  PaymentHistory({
    this.appointmentDate,
    this.amount,
  });

  DateTime? appointmentDate;
  int? amount;

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        appointmentDate: DateTime.parse(json["AppointmentDate"]),
        amount: json["Amount"],
      );

  Map<String, dynamic> toJson() => {
        "AppointmentDate": appointmentDate?.toIso8601String(),
        "Amount": amount,
      };
}
