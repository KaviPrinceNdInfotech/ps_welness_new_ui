// To parse this JSON data, do
//
//     final bankAllDetailModel = bankAllDetailModelFromJson(jsonString);

import 'dart:convert';

BankAllDetailModel bankAllDetailModelFromJson(String str) =>
    BankAllDetailModel.fromJson(json.decode(str));

String bankAllDetailModelToJson(BankAllDetailModel data) =>
    json.encode(data.toJson());

class BankAllDetailModel {
  String? accountNo;
  String? ifscCode;
  String? branchName;
  String? branchAddress;
  String? holderName;
  String? mobileNumber;
  dynamic cancelCheque;

  BankAllDetailModel({
    this.accountNo,
    this.ifscCode,
    this.branchName,
    this.branchAddress,
    this.holderName,
    this.mobileNumber,
    this.cancelCheque,
  });

  factory BankAllDetailModel.fromJson(Map<String, dynamic> json) =>
      BankAllDetailModel(
        accountNo: json["AccountNo"],
        ifscCode: json["IFSCCode"],
        branchName: json["BranchName"],
        branchAddress: json["BranchAddress"],
        holderName: json["HolderName"],
        mobileNumber: json["MobileNumber"],
        cancelCheque: json["CancelCheque"],
      );

  Map<String, dynamic> toJson() => {
        "AccountNo": accountNo,
        "IFSCCode": ifscCode,
        "BranchName": branchName,
        "BranchAddress": branchAddress,
        "HolderName": holderName,
        "MobileNumber": mobileNumber,
        "CancelCheque": cancelCheque,
      };
}
