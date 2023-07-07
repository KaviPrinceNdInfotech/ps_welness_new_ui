// To parse this JSON data, do
//
//     final tdsByDateModel = tdsByDateModelFromJson(jsonString);

import 'dart:convert';

TdsByDateModel tdsByDateModelFromJson(String str) => TdsByDateModel.fromJson(json.decode(str));

String tdsByDateModelToJson(TdsByDateModel data) => json.encode(data.toJson());

class TdsByDateModel {
  List<TdsReport>? tdsReport;

  TdsByDateModel({
    this.tdsReport,
  });

  factory TdsByDateModel.fromJson(Map<String, dynamic> json) => TdsByDateModel(
    tdsReport: json["TDSReport"] == null ? [] : List<TdsReport>.from(json["TDSReport"]!.map((x) => TdsReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "TDSReport": tdsReport == null ? [] : List<dynamic>.from(tdsReport!.map((x) => x.toJson())),
  };
}

class TdsReport {
  int? id;
  String? name;
  num? paidFees;
  num? paymentId;
  String? location;
  String? paymentDate;
  String? paymentTime;
  num? tds;
  num? payAmount;

  TdsReport({
    this.id,
    this.name,
    this.paidFees,
    this.paymentId,
    this.location,
    this.paymentDate,
    this.paymentTime,
    this.tds,
    this.payAmount
  });

  factory TdsReport.fromJson(Map<String, dynamic> json) => TdsReport(
    id: json["Id"],
    name: json["Name"],
    paidFees: json["PaidFees"],
    paymentId: json["PaymentId"],
    location: json["Location"],
    paymentDate: json["PaymentDate"],
    paymentTime: json["PaymentTime"],
    tds: json["TDS"],
    payAmount: json["PayAmount"]
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "PaidFees": paidFees,
    "PaymentId": paymentId,
    "Location": location,
    "PaymentDate": paymentDate,
    "PaymentTime": paymentTime,
    "TDS": tds,
    "PayAmount": payAmount
  };
}
