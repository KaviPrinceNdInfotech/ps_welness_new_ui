// To parse this JSON data, do
//
//     final frenchiesDoctorDetailModel = frenchiesDoctorDetailModelFromJson(jsonString);

import 'dart:convert';

FrenchiesDoctorDetailModel frenchiesDoctorDetailModelFromJson(String str) =>
    FrenchiesDoctorDetailModel.fromJson(json.decode(str));

String frenchiesDoctorDetailModelToJson(FrenchiesDoctorDetailModel data) =>
    json.encode(data.toJson());

class FrenchiesDoctorDetailModel {
  List<DoctorRegDetail>? doctorRegDetail;

  FrenchiesDoctorDetailModel({
    this.doctorRegDetail,
  });

  factory FrenchiesDoctorDetailModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesDoctorDetailModel(
        doctorRegDetail: json["DoctorRegDetail"] == null
            ? []
            : List<DoctorRegDetail>.from(json["DoctorRegDetail"]!
                .map((x) => DoctorRegDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DoctorRegDetail": doctorRegDetail == null
            ? []
            : List<dynamic>.from(doctorRegDetail!.map((x) => x.toJson())),
      };
}

class DoctorRegDetail {
  int? id;
  String? doctorId;
  String? doctorName;
  num? amount;
  String? location;
  String? vendorName;
  String? departmentName;
  String? specialistName;
  String? mobileNumber;
  String? emailId;
  String? licenceNumber;

  DoctorRegDetail({
    this.id,
    this.doctorId,
    this.doctorName,
    this.amount,
    this.location,
    this.vendorName,
    this.departmentName,
    this.specialistName,
    this.mobileNumber,
    this.emailId,
    this.licenceNumber,
  });

  factory DoctorRegDetail.fromJson(Map<String, dynamic> json) =>
      DoctorRegDetail(
        id: json["Id"],
        doctorId: json["DoctorId"],
        doctorName: json["DoctorName"],
        amount: json["Amount"],
        location: json["Location"],
        vendorName: json["VendorName"],
        departmentName: json["DepartmentName"],
        specialistName: json["SpecialistName"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        licenceNumber: json["LicenceNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DoctorId": doctorId,
        "DoctorName": doctorName,
        "Amount": amount,
        "Location": location,
        "VendorName": vendorName,
        "DepartmentName": departmentName,
        "SpecialistName": specialistName,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "LicenceNumber": licenceNumber,
      };
}
