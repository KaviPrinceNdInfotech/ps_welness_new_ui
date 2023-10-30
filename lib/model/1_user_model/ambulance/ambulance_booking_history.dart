// To parse this JSON data, do
//
//     final ambulanceUserPaymentHistory = ambulanceUserPaymentHistoryFromJson(jsonString);

import 'dart:convert';

AmbulanceUserPaymentHistory ambulanceUserPaymentHistoryFromJson(String str) =>
    AmbulanceUserPaymentHistory.fromJson(json.decode(str));

String ambulanceUserPaymentHistoryToJson(AmbulanceUserPaymentHistory data) =>
    json.encode(data.toJson());

class AmbulanceUserPaymentHistory {
  List<DriverDetail>? driverDetails;

  AmbulanceUserPaymentHistory({
    this.driverDetails,
  });

  factory AmbulanceUserPaymentHistory.fromJson(Map<String, dynamic> json) =>
      AmbulanceUserPaymentHistory(
        driverDetails: json["driverDetails"] == null
            ? []
            : List<DriverDetail>.from(
                json["driverDetails"]!.map((x) => DriverDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "driverDetails": driverDetails == null
            ? []
            : List<dynamic>.from(driverDetails!.map((x) => x.toJson())),
      };
}

class DriverDetail {
  int? id;
  int? driverId;
  String? driverName;
  String? mobileNumber;
  String? driverImage;
  String? dlNumber;
  num? totalPrice;
  num? paidAmount;
  num? remainingAmount;
  String? vehicleNumber;
  String? vehicleTypeName;
  num? toatlDistance;
  double? latDriver;
  double? langDriver;
  double? userLat;
  double? userLong;
  double? driverUserDistance;
  double? expectedTime;
  DateTime? paymentDate;

  DriverDetail({
    this.id,
    this.driverId,
    this.driverName,
    this.mobileNumber,
    this.driverImage,
    this.dlNumber,
    this.totalPrice,
    this.paidAmount,
    this.remainingAmount,
    this.vehicleNumber,
    this.vehicleTypeName,
    this.toatlDistance,
    this.latDriver,
    this.langDriver,
    this.userLat,
    this.userLong,
    this.driverUserDistance,
    this.expectedTime,
    this.paymentDate,
  });

  factory DriverDetail.fromJson(Map<String, dynamic> json) => DriverDetail(
        id: json["Id"],
        driverId: json["DriverId"],
        driverName: json["DriverName"],
        mobileNumber: json["MobileNumber"],
        driverImage: json["DriverImage"],
        dlNumber: json["DlNumber"],
        totalPrice: json["TotalPrice"],
        paidAmount: json["PaidAmount"],
        remainingAmount: json["RemainingAmount"],
        vehicleNumber: json["VehicleNumber"],
        vehicleTypeName: json["VehicleTypeName"],
        toatlDistance: json["ToatlDistance"],
        latDriver: json["Lat_Driver"]?.toDouble(),
        langDriver: json["Lang_Driver"]?.toDouble(),
        userLat: json["UserLat"]?.toDouble(),
        userLong: json["UserLong"]?.toDouble(),
        driverUserDistance: json["DriverUserDistance"]?.toDouble(),
        expectedTime: json["ExpectedTime"]?.toDouble(),
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "DriverImage": driverImage,
        "DlNumber": dlNumber,
        "TotalPrice": totalPrice,
        "PaidAmount": paidAmount,
        "RemainingAmount": remainingAmount,
        "VehicleNumber": vehicleNumber,
        "VehicleTypeName": vehicleTypeName,
        "ToatlDistance": toatlDistance,
        "Lat_Driver": latDriver,
        "Lang_Driver": langDriver,
        "UserLat": userLat,
        "UserLong": userLong,
        "DriverUserDistance": driverUserDistance,
        "ExpectedTime": expectedTime,
        "PaymentDate": paymentDate?.toIso8601String(),
      };
}
