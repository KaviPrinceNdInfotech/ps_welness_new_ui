// To parse this JSON data, do
//
//     final labappointmentHistoryModel = labappointmentHistoryModelFromJson(jsonString);

import 'dart:convert';

LabappointmentHistoryModel labappointmentHistoryModelFromJson(String str) =>
    LabappointmentHistoryModel.fromJson(json.decode(str));

String labappointmentHistoryModelToJson(LabappointmentHistoryModel data) =>
    json.encode(data.toJson());

class LabappointmentHistoryModel {
  List<LabAppHistory>? labAppHistory;

  LabappointmentHistoryModel({
    this.labAppHistory,
  });

  factory LabappointmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      LabappointmentHistoryModel(
        labAppHistory: json["LabApp_History"] == null
            ? []
            : List<LabAppHistory>.from(
                json["LabApp_History"]!.map((x) => LabAppHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabApp_History": labAppHistory == null
            ? []
            : List<dynamic>.from(labAppHistory!.map((x) => x.toJson())),
      };
}

class LabAppHistory {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? location;
  double? amount;
  SlotTime? slotTime;

  LabAppHistory({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.location,
    this.amount,
    this.slotTime,
  });

  factory LabAppHistory.fromJson(Map<String, dynamic> json) => LabAppHistory(
        id: json["Id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        amount: json["Amount"],
        slotTime: slotTimeValues.map[json["SlotTime"]]!,
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "Location": location,
        "Amount": amount,
        "SlotTime": slotTimeValues.reverse[slotTime],
      };
}

enum SlotTime { THE_0800_AM_TO_0800_PM, THE_0800_AM_TO_0800_AM }

final slotTimeValues = EnumValues({
  "08:00 AM to 08:00 AM": SlotTime.THE_0800_AM_TO_0800_AM,
  "08:00 AM to 08:00 PM": SlotTime.THE_0800_AM_TO_0800_PM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
