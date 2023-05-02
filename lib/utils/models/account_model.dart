// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  final String? role;
  final Data? data;
  final String? message;
  final int? status;

  AccountModel({
    this.role,
    this.data,
    this.message,
    this.status,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    role: json["role"],
    data: Data.fromJson(json["data"]),
    message: json["Message"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "data": data!.toJson(),
    "Message": message,
    "Status": status,
  };
}

class Data {
  final int? id;
  final String ?emailId;
  final String? mobileNumber;
  final String? location;
  final String? patientName;
  final String? stateName;
  final String? cityName;
  final bool? isApproved;
  final int ?stateMasterId;
  final int? cityMasterId;
  final int? adminLoginId;
  final String? password;
  final String? pinCode;
  final String? patientRegNo;

  Data({
    this.id,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.patientName,
    this.stateName,
    this.cityName,
    this.isApproved,
    this.stateMasterId,
    this.cityMasterId,
    this.adminLoginId,
    this.password,
    this.pinCode,
    this.patientRegNo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["Id"],
    emailId: json["EmailId"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    patientName: json["PatientName"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    isApproved: json["IsApproved"],
    stateMasterId: json["StateMaster_Id"],
    cityMasterId: json["CityMaster_Id"],
    adminLoginId: json["AdminLogin_Id"],
    password: json["Password"],
    pinCode: json["PinCode"],
    patientRegNo: json["PatientRegNo"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "EmailId": emailId,
    "MobileNumber": mobileNumber,
    "Location": location,
    "PatientName": patientName,
    "StateName": stateName,
    "CityName": cityName,
    "IsApproved": isApproved,
    "StateMaster_Id": stateMasterId,
    "CityMaster_Id": cityMasterId,
    "AdminLogin_Id": adminLoginId,
    "Password": password,
    "PinCode": pinCode,
    "PatientRegNo": patientRegNo,
  };
}
