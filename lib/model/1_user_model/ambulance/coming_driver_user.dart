// To parse this JSON data, do
//
//     final ambulanceComingUser = ambulanceComingUserFromJson(jsonString);

import 'dart:convert';

AmbulanceComingUser ambulanceComingUserFromJson(String str) =>
    AmbulanceComingUser.fromJson(json.decode(str));

String ambulanceComingUserToJson(AmbulanceComingUser data) =>
    json.encode(data.toJson());

class AmbulanceComingUser {
  int? id;
  num? driverId;
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
  num? expectedTime;
  DateTime? paymentDate;

  AmbulanceComingUser({
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

  factory AmbulanceComingUser.fromJson(Map<String, dynamic> json) =>
      AmbulanceComingUser(
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
        expectedTime: json["ExpectedTime"],
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
