// To parse this JSON data, do
//
//     final nurseAppointmentDetail = nurseAppointmentDetailFromJson(jsonString);

import 'dart:convert';

NurseAppointmentDetail nurseAppointmentDetailFromJson(String str) =>
    NurseAppointmentDetail.fromJson(json.decode(str));

String nurseAppointmentDetailToJson(NurseAppointmentDetail data) =>
    json.encode(data.toJson());

class NurseAppointmentDetail {
  List<Datum>? data;

  NurseAppointmentDetail({
    this.data,
  });

  factory NurseAppointmentDetail.fromJson(Map<String, dynamic> json) =>
      NurseAppointmentDetail(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? nurseName;
  String? location;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? paymentDate;
  num? fee;
  num? totalFee;
  num? totalNumberofdays;
  dynamic deviceId;
  String? invoiceNumber;
  String? orderId;

  Datum({
    this.id,
    this.nurseName,
    this.location,
    this.startDate,
    this.endDate,
    this.paymentDate,
    this.fee,
    this.totalFee,
    this.totalNumberofdays,
    this.deviceId,
    this.invoiceNumber,
    this.orderId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        nurseName: json["NurseName"],
        location: json["Location"],
        startDate: json["StartDate"] == null
            ? null
            : DateTime.parse(json["StartDate"]),
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
        fee: json["Fee"],
        totalFee: json["TotalFee"],
        totalNumberofdays: json["TotalNumberofdays"],
        deviceId: json["DeviceId"],
        invoiceNumber: json["InvoiceNumber"],
        orderId: json["OrderId"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "NurseName": nurseName,
        "Location": location,
        "StartDate": startDate?.toIso8601String(),
        "EndDate": endDate?.toIso8601String(),
        "PaymentDate": paymentDate?.toIso8601String(),
        "Fee": fee,
        "TotalFee": totalFee,
        "TotalNumberofdays": totalNumberofdays,
        "DeviceId": deviceId,
        "InvoiceNumber": invoiceNumber,
        "OrderId": orderId,
      };
}
