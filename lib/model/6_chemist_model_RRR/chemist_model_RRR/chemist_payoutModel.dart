// To parse this JSON data, do
//
//     final chemistPayout = chemistPayoutFromJson(jsonString);

import 'dart:convert';

ChemistPayoutModel chemistPayoutFromJson(String str) => ChemistPayoutModel.fromJson(json.decode(str));

String chemistPayoutToJson(ChemistPayoutModel data) => json.encode(data.toJson());

class ChemistPayoutModel {
  List<Payout>? payout;

  ChemistPayoutModel({
    this.payout,
  });

  factory ChemistPayoutModel.fromJson(Map<String, dynamic> json) => ChemistPayoutModel(
    payout: json["payout"] == null ? [] : List<Payout>.from(json["payout"]!.map((x) => Payout.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "payout": payout == null ? [] : List<dynamic>.from(payout!.map((x) => x.toJson())),
  };
}

class Payout {
  String? chemistName;
  num? amount;
  DateTime? paymentDate;

  Payout({
    this.chemistName,
    this.amount,
    this.paymentDate,
  });

  factory Payout.fromJson(Map<String, dynamic> json) => Payout(
    chemistName: json["ChemistName"],
    amount: json["Amount"],
    paymentDate: json["PaymentDate"] == null ? null : DateTime.parse(json["PaymentDate"]),
  );

  Map<String, dynamic> toJson() => {
    "ChemistName": chemistName,
    "Amount": amount,
    "PaymentDate": paymentDate?.toIso8601String(),
  };
}
