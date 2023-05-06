// To parse this JSON data, do
//
//     final driverPaymentHistory = driverPaymentHistoryFromJson(jsonString);

import 'dart:convert';

List<DriverPaymentHistoryModel> driverPaymentHistoryFromJson(String str) => List<DriverPaymentHistoryModel>.from(json.decode(str).map((x) => DriverPaymentHistoryModel.fromJson(x)));

String driverPaymentHistoryToJson(List<DriverPaymentHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverPaymentHistoryModel {
  DriverPaymentHistoryModel({
    this.id,
    this.driverName,
    this.branchName,
    this.paidAmount,
    this.joiningDate,
  });

  int? id;
  String? driverName;
  String? branchName;
  String? paidAmount;
  DateTime? joiningDate;

  factory DriverPaymentHistoryModel.fromJson(Map<String, dynamic> json) => DriverPaymentHistoryModel(
    id: json["Id"],
    driverName: json["DriverName"],
    branchName: json["BranchName"],
    paidAmount: json["PaidAmount"],
    joiningDate: json["JoiningDate"] == null ? null : DateTime.parse(json["JoiningDate"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DriverName": driverName,
    "BranchName": branchName,
    "PaidAmount": paidAmount,
    "JoiningDate": joiningDate?.toIso8601String(),
  };
}
