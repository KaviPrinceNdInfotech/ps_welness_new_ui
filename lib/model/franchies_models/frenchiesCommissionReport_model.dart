// // To parse this JSON data, do
// //
// //     final frenchiesCommissionReportModel = frenchiesCommissionReportModelFromJson(jsonString);
//
// import 'dart:convert';
//
// FrenchiesCommissionReportModel frenchiesCommissionReportModelFromJson(
//         String str) =>
//     FrenchiesCommissionReportModel.fromJson(json.decode(str));
//
// String frenchiesCommissionReportModelToJson(
//         FrenchiesCommissionReportModel data) =>
//     json.encode(data.toJson());
//
// class FrenchiesCommissionReportModel {
//   List<CommissionReport>? commissionReport;
//
//   FrenchiesCommissionReportModel({
//     this.commissionReport,
//   });
//
//   factory FrenchiesCommissionReportModel.fromJson(Map<String, dynamic> json) =>
//       FrenchiesCommissionReportModel(
//         commissionReport: json["CommissionReport"] == null
//             ? []
//             : List<CommissionReport>.from(json["CommissionReport"]!
//                 .map((x) => CommissionReport.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "CommissionReport": commissionReport == null
//             ? []
//             : List<dynamic>.from(commissionReport!.map((x) => x.toJson())),
//       };
// }
//
// class CommissionReport {
//   int? id;
//   String? name;
//   num? paidFees;
//   dynamic paymentId;
//   String? location;
//   dynamic paymentDate;
//   dynamic paymentTime;
//   num? commission;
//   num? payAmount;
//   String? uniqueId;
//   num? transactionamt;
//   num? payableAmount;
//   num? commamt;
//   num? tdsamt;
//   num? amountwithrazorpaycomm;
//
//   CommissionReport({
//     this.id,
//     this.name,
//     this.paidFees,
//     this.paymentId,
//     this.location,
//     this.paymentDate,
//     this.paymentTime,
//     this.commission,
//     this.payAmount,
//     this.uniqueId,
//     this.transactionamt,
//     this.payableAmount,
//     this.commamt,
//     this.tdsamt,
//     this.amountwithrazorpaycomm,
//   });
//
//   factory CommissionReport.fromJson(Map<String, dynamic> json) =>
//       CommissionReport(
//         id: json["Id"],
//         name: json["Name"],
//         paidFees: json["PaidFees"],
//         paymentId: json["PaymentId"],
//         location: json["Location"],
//         paymentDate: json["PaymentDate"],
//         paymentTime: json["PaymentTime"],
//         commission: json["Commission"],
//         payAmount: json["PayAmount"],
//         uniqueId: json["UniqueId"],
//         transactionamt: json["transactionamt"],
//         payableAmount: json["PayableAmount"],
//         commamt: json["commamt"],
//         tdsamt: json["tdsamt"],
//         amountwithrazorpaycomm: json["Amountwithrazorpaycomm"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Name": name,
//         "PaidFees": paidFees,
//         "PaymentId": paymentId,
//         "Location": location,
//         "PaymentDate": paymentDate,
//         "PaymentTime": paymentTime,
//         "Commission": commission,
//         "PayAmount": payAmount,
//         "UniqueId": uniqueId,
//         "transactionamt": transactionamt,
//         "PayableAmount": payableAmount,
//         "commamt": commamt,
//         "tdsamt": tdsamt,
//         "Amountwithrazorpaycomm": amountwithrazorpaycomm,
//       };
// }
///
import 'dart:convert';

FrenchiesCommissionReportModel frenchiesCommissionReportModelFromJson(
        String str) =>
    FrenchiesCommissionReportModel.fromJson(json.decode(str));

String frenchiesCommissionReportModelToJson(
        FrenchiesCommissionReportModel data) =>
    json.encode(data.toJson());

class FrenchiesCommissionReportModel {
  List<CommissionReport>? commissionReport;

  FrenchiesCommissionReportModel({
    this.commissionReport,
  });

  factory FrenchiesCommissionReportModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesCommissionReportModel(
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
  num? paidFees;
  dynamic paymentId;
  String? location;
  dynamic paymentDate;
  dynamic paymentTime;
  num? commission;
  num? payAmount;
  String? uniqueId;
  num? transactionamt;
  num? payableAmount;
  double? fraPaidableamt;
  num? commamt;
  num? tdsamt;
  num? amountwithrazorpaycomm;

  CommissionReport({
    this.id,
    this.name,
    this.paidFees,
    this.paymentId,
    this.location,
    this.paymentDate,
    this.paymentTime,
    this.commission,
    this.payAmount,
    this.uniqueId,
    this.transactionamt,
    this.payableAmount,
    this.fraPaidableamt,
    this.commamt,
    this.tdsamt,
    this.amountwithrazorpaycomm,
  });

  factory CommissionReport.fromJson(Map<String, dynamic> json) =>
      CommissionReport(
        id: json["Id"],
        name: json["Name"],
        paidFees: json["PaidFees"],
        paymentId: json["PaymentId"],
        location: json["Location"],
        paymentDate: json["PaymentDate"],
        paymentTime: json["PaymentTime"],
        commission: json["Commission"],
        payAmount: json["PayAmount"],
        uniqueId: json["UniqueId"],
        transactionamt: json["transactionamt"],
        payableAmount: json["PayableAmount"],
        fraPaidableamt: json["FraPaidableamt"]?.toDouble(),
        commamt: json["commamt"],
        tdsamt: json["tdsamt"],
        amountwithrazorpaycomm: json["Amountwithrazorpaycomm"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "PaidFees": paidFees,
        "PaymentId": paymentId,
        "Location": location,
        "PaymentDate": paymentDate,
        "PaymentTime": paymentTime,
        "Commission": commission,
        "PayAmount": payAmount,
        "UniqueId": uniqueId,
        "transactionamt": transactionamt,
        "PayableAmount": payableAmount,
        "FraPaidableamt": fraPaidableamt,
        "commamt": commamt,
        "tdsamt": tdsamt,
        "Amountwithrazorpaycomm": amountwithrazorpaycomm,
      };
}
