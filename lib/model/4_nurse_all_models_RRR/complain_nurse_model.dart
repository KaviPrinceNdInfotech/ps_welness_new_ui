import 'dart:convert';

NurseComplainModel complainnurseSubjectModelFromJson(String str) =>
    NurseComplainModel.fromJson(json.decode(str));

String complainSubjectModelToJson(NurseComplainModel data) =>
    json.encode(data.toJson());

class NurseComplainModel {
  NurseComplainModel({
    required this.complaint41Patient,
  });

  List<ComplaintNurse41Patient> complaint41Patient;

  factory NurseComplainModel.fromJson(Map<String, dynamic> json) =>
      NurseComplainModel(
        complaint41Patient: List<ComplaintNurse41Patient>.from(
            json["Complaint41Patient"]
                .map((x) => ComplaintNurse41Patient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Complaint41Patient":
            List<dynamic>.from(complaint41Patient.map((x) => x.toJson())),
      };
}

class ComplaintNurse41Patient {
  ComplaintNurse41Patient({
    required this.subid,
    required this.subjectName,
  });

  int subid;
  String subjectName;

  factory ComplaintNurse41Patient.fromJson(Map<String, dynamic> json) =>
      ComplaintNurse41Patient(
        subid: json["Subid"],
        subjectName: json["SubjectName"],
      );

  Map<String, dynamic> toJson() => {
        "Subid": subid,
        "SubjectName": subjectName,
      };
}
