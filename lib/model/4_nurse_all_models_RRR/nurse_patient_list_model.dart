// To parse this JSON data, do
//
//     final nursePatientList = nursePatientListFromJson(jsonString);

import 'dart:convert';

List<NursePatientListModel> nursePatientListFromJson(String str) => List<NursePatientListModel>.from(json.decode(str).map((x) => NursePatientListModel.fromJson(x)));

String nursePatientListToJson(List<NursePatientListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NursePatientListModel {
  NursePatientListModel({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.location,
    this.amount,
    this.startSlotTime,
    this.endSlotTime,
    this.workingShift,
  });

  int? id;
  String? patientName;
  String? mobileNumber;
  String? location;
  num? amount;
  String? startSlotTime;
  String? endSlotTime;
  String? workingShift;

  factory NursePatientListModel.fromJson(Map<String, dynamic> json) => NursePatientListModel(
    id: json["id"],
    patientName: json["PatientName"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    amount: json["Amount"],
    startSlotTime: json["StartSlotTime"],
    endSlotTime: json["EndSlotTime"],
    workingShift: json["WorkingShift"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "PatientName": patientName,
    "MobileNumber": mobileNumber,
    "Location": location,
    "Amount": amount,
    "StartSlotTime": startSlotTime,
    "EndSlotTime": endSlotTime,
    "WorkingShift": workingShift,
  };
}
