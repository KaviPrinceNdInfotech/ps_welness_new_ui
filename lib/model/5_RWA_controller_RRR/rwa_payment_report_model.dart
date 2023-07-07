// To parse this JSON data, do
//
//     final rwaPaymentReportModel = rwaPaymentReportModelFromJson(jsonString);

import 'dart:convert';

RwaPaymentReportModel rwaPaymentReportModelFromJson(String str) =>
    RwaPaymentReportModel.fromJson(json.decode(str));

String rwaPaymentReportModelToJson(RwaPaymentReportModel data) =>
    json.encode(data.toJson());

class RwaPaymentReportModel {
  List<RwaPaymentReport>? rwaPaymentReport;

  RwaPaymentReportModel({
    this.rwaPaymentReport,
  });

  factory RwaPaymentReportModel.fromJson(Map<String, dynamic> json) =>
      RwaPaymentReportModel(
        rwaPaymentReport: json["RWA_PaymentReport"] == null
            ? []
            : List<RwaPaymentReport>.from(json["RWA_PaymentReport"]!
                .map((x) => RwaPaymentReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RWA_PaymentReport": rwaPaymentReport == null
            ? []
            : List<dynamic>.from(rwaPaymentReport!.map((x) => x.toJson())),
      };
}

class RwaPaymentReport {
  int? id;
  String? patientName;
  String? bankName;
  double? paidAmount;
  String? paymentDate;
  String? paymentTime;

  RwaPaymentReport({
    this.id,
    this.patientName,
    this.bankName,
    this.paidAmount,
    this.paymentDate,
    this.paymentTime,
  });

  factory RwaPaymentReport.fromJson(Map<String, dynamic> json) =>
      RwaPaymentReport(
        id: json["Id"],
        patientName: json["PatientName"],
        bankName: json["BankName"],
        paidAmount: json["PaidAmount"],
        paymentDate: json["PaymentDate"],
        paymentTime: json["PaymentTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "BankName": bankName,
        "PaidAmount": paidAmount,
        "PaymentDate": paymentDate,
        "PaymentTime": paymentTime,
      };
}
