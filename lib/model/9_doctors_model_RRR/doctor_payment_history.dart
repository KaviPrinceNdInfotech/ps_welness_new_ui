// To parse this JSON data, do
//
//     final doctorPaymentHistoryModel = doctorPaymentHistoryModelFromJson(jsonString);

import 'dart:convert';

DoctorPaymentHistoryModel doctorPaymentHistoryModelFromJson(String str) =>
    DoctorPaymentHistoryModel.fromJson(json.decode(str));

String doctorPaymentHistoryModelToJson(DoctorPaymentHistoryModel data) =>
    json.encode(data.toJson());

class DoctorPaymentHistoryModel {
  List<PaymentHistory>? paymentHistory;

  DoctorPaymentHistoryModel({
    this.paymentHistory,
  });

  factory DoctorPaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      DoctorPaymentHistoryModel(
        paymentHistory: json["PaymentHistory"] == null
            ? []
            : List<PaymentHistory>.from(
                json["PaymentHistory"]!.map((x) => PaymentHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PaymentHistory": paymentHistory == null
            ? []
            : List<dynamic>.from(paymentHistory!.map((x) => x.toJson())),
      };
}

class PaymentHistory {
  int? id;
  String? patientName;
  String? location;
  num? amount;
  DateTime? paymentDate;
  num? paymentId;

  PaymentHistory({
    this.id,
    this.patientName,
    this.location,
    this.amount,
    this.paymentDate,
    this.paymentId,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        id: json["Id"],
        patientName: json["PatientName"],
        location: json["Location"],
        amount: json["Amount"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
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
