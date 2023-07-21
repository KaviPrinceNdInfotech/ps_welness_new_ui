// import 'dart:convert';
//
// List<DriverPayoutHistoryModel> driverPayoutHistoryFromJson(String str) => List<DriverPayoutHistoryModel>.from(json.decode(str).map((x) => DriverPayoutHistoryModel.fromJson(x)));
//
// String driverPayoutHistoryToJson(List<DriverPayoutHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class DriverPayoutHistoryModel {
//   DriverPayoutHistoryModel({
//     this.id,
//     this.paidAmount,
//     this.joiningDate,
//   });
//
//   int? id;
//   String? paidAmount;
//   DateTime? joiningDate;
//
//   factory DriverPayoutHistoryModel.fromJson(Map<String, dynamic> json) => DriverPayoutHistoryModel(
//     id: json["Id"],
//     paidAmount: json["PaidAmount"],
//     joiningDate: json["JoiningDate"] == null ? null : DateTime.parse(json["JoiningDate"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "PaidAmount": paidAmount,
//     "JoiningDate": joiningDate?.toIso8601String(),
//   };
// }
///
import 'dart:convert';

List<DriverPayoutHistoryModel> driverPayoutHistoryModelFromJson(String str) =>
    List<DriverPayoutHistoryModel>.from(
        json.decode(str).map((x) => DriverPayoutHistoryModel.fromJson(x)));

String driverPayoutHistoryModelToJson(List<DriverPayoutHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverPayoutHistoryModel {
  num? id;
  double? amount;
  DateTime? paymentDate;

  DriverPayoutHistoryModel({
    this.id,
    this.amount,
    this.paymentDate,
  });

  factory DriverPayoutHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverPayoutHistoryModel(
        id: json["Id"],
        amount: json["Amount"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Amount": amount,
        "PaymentDate": paymentDate?.toIso8601String(),
      };
}
