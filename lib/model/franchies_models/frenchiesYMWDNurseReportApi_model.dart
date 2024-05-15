// // To parse this JSON data, do
// //
// //     final frenchiesYmdwNurseModel = frenchiesYmdwNurseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// FrenchiesYmdwNurseModel frenchiesYmdwNurseModelFromJson(String str) => FrenchiesYmdwNurseModel.fromJson(json.decode(str));
//
// String frenchiesYmdwNurseModelToJson(FrenchiesYmdwNurseModel data) => json.encode(data.toJson());
//
// class FrenchiesYmdwNurseModel {
//   List<NurseYmwdReport>? nurseYmwdReport;
//
//   FrenchiesYmdwNurseModel({
//     this.nurseYmwdReport,
//   });
//
//   factory FrenchiesYmdwNurseModel.fromJson(Map<String, dynamic> json) => FrenchiesYmdwNurseModel(
//     nurseYmwdReport: json["NurseYMWD_Report"] == null ? [] : List<NurseYmwdReport>.from(json["NurseYMWD_Report"]!.map((x) => NurseYmwdReport.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "NurseYMWD_Report": nurseYmwdReport == null ? [] : List<dynamic>.from(nurseYmwdReport!.map((x) => x.toJson())),
//   };
// }
// class NurseYmwdReport {
//   int? id;
//   String? nurseId;
//   String? nurseName;
//   String? nurseTypeName;
//   String? franchise;
//   String? mobileNumber;
//   String? emailId;
//   String? location;
//   String? certificateNumber;
//   bool? isApproved;
//
//   NurseYmwdReport({
//     this.id,
//     this.nurseId,
//     this.nurseName,
//     this.nurseTypeName,
//     this.franchise,
//     this.mobileNumber,
//     this.emailId,
//     this.location,
//     this.certificateNumber,
//     this.isApproved,
//   });
//
//   factory NurseYmwdReport.fromJson(Map<String, dynamic> json) => NurseYmwdReport(
//     id: json["Id"],
//     nurseId: json["NurseId"],
//     nurseName: json["NurseName"],
//     nurseTypeName: json["NurseTypeName"],
//     franchise: json["Franchise"],
//     mobileNumber: json["MobileNumber"],
//     emailId: json["EmailId"],
//     location: json["Location"],
//     certificateNumber: json["CertificateNumber"],
//     isApproved: json["IsApproved"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "NurseId": nurseId,
//     "NurseName": nurseName,
//     "NurseTypeName": nurseTypeName,
//     "Franchise": franchise,
//     "MobileNumber": mobileNumber,
//     "EmailId": emailId,
//     "Location": location,
//     "CertificateNumber": certificateNumber,
//     "IsApproved": isApproved,
//   };
// }
///
import 'dart:convert';

FrenchiesYmdwNurseModel frenchiesYmdwNurseModelFromJson(String str) =>
    FrenchiesYmdwNurseModel.fromJson(json.decode(str));

String frenchiesYmdwNurseModelToJson(FrenchiesYmdwNurseModel data) =>
    json.encode(data.toJson());

class FrenchiesYmdwNurseModel {
  List<NurseYmwdReport>? nurseYmwdReport;

  FrenchiesYmdwNurseModel({
    this.nurseYmwdReport,
  });

  factory FrenchiesYmdwNurseModel.fromJson(Map<String, dynamic> json) =>
      FrenchiesYmdwNurseModel(
        nurseYmwdReport: json["NurseYMWD_Report"] == null
            ? []
            : List<NurseYmwdReport>.from(json["NurseYMWD_Report"]!
                .map((x) => NurseYmwdReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "NurseYMWD_Report": nurseYmwdReport == null
            ? []
            : List<dynamic>.from(nurseYmwdReport!.map((x) => x.toJson())),
      };
}

class NurseYmwdReport {
  int? id;
  String? nurseId;
  String? nurseName;
  String? nurseTypeName;
  dynamic franchise;
  dynamic mobileNumber;
  dynamic emailId;
  dynamic location;
  dynamic certificateNumber;
  num? totalAmount;
  bool? isApproved;

  NurseYmwdReport({
    this.id,
    this.nurseId,
    this.nurseName,
    this.nurseTypeName,
    this.franchise,
    this.mobileNumber,
    this.emailId,
    this.location,
    this.certificateNumber,
    this.totalAmount,
    this.isApproved,
  });

  factory NurseYmwdReport.fromJson(Map<String, dynamic> json) =>
      NurseYmwdReport(
        id: json["Id"],
        nurseId: json["NurseId"],
        nurseName: json["NurseName"],
        nurseTypeName: json["NurseTypeName"],
        franchise: json["Franchise"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        location: json["Location"],
        certificateNumber: json["CertificateNumber"],
        totalAmount: json["TotalAmount"],
        isApproved: json["IsApproved"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NurseId": nurseId,
        "NurseName": nurseName,
        "NurseTypeName": nurseTypeName,
        "Franchise": franchise,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "Location": location,
        "CertificateNumber": certificateNumber,
        "TotalAmount": totalAmount,
        "IsApproved": isApproved,
      };
}
