// To parse this JSON data, do
//
//     final nurseCheckoutModel = nurseCheckoutModelFromJson(jsonString);

import 'dart:convert';

NurseCheckoutModel nurseCheckoutModelFromJson(String str) =>
    NurseCheckoutModel.fromJson(json.decode(str));

String nurseCheckoutModelToJson(NurseCheckoutModel data) =>
    json.encode(data.toJson());

class NurseCheckoutModel {
  num? id;
  String? nurseName;
  String? nurseTypeName;
  num? experience;
  num? fee;
  num? gst;
  num? totalFee;
  num? totalFeeWithGst;
  DateTime? serviceDate;
  String? slotTime;
  num? totalNumberofdays;
  String? deviceId;

  NurseCheckoutModel({
    this.id,
    this.nurseName,
    this.nurseTypeName,
    this.experience,
    this.fee,
    this.gst,
    this.totalFee,
    this.totalFeeWithGst,
    this.serviceDate,
    this.slotTime,
    this.totalNumberofdays,
    this.deviceId,
  });

  factory NurseCheckoutModel.fromJson(Map<String, dynamic> json) =>
      NurseCheckoutModel(
        id: json["Id"],
        nurseName: json["NurseName"],
        nurseTypeName: json["NurseTypeName"],
        experience: json["Experience"],
        fee: json["Fee"],
        gst: json["GST"],
        totalFee: json["TotalFee"],
        totalFeeWithGst: json["TotalFeeWithGST"],
        serviceDate: json["ServiceDate"] == null
            ? null
            : DateTime.parse(json["ServiceDate"]),
        slotTime: json["SlotTime"],
        totalNumberofdays: json["TotalNumberofdays"],
        deviceId: json["DeviceId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NurseName": nurseName,
        "NurseTypeName": nurseTypeName,
        "Experience": experience,
        "Fee": fee,
        "GST": gst,
        "TotalFee": totalFee,
        "TotalFeeWithGST": totalFeeWithGst,
        "ServiceDate": serviceDate?.toIso8601String(),
        "SlotTime": slotTime,
        "TotalNumberofdays": totalNumberofdays,
        "DeviceId": deviceId,
      };
}
