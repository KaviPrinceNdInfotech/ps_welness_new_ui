// To parse this JSON data, do
//
//     final doctorAppoinmentDetail = doctorAppoinmentDetailFromJson(jsonString);

import 'dart:convert';

List<DoctorAppoinmentDetailModel> doctorAppoinmentDetailFromJson(String str) => List<DoctorAppoinmentDetailModel>.from(json.decode(str).map((x) => DoctorAppoinmentDetailModel.fromJson(x)));

String doctorAppoinmentDetailToJson(List<DoctorAppoinmentDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorAppoinmentDetailModel {
  DoctorAppoinmentDetailModel({
    this.id,
    this.doctorName,
    this.location,
    this.startTime,
    this.endTime,
    this.disease,
    this.status,
    this.message,
  });

  int? id;
  String? doctorName;
  String? location;
  String? startTime;
  String? endTime;
  String? disease;
  bool? status;
  dynamic message;

  factory DoctorAppoinmentDetailModel.fromJson(Map<String, dynamic> json) => DoctorAppoinmentDetailModel(
    id: json["Id"],
    doctorName: json["DoctorName"],
    location: json["Location"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    disease: json["Disease"],
    status: json["Status"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DoctorName": doctorName,
    "Location": location,
    "StartTime": startTime,
    "EndTime": endTime,
    "Disease": disease,
    "Status": status,
    "Message": message,
  };
}
