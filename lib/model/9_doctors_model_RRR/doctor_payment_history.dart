// To parse this JSON data, do
//
//     final doctorPaymentHistory = doctorPaymentHistoryFromJson(jsonString);

import 'dart:convert';

List<DoctorPaymentHistoryModel> doctorPaymentHistoryFromJson(String str) => List<DoctorPaymentHistoryModel>.from(json.decode(str).map((x) => DoctorPaymentHistoryModel.fromJson(x)));

String doctorPaymentHistoryToJson(List<DoctorPaymentHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorPaymentHistoryModel {
  int? id;
  String? patientName;
  String? location;
  num? amount;
  DateTime? paymentDate;
  num? paymentId;

  DoctorPaymentHistoryModel({
    this.id,
    this.patientName,
    this.location,
    this.amount,
    this.paymentDate,
    this.paymentId,
  });

  factory DoctorPaymentHistoryModel.fromJson(Map<String, dynamic> json) => DoctorPaymentHistoryModel(
    id: json["Id"],
    patientName: json["PatientName"],
    location: json["Location"],
    amount: json["Amount"],
    paymentDate: json["PaymentDate"] == null ? null : DateTime.parse(json["PaymentDate"]),
    paymentId: json["PaymentId"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PatientName": patientName,
    "Location": location,
    "Amount": amount,
    "PaymentDate": paymentDate?.toIso8601String(),
    "PaymentId": paymentId,
  };
}
