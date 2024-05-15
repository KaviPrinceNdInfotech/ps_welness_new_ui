// To parse this JSON data, do
//
//     final tdsByDateModel = tdsByDateModelFromJson(jsonString);

import 'dart:convert';

TdsByDateModel tdsByDateModelFromJson(String str) =>
    TdsByDateModel.fromJson(json.decode(str));

String tdsByDateModelToJson(TdsByDateModel data) => json.encode(data.toJson());

class TdsByDateModel {
  List<TdsReport>? tdsReport;

  TdsByDateModel({
    this.tdsReport,
  });

  factory TdsByDateModel.fromJson(Map<String, dynamic> json) => TdsByDateModel(
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
  num? tdsamt;
  num? payableAmount;
  dynamic paymentId;
  String? location;
  dynamic paymentDate;
  dynamic paymentTime;
  num? tds;
  num? payAmount;

  TdsReport({
    this.id,
    this.name,
    this.uniqueId,
    this.paidFees,
    this.tdsamt,
    this.payableAmount,
    this.paymentId,
    this.location,
    this.paymentDate,
    this.paymentTime,
    this.tds,
    this.payAmount,
  });

  factory TdsReport.fromJson(Map<String, dynamic> json) => TdsReport(
        id: json["Id"],
        name: json["Name"],
        uniqueId: json["UniqueId"],
        paidFees: json["PaidFees"],
        tdsamt: json["tdsamt"],
        payableAmount: json["PayableAmount"],
        paymentId: json["PaymentId"],
        location: json["Location"],
        paymentDate: json["PaymentDate"],
        paymentTime: json["PaymentTime"],
        tds: json["TDS"],
        payAmount: json["PayAmount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "UniqueId": uniqueId,
        "PaidFees": paidFees,
        "tdsamt": tdsamt,
        "PayableAmount": payableAmount,
        "PaymentId": paymentId,
        "Location": location,
        "PaymentDate": paymentDate,
        "PaymentTime": paymentTime,
        "TDS": tds,
        "PayAmount": payAmount,
      };
}
