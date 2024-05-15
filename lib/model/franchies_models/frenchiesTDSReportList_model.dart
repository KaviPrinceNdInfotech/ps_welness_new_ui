// To parse this JSON data, do
//
//     final frenchiesTdsReportModel = frenchiesTdsReportModelFromJson(jsonString);

import 'dart:convert';

FrenchiesTdsReportModel frenchiesTdsReportModelFromJson(String str) =>
    FrenchiesTdsReportModel.fromJson(json.decode(str));

String frenchiesTdsReportModelToJson(FrenchiesTdsReportModel data) =>
    json.encode(data.toJson());

class FrenchiesTdsReportModel {
  List<TdsReport>? tdsReport;

  FrenchiesTdsReportModel({
    this.tdsReport,
  });

  factory FrenchiesTdsReportModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesTdsReportModel(
        tdsReport: json["TDSReport"] == null
            ? []
            : List<TdsReport>.from(
                json["TDSReport"]!.map((x) => TdsReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TDSReport": tdsReport == null
            ? []
            : List<dynamic>.from(tdsReport!.map((x) => x.toJson())),
      };
}

class TdsReport {
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

  TdsReport({
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

  factory TdsReport.fromJson(Map<String, dynamic> json) => TdsReport(
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
