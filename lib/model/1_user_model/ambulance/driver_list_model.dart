// To parse this JSON data, do
//
//     final driverListApi = driverListApiFromJson(jsonString);

import 'dart:convert';

DriverListApi driverListApiFromJson(String str) =>
    DriverListApi.fromJson(json.decode(str));

String driverListApiToJson(DriverListApi data) => json.encode(data.toJson());

class DriverListApi {
  double? startLat;
  double? startLong;
  double? endLong;
  double? endLat;
  num? ambulanceTypeId;
  num? vehicleTypeId;
  num? patientId;
  List<Message>? message;

  DriverListApi({
    this.startLat,
    this.startLong,
    this.endLong,
    this.endLat,
    this.ambulanceTypeId,
    this.vehicleTypeId,
    this.patientId,
    this.message,
  });

  factory DriverListApi.fromJson(Map<String, dynamic> json) => DriverListApi(
        startLat: json["start_Lat"]?.toDouble(),
        startLong: json["start_Long"]?.toDouble(),
        endLong: json["end_Long"]?.toDouble(),
        endLat: json["end_Lat"]?.toDouble(),
        ambulanceTypeId: json["AmbulanceType_id"],
        vehicleTypeId: json["VehicleType_id"],
        patientId: json["Patient_Id"],
        message: json["Message"] == null
            ? []
            : List<Message>.from(
                json["Message"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_Lat": startLat,
        "start_Long": startLong,
        "end_Long": endLong,
        "end_Lat": endLat,
        "AmbulanceType_id": ambulanceTypeId,
        "VehicleType_id": vehicleTypeId,
        "Patient_Id": patientId,
        "Message": message == null
            ? []
            : List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class Message {
  num? id;
  num? driverId;
  num? km;
  String? name;
  String? dl;
  num? charge;
  num? totalPrice;

  Message({
    this.id,
    this.driverId,
    this.km,
    this.name,
    this.dl,
    this.charge,
    this.totalPrice,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["Id"],
        driverId: json["DriverId"],
        km: json["KM"],
        name: json["Name"],
        dl: json["DL"],
        charge: json["Charge"],
        totalPrice: json["TotalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "KM": km,
        "Name": name,
        "DL": dl,
        "Charge": charge,
        "TotalPrice": totalPrice,
      };
}
