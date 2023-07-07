//To parse this JSON data, do
//
//     final getDoctorDetailbyId = getDoctorDetailbyIdFromJson(jsonString);

import 'dart:convert';

GetDoctorDetailbyId getDoctorDetailbyIdFromJson(String str) =>
    GetDoctorDetailbyId.fromJson(json.decode(str));

String getDoctorDetailbyIdToJson(GetDoctorDetailbyId data) =>
    json.encode(data.toJson());

class GetDoctorDetailbyId {
  int? id;
  String? doctorName;
  dynamic experience;
  num? fee;
  dynamic about;
  dynamic departmentName;
  num? rating;

  GetDoctorDetailbyId({
    this.id,
    this.doctorName,
    this.experience,
    this.fee,
    this.about,
    this.departmentName,
    this.rating,
  });

  factory GetDoctorDetailbyId.fromJson(Map<String, dynamic> json) =>
      GetDoctorDetailbyId(
        id: json["Id"],
        doctorName: json["DoctorName"],
        experience: json["Experience"],
        fee: json["Fee"],
        about: json["About"],
        departmentName: json["DepartmentName"],
        rating: json["Rating"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DoctorName": doctorName,
        "Experience": experience,
        "Fee": fee,
        "About": about,
        "DepartmentName": departmentName,
        "Rating": rating,
      };
}
