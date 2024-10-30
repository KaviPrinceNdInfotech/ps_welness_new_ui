// To parse this JSON data, do
//
//     final emergencyComingDriver = emergencyComingDriverFromJson(jsonString);

import 'dart:convert';

EmergencyComingDriver emergencyComingDriverFromJson(String str) =>
    EmergencyComingDriver.fromJson(json.decode(str));

String emergencyComingDriverToJson(EmergencyComingDriver data) =>
    json.encode(data.toJson());

class EmergencyComingDriver {
  num? id;
  num? driverId;
  String? driverName;
  dynamic invoiceNumber;
  String? mobileNumber;
  String? driverImage;
  String? dlNumber;
  num? totalPrice;
  dynamic paidAmount;
  dynamic remainingAmount;
  String? vehicleNumber;
  dynamic vehicleTypeName;
  num? toatlDistance;
  double? latDriver;
  double? langDriver;
  double? userLat;
  double? userLong;
  double? endLat;
  double? endLong;
  double? driverUserDistance;
  num? expectedTime;
  dynamic paymentDate;
  String? pickupLocation;
  String? dropLocation;

  EmergencyComingDriver({
    this.id,
    this.driverId,
    this.driverName,
    this.invoiceNumber,
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
    this.endLat,
    this.endLong,
    this.driverUserDistance,
    this.expectedTime,
    this.paymentDate,
    this.pickupLocation,
    this.dropLocation,
  });

  factory EmergencyComingDriver.fromJson(Map<String, dynamic> json) =>
      EmergencyComingDriver(
        id: json["Id"],
        driverId: json["DriverId"],
        driverName: json["DriverName"],
        invoiceNumber: json["InvoiceNumber"],
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
        endLat: json["end_Lat"]?.toDouble(),
        endLong: json["end_Long"]?.toDouble(),
        driverUserDistance: json["DriverUserDistance"]?.toDouble(),
        expectedTime: json["ExpectedTime"],
        paymentDate: json["PaymentDate"],
        pickupLocation: json["PickupLocation"],
        dropLocation: json["DropLocation"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "DriverName": driverName,
        "InvoiceNumber": invoiceNumber,
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
        "end_Lat": endLat,
        "end_Long": endLong,
        "DriverUserDistance": driverUserDistance,
        "ExpectedTime": expectedTime,
        "PaymentDate": paymentDate,
        "PickupLocation": pickupLocation,
        "DropLocation": dropLocation,
      };
}
