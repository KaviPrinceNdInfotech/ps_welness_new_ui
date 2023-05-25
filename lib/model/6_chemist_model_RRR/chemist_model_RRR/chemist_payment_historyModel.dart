// To parse this JSON data, do
//
//     final chemistPaymentHistory = chemistPaymentHistoryFromJson(jsonString);

import 'dart:convert';

ChemistPaymentHistoryModel chemistPaymentHistoryFromJson(String str) => ChemistPaymentHistoryModel.fromJson(json.decode(str));

String chemistPaymentHistoryToJson(ChemistPaymentHistoryModel data) => json.encode(data.toJson());

class ChemistPaymentHistoryModel {
  List<Pay>? pay;

  ChemistPaymentHistoryModel({
    this.pay,
  });

  factory ChemistPaymentHistoryModel.fromJson(Map<String, dynamic> json) => ChemistPaymentHistoryModel(
    pay: json["pay"] == null ? [] : List<Pay>.from(json["pay"]!.map((x) => Pay.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pay": pay == null ? [] : List<dynamic>.from(pay!.map((x) => x.toJson())),
  };
}

class Pay {
  String? chemistName;
  String? branchName;
  num? amount;
  num? paymentId;
  DateTime? paymentDate;

  Pay({
    this.chemistName,
    this.branchName,
    this.amount,
    this.paymentId,
    this.paymentDate,
  });

  factory Pay.fromJson(Map<String, dynamic> json) => Pay(
    chemistName: json["ChemistName"],
    branchName: json["BranchName"],
    amount: json["Amount"],
    paymentId: json["PaymentId"],
    paymentDate: json["PaymentDate"] == null ? null : DateTime.parse(json["PaymentDate"]),
  );

  Map<String, dynamic> toJson() => {
    "ChemistName": chemistName,
    "BranchName": branchName,
    "Amount": amount,
    "PaymentId": paymentId,
    "PaymentDate": paymentDate?.toIso8601String(),
  };
}
