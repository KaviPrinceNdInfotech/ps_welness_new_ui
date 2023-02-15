// To parse this JSON data, do
//
//     final getDoctorListHospitalModel = getDoctorListHospitalModelFromJson(jsonString);

import 'dart:convert';

GetDoctorListHospitalModel getDoctorListHospitalModelFromJson(String str) => GetDoctorListHospitalModel.fromJson(json.decode(str));

String getDoctorListHospitalModelToJson(GetDoctorListHospitalModel data) => json.encode(data.toJson());

class GetDoctorListHospitalModel {
  GetDoctorListHospitalModel({
    this.message,
    this.status,
    this.list,
  });

  String? message;
  int? status;
  List<dynamic>? list;

  factory GetDoctorListHospitalModel.fromJson(Map<String, dynamic> json) => GetDoctorListHospitalModel(
    message: json["Message"],
    status: json["Status"],
    list: json["list"] == null ? [] : List<dynamic>.from(json["list"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Status": status,
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x)),
  };
}
