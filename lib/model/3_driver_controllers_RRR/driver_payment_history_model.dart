// To parse this JSON data, do
//
//     final driverPaymentHistory = driverPaymentHistoryFromJson(jsonString);
//
// import 'dart:convert';
//
// List<DriverPaymentHistoryModel> driverPaymentHistoryFromJson(String str) => List<DriverPaymentHistoryModel>.from(json.decode(str).map((x) => DriverPaymentHistoryModel.fromJson(x)));
//
// String driverPaymentHistoryToJson(List<DriverPaymentHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class DriverPaymentHistoryModel {
//   DriverPaymentHistoryModel({
//     this.id,
//     this.driverName,
//     this.branchName,
//     this.paidAmount,
//     this.joiningDate,
//   });
//
//   int? id;
//   String? driverName;
//   String? branchName;
//   String? paidAmount;
//   DateTime? joiningDate;
//
//   factory DriverPaymentHistoryModel.fromJson(Map<String, dynamic> json) => DriverPaymentHistoryModel(
//     id: json["Id"],
//     driverName: json["DriverName"],
//     branchName: json["BranchName"],
//     paidAmount: json["PaidAmount"],
//     joiningDate: json["JoiningDate"] == null ? null : DateTime.parse(json["JoiningDate"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "DriverName": driverName,
//     "BranchName": branchName,
//     "PaidAmount": paidAmount,
//     "JoiningDate": joiningDate?.toIso8601String(),
//   };
// }
//import 'dart:convert';

///
///
/// mport 'dart:convert';

// List<DriverPaymentHistoryModel> driverPaymentHistoryModelFromJson(String str) =>
//     List<DriverPaymentHistoryModel>.from(
//         json.decode(str).map((x) => DriverPaymentHistoryModel.fromJson(x)));
//
// String driverPaymentHistoryModelToJson(List<DriverPaymentHistoryModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class DriverPaymentHistoryModel {
//   int? id;
//   String? driverName;
//   String? branchName;
//   double? paidAmount;
//   DateTime? joiningDate;
//
//   DriverPaymentHistoryModel({
//     this.id,
//     this.driverName,
//     this.branchName,
//     this.paidAmount,
//     this.joiningDate,
//   });
//
//   factory DriverPaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
//       DriverPaymentHistoryModel(
//         id: json["Id"],
//         driverName: json["DriverName"],
//         branchName: json["BranchName"],
//         paidAmount: json["PaidAmount"],
//         joiningDate: json["JoiningDate"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DriverName": driverName,
//         "BranchName": branchName,
//         "PaidAmount": paidAmount,
//         "JoiningDate": joiningDate,
//       };
// }
///
///
import 'dart:convert';

List<DriverPaymentHistoryModel> driverPaymentHistoryModelFromJson(String str) =>
    List<DriverPaymentHistoryModel>.from(
        json.decode(str).map((x) => DriverPaymentHistoryModel.fromJson(x)));

String driverPaymentHistoryModelToJson(List<DriverPaymentHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverPaymentHistoryModel {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? location;
  num? paymentId;
  num? amount;
  DateTime? paymentDate;
  String? isPay;

  DriverPaymentHistoryModel({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.location,
    this.paymentId,
    this.amount,
    this.paymentDate,
    this.isPay,
  });

  factory DriverPaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverPaymentHistoryModel(
        id: json["Id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        paymentId: json["PaymentId"],
        amount: json["Amount"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
        isPay: json["IsPay"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "Location": location,
        "PaymentId": paymentId,
        "Amount": amount,
        "PaymentDate": paymentDate?.toIso8601String(),
        "IsPay": isPay,
      };
}
