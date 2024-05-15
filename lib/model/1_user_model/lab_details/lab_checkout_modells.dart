// To parse this JSON data, do
//
//     final labcheckoutmodel = labcheckoutmodelFromJson(jsonString);

import 'dart:convert';

Labcheckoutmodel labcheckoutmodelFromJson(String str) =>
    Labcheckoutmodel.fromJson(json.decode(str));

String labcheckoutmodelToJson(Labcheckoutmodel data) =>
    json.encode(data.toJson());

class Labcheckoutmodel {
  num? id;
  String? labName;
  dynamic labTypeName;
  dynamic year;
  num? fee;
  num? gst;
  num? totalFee;
  DateTime? testDate;
  String? slotTime;
  dynamic deviceId;

  Labcheckoutmodel({
    this.id,
    this.labName,
    this.labTypeName,
    this.year,
    this.fee,
    this.gst,
    this.totalFee,
    this.testDate,
    this.slotTime,
    this.deviceId,
  });

  factory Labcheckoutmodel.fromJson(Map<String, dynamic> json) =>
      Labcheckoutmodel(
        id: json["Id"],
        labName: json["LabName"],
        labTypeName: json["LabTypeName"],
        year: json["year"],
        fee: json["Fee"],
        gst: json["GST"],
        totalFee: json["TotalFee"],
        testDate:
            json["TestDate"] == null ? null : DateTime.parse(json["TestDate"]),
        slotTime: json["SlotTime"],
        deviceId: json["DeviceId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "LabTypeName": labTypeName,
        "year": year,
        "Fee": fee,
        "GST": gst,
        "TotalFee": totalFee,
        "TestDate": testDate?.toIso8601String(),
        "SlotTime": slotTime,
        "DeviceId": deviceId,
      };
}
