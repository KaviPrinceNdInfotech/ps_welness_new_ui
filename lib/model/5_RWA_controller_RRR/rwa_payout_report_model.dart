// To parse this JSON data, do
//
//     final rwaPayoutReportModel = rwaPayoutReportModelFromJson(jsonString);
///
//import 'dart:convert';

// RwaPayoutReportModel rwaPayoutReportModelFromJson(String str) =>
//     RwaPayoutReportModel.fromJson(json.decode(str));
//
// String rwaPayoutReportModelToJson(RwaPayoutReportModel data) =>
//     json.encode(data.toJson());
//
// class RwaPayoutReportModel {
//   List<RwaPayoutList>? rwaPayoutList;
//
//   RwaPayoutReportModel({
//     this.rwaPayoutList,
//   });
//
//   factory RwaPayoutReportModel.fromJson(Map<String, dynamic> json) =>
//       RwaPayoutReportModel(
//         rwaPayoutList: json["RWA_PayoutList"] == null
//             ? []
//             : List<RwaPayoutList>.from(
//                 json["RWA_PayoutList"]!.map((x) => RwaPayoutList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "RWA_PayoutList": rwaPayoutList == null
//             ? []
//             : List<dynamic>.from(rwaPayoutList!.map((x) => x.toJson())),
//       };
// }
//
// class RwaPayoutList {
//   int? id;
//   num? rwaId;
//   String? authorityName;
//   double? amount;
//   DateTime? paymentDate;
//   bool? isPaid;
//   bool? isGenerated;
//   String? certificateImage;
//
//   RwaPayoutList({
//     this.id,
//     this.rwaId,
//     this.authorityName,
//     this.amount,
//     this.paymentDate,
//     this.isPaid,
//     this.isGenerated,
//     this.certificateImage,
//   });
//
//   factory RwaPayoutList.fromJson(Map<String, dynamic> json) => RwaPayoutList(
//         id: json["Id"],
//         rwaId: json["Rwa_Id"],
//         authorityName: json["AuthorityName"],
//         amount: json["Amount"],
//         paymentDate: json["PaymentDate"] == null
//             ? null
//             : DateTime.parse(json["PaymentDate"]),
//         isPaid: json["IsPaid"],
//         isGenerated: json["IsGenerated"],
//         certificateImage: json["CertificateImage"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Rwa_Id": rwaId,
//         "AuthorityName": authorityName,
//         "Amount": amount,
//         "PaymentDate": paymentDate?.toIso8601String(),
//         "IsPaid": isPaid,
//         "IsGenerated": isGenerated,
//         "CertificateImage": certificateImage,
//       };
// }
///
import 'dart:convert';

RwaPayoutReportModel rwaPayoutReportModelFromJson(String str) =>
    RwaPayoutReportModel.fromJson(json.decode(str));

String rwaPayoutReportModelToJson(RwaPayoutReportModel data) =>
    json.encode(data.toJson());

class RwaPayoutReportModel {
  List<RwaPayoutList>? rwaPayoutList;

  RwaPayoutReportModel({
    this.rwaPayoutList,
  });

  factory RwaPayoutReportModel.fromJson(Map<String, dynamic> json) =>
      RwaPayoutReportModel(
        rwaPayoutList: json["RWA_PayoutList"] == null
            ? []
            : List<RwaPayoutList>.from(
                json["RWA_PayoutList"]!.map((x) => RwaPayoutList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RWA_PayoutList": rwaPayoutList == null
            ? []
            : List<dynamic>.from(rwaPayoutList!.map((x) => x.toJson())),
      };
}

class RwaPayoutList {
  int? id;
  String? authorityName;
  num? amount;
  DateTime? paymentDate;

  RwaPayoutList({
    this.id,
    this.authorityName,
    this.amount,
    this.paymentDate,
  });

  factory RwaPayoutList.fromJson(Map<String, dynamic> json) => RwaPayoutList(
        id: json["Id"],
        authorityName: json["AuthorityName"],
        amount: json["Amount"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "AuthorityName": authorityName,
        "Amount": amount,
        "PaymentDate": paymentDate?.toIso8601String(),
      };
}
