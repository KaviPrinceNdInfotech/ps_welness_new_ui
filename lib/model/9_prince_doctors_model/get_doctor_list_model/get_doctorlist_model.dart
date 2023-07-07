// To parse this JSON data, do
//
//     final getDoctorListModel = getDoctorListModelFromJson(jsonString);

import 'dart:convert';

GetDoctorListModel getDoctorListModelFromJson(String str) =>
    GetDoctorListModel.fromJson(json.decode(str));

String getDoctorListModelToJson(GetDoctorListModel data) =>
    json.encode(data.toJson());

class GetDoctorListModel {
  List<Doctorchoose>? doctorchoose;

  GetDoctorListModel({
    this.doctorchoose,
  });

  factory GetDoctorListModel.fromJson(Map<String, dynamic> json) =>
      GetDoctorListModel(
        doctorchoose: json["Doctorchoose"] == null
            ? []
            : List<Doctorchoose>.from(
                json["Doctorchoose"]!.map((x) => Doctorchoose.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Doctorchoose": doctorchoose == null
            ? []
            : List<dynamic>.from(doctorchoose!.map((x) => x.toJson())),
      };
}

class Doctorchoose {
  int? id;
  String? doctorName;
  String? departmentName;
  num? fee;
  int? experience;
  num? rating;
  String? about;

  Doctorchoose({
    this.id,
    this.doctorName,
    this.departmentName,
    this.fee,
    this.experience,
    this.rating,
    this.about,
  });

  factory Doctorchoose.fromJson(Map<String, dynamic> json) => Doctorchoose(
        id: json["Id"],
        doctorName: json["DoctorName"],
        departmentName: json["DepartmentName"],
        fee: json["Fee"],
        experience: json["Experience"],
        rating: json["Rating"],
        about: json["About"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DoctorName": doctorName,
        "DepartmentName": departmentName,
        "Fee": fee,
        "Experience": experience,
        "Rating": rating,
        "About": about,
      };
}
