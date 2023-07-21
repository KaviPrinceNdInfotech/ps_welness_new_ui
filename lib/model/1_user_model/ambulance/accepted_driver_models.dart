// To parse this JSON data, do
//
//     final driveracceptModeluser = driveracceptModeluserFromJson(jsonString);

import 'dart:convert';

DriveracceptModeluser driveracceptModeluserFromJson(String str) =>
    DriveracceptModeluser.fromJson(json.decode(str));

String driveracceptModeluserToJson(DriveracceptModeluser data) =>
    json.encode(data.toJson());

class DriveracceptModeluser {
  num? id;
  num? driverId;
  String? driverName;
  String? mobileNumber;
  String? driverImage;
  String? dlNumber;
  num? totalPrice;
  String? vehicleNumber;
  String? vehicleTypeName;
  num? toatlDistance;

  DriveracceptModeluser({
    this.id,
    this.driverId,
    this.driverName,
    this.mobileNumber,
    this.driverImage,
    this.dlNumber,
    this.totalPrice,
    this.vehicleNumber,
    this.vehicleTypeName,
    this.toatlDistance,
  });

  factory DriveracceptModeluser.fromJson(Map<String, dynamic> json) =>
      DriveracceptModeluser(
        id: json["Id"],
        driverId: json["DriverId"],
        driverName: json["DriverName"],
        mobileNumber: json["MobileNumber"],
        driverImage: json["DriverImage"],
        dlNumber: json["DlNumber"],
        totalPrice: json["TotalPrice"],
        vehicleNumber: json["VehicleNumber"],
        vehicleTypeName: json["VehicleTypeName"],
        toatlDistance: json["ToatlDistance"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "DriverImage": driverImage,
        "DlNumber": dlNumber,
        "TotalPrice": totalPrice,
        "VehicleNumber": vehicleNumber,
        "VehicleTypeName": vehicleTypeName,
        "ToatlDistance": toatlDistance,
      };
}
