// To parse this JSON data, do
//
//     final emergencyAmbulanceList = emergencyAmbulanceListFromJson(jsonString);

import 'dart:convert';

EmergencyAmbulanceList emergencyAmbulanceListFromJson(String str) =>
    EmergencyAmbulanceList.fromJson(json.decode(str));

String emergencyAmbulanceListToJson(EmergencyAmbulanceList data) =>
    json.encode(data.toJson());

class EmergencyAmbulanceList {
  double? lat;
  double? lang;
  double? endLong;
  double? endLat;
  num? ambulanceTypeId;
  dynamic vehicleTypeId;
  num? patientId;
  List<Message>? message;

  EmergencyAmbulanceList({
    this.lat,
    this.lang,
    this.endLong,
    this.endLat,
    this.ambulanceTypeId,
    this.vehicleTypeId,
    this.patientId,
    this.message,
  });

  factory EmergencyAmbulanceList.fromJson(Map<String, dynamic> json) =>
      EmergencyAmbulanceList(
        lat: json["Lat"]?.toDouble(),
        lang: json["Lang"]?.toDouble(),
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
        "Lat": lat,
        "Lang": lang,
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
  String? deviceId;
  String? mobileNumber;
  num? toatlDistance;

  Message({
    this.id,
    this.driverId,
    this.km,
    this.name,
    this.dl,
    this.charge,
    this.totalPrice,
    this.deviceId,
    this.mobileNumber,
    this.toatlDistance,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["Id"],
        driverId: json["DriverId"],
        km: json["KM"],
        name: json["Name"],
        dl: json["DL"],
        charge: json["Charge"],
        totalPrice: json["TotalPrice"],
        deviceId: json["DeviceId"],
        mobileNumber: json["MobileNumber"],
        toatlDistance: json["ToatlDistance"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "KM": km,
        "Name": name,
        "DL": dl,
        "Charge": charge,
        "TotalPrice": totalPrice,
        "DeviceId": deviceId,
        "MobileNumber": mobileNumber,
        "ToatlDistance": toatlDistance,
      };
}
