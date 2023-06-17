// To parse this JSON data, do
//
//     final driverAppoinmentDetailModel = driverAppoinmentDetailModelFromJson(jsonString);

import 'dart:convert';

DriverAppoinmentDetailModel driverAppoinmentDetailModelFromJson(String str) =>
    DriverAppoinmentDetailModel.fromJson(json.decode(str));

String driverAppoinmentDetailModelToJson(DriverAppoinmentDetailModel data) =>
    json.encode(data.toJson());

class DriverAppoinmentDetailModel {
  List<AppointmentDetail>? appointmentDetail;

  DriverAppoinmentDetailModel({
    this.appointmentDetail,
  });

  factory DriverAppoinmentDetailModel.fromJson(Map<String, dynamic> json) =>
      DriverAppoinmentDetailModel(
        appointmentDetail: json["AppointmentDetail"] == null
            ? []
            : List<AppointmentDetail>.from(json["AppointmentDetail"]!
                .map((x) => AppointmentDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AppointmentDetail": appointmentDetail == null
            ? []
            : List<dynamic>.from(appointmentDetail!.map((x) => x.toJson())),
      };
}

class AppointmentDetail {
  int? id;
  String? driverName;
  String? vehicleName;
  String? location;
  String? dlImage;
  dynamic joiningDate;

  AppointmentDetail({
    this.id,
    this.driverName,
    this.vehicleName,
    this.location,
    this.dlImage,
    this.joiningDate,
  });

  factory AppointmentDetail.fromJson(Map<String, dynamic> json) =>
      AppointmentDetail(
        id: json["Id"],
        driverName: json["DriverName"],
        vehicleName: json["VehicleName"],
        location: json["Location"],
        dlImage: json["DlImage"],
        joiningDate: json["JoiningDate"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverName": driverName,
        "VehicleName": vehicleName,
        "Location": location,
        "DlImage": dlImage,
        "JoiningDate": joiningDate,
      };
}
