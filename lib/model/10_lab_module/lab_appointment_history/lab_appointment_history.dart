// To parse this JSON data, do
//
//     final labpaymentModel = labpaymentModelFromJson(jsonString);

import 'dart:convert';

LabpaymentModel labpaymentModelFromJson(String str) =>
    LabpaymentModel.fromJson(json.decode(str));

String labpaymentModelToJson(LabpaymentModel data) =>
    json.encode(data.toJson());

class LabpaymentModel {
  List<LabPayHi>? labPayHis;

  LabpaymentModel({
    this.labPayHis,
  });

  factory LabpaymentModel.fromJson(Map<String, dynamic> json) =>
      LabpaymentModel(
        labPayHis: json["LabPayHis"] == null
            ? []
            : List<LabPayHi>.from(
                json["LabPayHis"]!.map((x) => LabPayHi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabPayHis": labPayHis == null
            ? []
            : List<dynamic>.from(labPayHis!.map((x) => x.toJson())),
      };
}

class LabPayHi {
  int? id;
  String? patientName;
  String? mobileNumber;
  double? amount;
  String? startSlotTime;
  String? endSlotTime;
  DateTime? paymentDate;

  LabPayHi({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.amount,
    this.startSlotTime,
    this.endSlotTime,
    this.paymentDate,
  });

  factory LabPayHi.fromJson(Map<String, dynamic> json) => LabPayHi(
        id: json["Id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        amount: json["Amount"],
        startSlotTime: json["StartSlotTime"],
        endSlotTime: json["EndSlotTime"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "Amount": amount,
        "StartSlotTime": startSlotTime,
        "EndSlotTime": endSlotTime,
        "PaymentDate": paymentDate?.toIso8601String(),
      };
}
