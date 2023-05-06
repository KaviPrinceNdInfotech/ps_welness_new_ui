import 'dart:convert';

List<NurseAppointmentHistoryModel> nurseAppointmentHistoryFromJson(String str) => List<NurseAppointmentHistoryModel>.from(json.decode(str).map((x) => NurseAppointmentHistoryModel.fromJson(x)));

String nurseAppointmentHistoryToJson(List<NurseAppointmentHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NurseAppointmentHistoryModel {
  NurseAppointmentHistoryModel({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.location,
    this.amount,
    this.startSlotTime,
    this.endSlotTime,
  });

  int? id;
  String? patientName;
  String? mobileNumber;
  String? location;
  num? amount;
  String? startSlotTime;
  String? endSlotTime;

  factory NurseAppointmentHistoryModel.fromJson(Map<String, dynamic> json) => NurseAppointmentHistoryModel(
    id: json["id"],
    patientName: json["PatientName"],
    mobileNumber: json["MobileNumber"],
    location: json["Location"],
    amount: json["Amount"],
    startSlotTime: json["StartSlotTime"],
    endSlotTime: json["EndSlotTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "PatientName": patientName,
    "MobileNumber": mobileNumber,
    "Location": location,
    "Amount": amount,
    "StartSlotTime": startSlotTime,
    "EndSlotTime": endSlotTime,
  };
}
