// To parse this JSON data, do
//
//     final ongoingRideModel = ongoingRideModelFromJson(jsonString);

import 'dart:convert';

OngoingRideModel ongoingRideModelFromJson(String str) =>
    OngoingRideModel.fromJson(json.decode(str));

String ongoingRideModelToJson(OngoingRideModel data) =>
    json.encode(data.toJson());

class OngoingRideModel {
  int? id;
  int? patientId;
  String? patientName;
  String? mobileNumber;
  num? totalPrice;
  double? latDriver;
  double? langDriver;
  double? startLat;
  double? startLong;
  double? endLat;
  double? endLong;
  num? driverUserDistance;
  num? expectedTime;
  num? totalDistance;
  String? deviceId;
  String? pickupLocation;
  String? dropLocation;

  OngoingRideModel({
    this.id,
    this.patientId,
    this.patientName,
    this.mobileNumber,
    this.totalPrice,
    this.latDriver,
    this.langDriver,
    this.startLat,
    this.startLong,
    this.endLat,
    this.endLong,
    this.driverUserDistance,
    this.expectedTime,
    this.totalDistance,
    this.deviceId,
    this.pickupLocation,
    this.dropLocation,
  });

  factory OngoingRideModel.fromJson(Map<String, dynamic> json) =>
      OngoingRideModel(
        id: json["Id"],
        patientId: json["PatientId"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        totalPrice: json["TotalPrice"],
        latDriver: json["Lat_Driver"]?.toDouble(),
        langDriver: json["Lang_Driver"]?.toDouble(),
        startLat: json["start_Lat"]?.toDouble(),
        startLong: json["start_Long"]?.toDouble(),
        endLat: json["end_Lat"]?.toDouble(),
        endLong: json["end_Long"]?.toDouble(),
        driverUserDistance: json["DriverUserDistance"],
        expectedTime: json["ExpectedTime"],
        totalDistance: json["TotalDistance"],
        deviceId: json["DeviceId"],
        pickupLocation: json["PickupLocation"],
        dropLocation: json["DropLocation"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientId": patientId,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "TotalPrice": totalPrice,
        "Lat_Driver": latDriver,
        "Lang_Driver": langDriver,
        "start_Lat": startLat,
        "start_Long": startLong,
        "end_Lat": endLat,
        "end_Long": endLong,
        "DriverUserDistance": driverUserDistance,
        "ExpectedTime": expectedTime,
        "TotalDistance": totalDistance,
        "DeviceId": deviceId,
        "PickupLocation": pickupLocation,
        "DropLocation": dropLocation,
      };
}
