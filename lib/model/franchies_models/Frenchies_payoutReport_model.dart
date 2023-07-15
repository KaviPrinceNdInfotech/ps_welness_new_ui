// To parse this JSON data, do
//
//     final frenchiesPayoutReportModel = frenchiesPayoutReportModelFromJson(jsonString);

import 'dart:convert';

FrenchiesPayoutReportModel frenchiesPayoutReportModelFromJson(String str) => FrenchiesPayoutReportModel.fromJson(json.decode(str));

String frenchiesPayoutReportModelToJson(FrenchiesPayoutReportModel data) => json.encode(data.toJson());

class FrenchiesPayoutReportModel {
  List<PayoutHistory>? payoutHistory;

  FrenchiesPayoutReportModel({
    this.payoutHistory,
  });

  factory FrenchiesPayoutReportModel.fromJson(Map<String, dynamic> json) => FrenchiesPayoutReportModel(
    payoutHistory: json["PayoutHistory"] == null ? [] : List<PayoutHistory>.from(json["PayoutHistory"]!.map((x) => PayoutHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PayoutHistory": payoutHistory == null ? [] : List<dynamic>.from(payoutHistory!.map((x) => x.toJson())),
  };
}

class PayoutHistory {
  int? id;
  String? vendorName;
  num? amount;
  DateTime? paymentDate;
  String? location;

  PayoutHistory({
    this.id,
    this.vendorName,
    this.amount,
    this.paymentDate,
    this.location,
  });

  factory PayoutHistory.fromJson(Map<String, dynamic> json) => PayoutHistory(
    id: json["Id"],
    vendorName: json["VendorName"],
    amount: json["Amount"],
    paymentDate: json["PaymentDate"] == null ? null : DateTime.parse(json["PaymentDate"]),
    location: json["Location"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "VendorName": vendorName,
    "Amount": amount,
    "PaymentDate": paymentDate?.toIso8601String(),
    "Location": location,
  };
}
