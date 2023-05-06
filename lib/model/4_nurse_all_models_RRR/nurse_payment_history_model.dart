// To parse this JSON data, do
//
//     final nursePaymentHistory = nursePaymentHistoryFromJson(jsonString);

import 'dart:convert';

List<NursePaymentHistoryModel> nursePaymentHistoryFromJson(String str) => List<NursePaymentHistoryModel>.from(json.decode(str).map((x) => NursePaymentHistoryModel.fromJson(x)));

String nursePaymentHistoryToJson(List<NursePaymentHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NursePaymentHistoryModel {
  NursePaymentHistoryModel({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.amount,
    this.paymentDate,
  });

  int? id;
  String? patientName;
  String? mobileNumber;
  num? amount;
  DateTime? paymentDate;

  factory NursePaymentHistoryModel.fromJson(Map<String, dynamic> json) => NursePaymentHistoryModel(
    id: json["Id"],
    patientName: json["PatientName"],
    mobileNumber: json["MobileNumber"],
    amount: json["Amount"],
    paymentDate: json["PaymentDate"] == null ? null : DateTime.parse(json["PaymentDate"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PatientName": patientName,
    "MobileNumber": mobileNumber,
    "Amount": amount,
    "PaymentDate": paymentDate?.toIso8601String(),
  };
}
