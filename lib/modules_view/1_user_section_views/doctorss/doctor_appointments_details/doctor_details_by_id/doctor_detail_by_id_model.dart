// To parse this JSON data, do
//
//     final getDoctorDetailbyId = getDoctorDetailbyIdFromJson(jsonString);

import 'dart:convert';

GetDoctorDetailbyId getDoctorDetailbyIdFromJson(String str) => GetDoctorDetailbyId.fromJson(json.decode(str));

String getDoctorDetailbyIdToJson(GetDoctorDetailbyId data) => json.encode(data.toJson());

class GetDoctorDetailbyId {
  GetDoctorDetailbyId({
    required this.id,
    required this.doctorName,
    required this.experience,
    required this.fee,
    required this.about,
    required this.departmentName,
  });

  int id;
  String doctorName;
  int experience;
  double fee;
  String about;
  String departmentName;

  factory GetDoctorDetailbyId.fromJson(Map<String, dynamic> json) => GetDoctorDetailbyId(
    id: json["Id"],
    doctorName: json["DoctorName"],
    experience: json["Experience"],
    fee: json["Fee"],
    about: json["About"],
    departmentName: json["DepartmentName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DoctorName": doctorName,
    "Experience": experience,
    "Fee": fee,
    "About": about,
    "DepartmentName": departmentName,
  };
}
