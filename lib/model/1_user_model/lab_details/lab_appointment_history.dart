// To parse this JSON data, do
//
//     final labappointmentbyuserid = labappointmentbyuseridFromJson(jsonString);

import 'dart:convert';

Labappointmentbyuserid labappointmentbyuseridFromJson(String str) =>
    Labappointmentbyuserid.fromJson(json.decode(str));

String labappointmentbyuseridToJson(Labappointmentbyuserid data) =>
    json.encode(data.toJson());

class Labappointmentbyuserid {
  List<Kk>? kk;

  Labappointmentbyuserid({
    this.kk,
  });

  factory Labappointmentbyuserid.fromJson(Map<String, dynamic> json) =>
      Labappointmentbyuserid(
        kk: json["kk"] == null
            ? []
            : List<Kk>.from(json["kk"]!.map((x) => Kk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kk": kk == null ? [] : List<dynamic>.from(kk!.map((x) => x.toJson())),
      };
}

class Kk {
  int? id;
  String? labName;
  String? testName;
  DateTime? testDate;
  num? testAmount;
  String? location;
  String? invoiceNumber;
  String? orderId;

  Kk({
    this.id,
    this.labName,
    this.testName,
    this.testDate,
    this.testAmount,
    this.location,
    this.invoiceNumber,
    this.orderId,
  });

  factory Kk.fromJson(Map<String, dynamic> json) => Kk(
        id: json["Id"],
        labName: json["LabName"],
        testName: json["TestName"],
        testDate:
            json["TestDate"] == null ? null : DateTime.parse(json["TestDate"]),
        testAmount: json["TestAmount"],
        location: json["Location"],
        invoiceNumber: json["InvoiceNumber"],
        orderId: json["OrderId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "LabName": labName,
        "TestName": testName,
        "TestDate": testDate?.toIso8601String(),
        "TestAmount": testAmount,
        "Location": location,
        "InvoiceNumber": invoiceNumber,
        "OrderId": orderId,
      };
}
