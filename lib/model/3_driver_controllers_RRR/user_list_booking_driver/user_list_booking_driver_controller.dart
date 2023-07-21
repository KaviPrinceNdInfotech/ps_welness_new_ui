// To parse this JSON data, do
//
//     final userListModeldriver = userListModeldriverFromJson(jsonString);

import 'dart:convert';

UserListModeldriver userListModeldriverFromJson(String str) =>
    UserListModeldriver.fromJson(json.decode(str));

String userListModeldriverToJson(UserListModeldriver data) =>
    json.encode(data.toJson());

class UserListModeldriver {
  List<UserListForBookingAmbulance>? userListForBookingAmbulance;

  UserListModeldriver({
    this.userListForBookingAmbulance,
  });

  factory UserListModeldriver.fromJson(Map<String, dynamic> json) =>
      UserListModeldriver(
        userListForBookingAmbulance: json["UserListForBookingAmbulance"] == null
            ? []
            : List<UserListForBookingAmbulance>.from(
                json["UserListForBookingAmbulance"]!
                    .map((x) => UserListForBookingAmbulance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserListForBookingAmbulance": userListForBookingAmbulance == null
            ? []
            : List<dynamic>.from(
                userListForBookingAmbulance!.map((x) => x.toJson())),
      };
}

class UserListForBookingAmbulance {
  num? id;
  num? patientId;
  String? patientName;
  String? mobileNumber;
  double? endLat;
  double? endLong;
  double? startLat;
  double? startLong;
  String? deviceId;
  num? totalPrice;
  num? toatlDistance;
  String? reverseStartLatLongToLocation;
  String? reverseEndLatLongToLocation;

  UserListForBookingAmbulance({
    this.id,
    this.patientId,
    this.patientName,
    this.mobileNumber,
    this.endLat,
    this.endLong,
    this.startLat,
    this.startLong,
    this.deviceId,
    this.totalPrice,
    this.toatlDistance,
    this.reverseStartLatLongToLocation,
    this.reverseEndLatLongToLocation,
  });

  factory UserListForBookingAmbulance.fromJson(Map<String, dynamic> json) =>
      UserListForBookingAmbulance(
        id: json["Id"],
        patientId: json["PatientId"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        endLat: json["endLat"]?.toDouble(),
        endLong: json["endLong"]?.toDouble(),
        startLat: json["startLat"]?.toDouble(),
        startLong: json["startLong"]?.toDouble(),
        deviceId: json["DeviceId"],
        totalPrice: json["TotalPrice"],
        toatlDistance: json["ToatlDistance"],
        reverseStartLatLongToLocation: json["ReverseStartLatLong_To_Location"],
        reverseEndLatLongToLocation: json["ReverseEndLatLong_To_Location"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientId": patientId,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "endLat": endLat,
        "endLong": endLong,
        "startLat": startLat,
        "startLong": startLong,
        "DeviceId": deviceId,
        "TotalPrice": totalPrice,
        "ToatlDistance": toatlDistance,
        "ReverseStartLatLong_To_Location": reverseStartLatLongToLocation,
        "ReverseEndLatLong_To_Location": reverseEndLatLongToLocation,
      };
}
