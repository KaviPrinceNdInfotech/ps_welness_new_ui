// To parse this JSON data, do
//
//     final complainSubjectModel = complainSubjectModelFromJson(jsonString);

import 'dart:convert';

ComplainSubjectModel complainSubjectModelFromJson(String str) => ComplainSubjectModel.fromJson(json.decode(str));

String complainSubjectModelToJson(ComplainSubjectModel data) => json.encode(data.toJson());

class ComplainSubjectModel {
  ComplainSubjectModel({
    required this.complaint41Patient,
  });

  List<Complaint41Patient> complaint41Patient;

  factory ComplainSubjectModel.fromJson(Map<String, dynamic> json) => ComplainSubjectModel(
    complaint41Patient: List<Complaint41Patient>.from(json["Complaint41Patient"].map((x) => Complaint41Patient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Complaint41Patient": List<dynamic>.from(complaint41Patient.map((x) => x.toJson())),
  };
}

class Complaint41Patient {
  Complaint41Patient({
    required this.subid,
    required this.subjectName,
  });

  int subid;
  String subjectName;

  factory Complaint41Patient.fromJson(Map<String, dynamic> json) => Complaint41Patient(
    subid: json["Subid"],
    subjectName: json["SubjectName"],
  );

  Map<String, dynamic> toJson() => {
    "Subid": subid,
    "SubjectName": subjectName,
  };
}
