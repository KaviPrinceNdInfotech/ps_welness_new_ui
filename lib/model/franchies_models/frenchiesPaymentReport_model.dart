// To parse this JSON data, do
//
//     final frenchiesPaymentReportModel = frenchiesPaymentReportModelFromJson(jsonString);

import 'dart:convert';

FrenchiesPaymentReportModel frenchiesPaymentReportModelFromJson(String str) => FrenchiesPaymentReportModel.fromJson(json.decode(str));

String frenchiesPaymentReportModelToJson(FrenchiesPaymentReportModel data) => json.encode(data.toJson());

class FrenchiesPaymentReportModel {
  List<PaymentHistory>? paymentHistory;

  FrenchiesPaymentReportModel({
    this.paymentHistory,
  });

  factory FrenchiesPaymentReportModel.fromJson(Map<String, dynamic> json) => FrenchiesPaymentReportModel(
    paymentHistory: json["PaymentHistory"] == null ? [] : List<PaymentHistory>.from(json["PaymentHistory"]!.map((x) => PaymentHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PaymentHistory": paymentHistory == null ? [] : List<dynamic>.from(paymentHistory!.map((x) => x.toJson())),
  };
}

class PaymentHistory {
  int? id;
  String? name;
  num? paidFees;
  num? paymentId;
  String? location;
  String? paymentDate;
  String? paymentTime;

  PaymentHistory({
    this.id,
    this.name,
    this.paidFees,
    this.paymentId,
    this.location,
    this.paymentDate,
    this.paymentTime,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
    id: json["Id"],
    name: json["Name"],
    paidFees: json["PaidFees"],
    paymentId: json["PaymentId"],
    location: json["Location"],
    paymentDate: json["PaymentDate"],
    paymentTime: json["PaymentTime"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "PaidFees": paidFees,
    "PaymentId": paymentId,
    "Location": location,
    "PaymentDate": paymentDate,
    "PaymentTime": paymentTime,
  };
}
