// To parse this JSON data, do
//
//     final driveracceptModeluser = driveracceptModeluserFromJson(jsonString);

import 'dart:convert';

DriveracceptModeluser driveracceptModeluserFromJson(String str) =>
    DriveracceptModeluser.fromJson(json.decode(str));

String driveracceptModeluserToJson(DriveracceptModeluser data) =>
    json.encode(data.toJson());

class DriveracceptModeluser {
  int? id;
  num? driverId;
  String? driverName;
  String? mobileNumber;
  String? deviceId;
  dynamic driverImage;
  String? dlNumber;
  num? totalPrice;
  num? payableAmount;
  String? vehicleNumber;
  String? vehicleTypeName;
  num? toatlDistance;

  DriveracceptModeluser({
    this.id,
    this.driverId,
    this.driverName,
    this.mobileNumber,
    this.deviceId,
    this.driverImage,
    this.dlNumber,
    this.totalPrice,
    this.payableAmount,
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
        deviceId: json["DeviceId"],
        driverImage: json["DriverImage"],
        dlNumber: json["DlNumber"],
        totalPrice: json["TotalPrice"],
        payableAmount: json["PayableAmount"],
        vehicleNumber: json["VehicleNumber"],
        vehicleTypeName: json["VehicleTypeName"],
        toatlDistance: json["ToatlDistance"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "DeviceId": deviceId,
        "DriverImage": driverImage,
        "DlNumber": dlNumber,
        "TotalPrice": totalPrice,
        "PayableAmount": payableAmount,
        "VehicleNumber": vehicleNumber,
        "VehicleTypeName": vehicleTypeName,
        "ToatlDistance": toatlDistance,
      };
}

///old......17...april...2024..
// DriveracceptModeluser driveracceptModeluserFromJson(String str) =>
//     DriveracceptModeluser.fromJson(json.decode(str));
//
// String driveracceptModeluserToJson(DriveracceptModeluser data) =>
//     json.encode(data.toJson());
//
// class DriveracceptModeluser {
//   int? id;
//   num? driverId;
//   String? driverName;
//   String? mobileNumber;
//   String? driverImage;
//   String? dlNumber;
//   num? totalPrice;
//   num? payableAmount;
//   String? vehicleNumber;
//   String? vehicleTypeName;
//   num? toatlDistance;
//
//   ///http://pswellness.in/api/DriverApi/GetAcceptedReqDriverDetail?Id=294
//
//   DriveracceptModeluser({
//     this.id,
//     this.driverId,
//     this.driverName,
//     this.mobileNumber,
//     this.driverImage,
//     this.dlNumber,
//     this.totalPrice,
//     this.payableAmount,
//     this.vehicleNumber,
//     this.vehicleTypeName,
//     this.toatlDistance,
//   });
//
//   factory DriveracceptModeluser.fromJson(Map<String, dynamic> json) =>
//       DriveracceptModeluser(
//         id: json["Id"],
//         driverId: json["DriverId"],
//         driverName: json["DriverName"],
//         mobileNumber: json["MobileNumber"],
//         driverImage: json["DriverImage"],
//         dlNumber: json["DlNumber"],
//         totalPrice: json["TotalPrice"],
//         payableAmount: json["PayableAmount"],
//         vehicleNumber: json["VehicleNumber"],
//         vehicleTypeName: json["VehicleTypeName"],
//         toatlDistance: json["ToatlDistance"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DriverId": driverId,
//         "DriverName": driverName,
//         "MobileNumber": mobileNumber,
//         "DriverImage": driverImage,
//         "DlNumber": dlNumber,
//         "TotalPrice": totalPrice,
//         "PayableAmount": payableAmount,
//         "VehicleNumber": vehicleNumber,
//         "VehicleTypeName": vehicleTypeName,
//         "ToatlDistance": toatlDistance,
//       };
// }
