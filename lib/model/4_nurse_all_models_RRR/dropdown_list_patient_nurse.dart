import 'dart:convert';

PatientlistNurseModel patientlistNurseModelFromJson(String str) =>
    PatientlistNurseModel.fromJson(json.decode(str));

String patientlistNurseModelToJson(PatientlistNurseModel data) =>
    json.encode(data.toJson());

class PatientlistNurseModel {
  List<PatientNameNurse>? patientName;

  PatientlistNurseModel({
    this.patientName,
  });

  factory PatientlistNurseModel.fromJson(Map<String, dynamic> json) =>
      PatientlistNurseModel(
        patientName: json["PatientName"] == null
            ? []
            : List<PatientNameNurse>.from(
                json["PatientName"]!.map((x) => PatientNameNurse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PatientName": patientName == null
            ? []
            : List<dynamic>.from(patientName!.map((x) => x.toJson())),
      };
}

class PatientNameNurse {
  int? id;
  String? patientName;

  PatientNameNurse({
    this.id,
    this.patientName,
  });

  factory PatientNameNurse.fromJson(Map<String, dynamic> json) =>
      PatientNameNurse(
        id: json["Id"],
        patientName: json["PatientName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
      };
}
