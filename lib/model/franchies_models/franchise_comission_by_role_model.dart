// To parse this JSON data, do
//
//     final frenchieCommisionReportModel = frenchieCommisionReportModelFromJson(jsonString);

import 'dart:convert';

FrenchieCommisionReportModelbyRole frenchieCommisionReportModelFromJson(
        String str) =>
    FrenchieCommisionReportModelbyRole.fromJson(json.decode(str));

String frenchieCommisionReportModelToJson(
        FrenchieCommisionReportModelbyRole data) =>
    json.encode(data.toJson());

class FrenchieCommisionReportModelbyRole {
  List<CommissionReport>? commissionReport;

  FrenchieCommisionReportModelbyRole({
    this.commissionReport,
  });

  factory FrenchieCommisionReportModelbyRole.fromJson(
          Map<String, dynamic> json) =>
      FrenchieCommisionReportModelbyRole(
        commissionReport: json["CommissionReport"] == null
            ? []
            : List<CommissionReport>.from(json["CommissionReport"]!
                .map((x) => CommissionReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CommissionReport": commissionReport == null
            ? []
            : List<dynamic>.from(commissionReport!.map((x) => x.toJson())),
      };
}

class CommissionReport {
  int? id;
  String? name;
  String? uniqueId;
  num? paidFees;
  num? transactionamt;
  num? payableAmount;
  num? commamt;
  num? tdsamt;
  num? amountwithrazorpaycomm;
  dynamic paymentId;
  String? location;
  dynamic paymentDate;
  dynamic paymentTime;

  CommissionReport({
    this.id,
    this.name,
    this.uniqueId,
    this.paidFees,
    this.transactionamt,
    this.payableAmount,
    this.commamt,
    this.tdsamt,
    this.amountwithrazorpaycomm,
    this.paymentId,
    this.location,
    this.paymentDate,
    this.paymentTime,
  });

  factory CommissionReport.fromJson(Map<String, dynamic> json) =>
      CommissionReport(
        id: json["Id"],
        name: json["Name"],
        uniqueId: json["UniqueId"],
        paidFees: json["PaidFees"],
        transactionamt: json["transactionamt"],
        payableAmount: json["PayableAmount"],
        commamt: json["commamt"],
        tdsamt: json["tdsamt"],
        amountwithrazorpaycomm: json["Amountwithrazorpaycomm"],
        paymentId: json["PaymentId"],
        location: json["Location"],
        paymentDate: json["PaymentDate"],
        paymentTime: json["PaymentTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "UniqueId": uniqueId,
        "PaidFees": paidFees,
        "transactionamt": transactionamt,
        "PayableAmount": payableAmount,
        "commamt": commamt,
        "tdsamt": tdsamt,
        "Amountwithrazorpaycomm": amountwithrazorpaycomm,
        "PaymentId": paymentId,
        "Location": location,
        "PaymentDate": paymentDate,
        "PaymentTime": paymentTime,
      };
}
