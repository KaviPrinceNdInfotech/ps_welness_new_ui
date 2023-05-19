// To parse this JSON data, do
//
//     final nurseCheckoutModel = nurseCheckoutModelFromJson(jsonString);
///
import 'dart:convert';

NurseCheckoutModel nurseCheckoutModelFromJson(String str) =>
    NurseCheckoutModel.fromJson(json.decode(str));

String nurseCheckoutModelToJson(NurseCheckoutModel data) =>
    json.encode(data.toJson());

class NurseCheckoutModel {
  int? id;
  String? nurseName;
  String? nurseTypeName;
  num? experience;
  num? fee;
  dynamic serviceDate;
  String? slotTime;

  NurseCheckoutModel({
    this.id,
    this.nurseName,
    this.nurseTypeName,
    this.experience,
    this.fee,
    this.serviceDate,
    this.slotTime,
  });

  factory NurseCheckoutModel.fromJson(Map<String, dynamic> json) =>
      NurseCheckoutModel(
        id: json["Id"],
        nurseName: json["NurseName"],
        nurseTypeName: json["NurseTypeName"],
        experience: json["Experience"],
        fee: json["Fee"],
        serviceDate: json["ServiceDate"],
        slotTime: json["SlotTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NurseName": nurseName,
        "NurseTypeName": nurseTypeName,
        "Experience": experience,
        "Fee": fee,
        "ServiceDate": serviceDate,
        "SlotTime": slotTime,
      };
}
