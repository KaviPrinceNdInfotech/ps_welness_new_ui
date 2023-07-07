import 'dart:convert';

List<DriverPayoutHistoryModel> driverPayoutHistoryFromJson(String str) => List<DriverPayoutHistoryModel>.from(json.decode(str).map((x) => DriverPayoutHistoryModel.fromJson(x)));

String driverPayoutHistoryToJson(List<DriverPayoutHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverPayoutHistoryModel {
  DriverPayoutHistoryModel({
    this.id,
    this.paidAmount,
    this.joiningDate,
  });

  int? id;
  String? paidAmount;
  DateTime? joiningDate;

  factory DriverPayoutHistoryModel.fromJson(Map<String, dynamic> json) => DriverPayoutHistoryModel(
    id: json["Id"],
    paidAmount: json["PaidAmount"],
    joiningDate: json["JoiningDate"] == null ? null : DateTime.parse(json["JoiningDate"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PaidAmount": paidAmount,
    "JoiningDate": joiningDate?.toIso8601String(),
  };
}
