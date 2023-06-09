// To parse this JSON data, do
//
//     final doctorImageviewModel = doctorImageviewModelFromJson(jsonString);

import 'dart:convert';

DoctorImageviewModel doctorImageviewModelFromJson(String str) =>
    DoctorImageviewModel.fromJson(json.decode(str));

String doctorImageviewModelToJson(DoctorImageviewModel data) =>
    json.encode(data.toJson());

class DoctorImageviewModel {
  List<DoctorViewReportFile>? doctorViewReportFile;

  DoctorImageviewModel({
    this.doctorViewReportFile,
  });

  factory DoctorImageviewModel.fromJson(Map<String, dynamic> json) =>
      DoctorImageviewModel(
        doctorViewReportFile: json["DoctorViewReport_file"] == null
            ? []
            : List<DoctorViewReportFile>.from(json["DoctorViewReport_file"]!
                .map((x) => DoctorViewReportFile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DoctorViewReport_file": doctorViewReportFile == null
            ? []
            : List<dynamic>.from(doctorViewReportFile!.map((x) => x.toJson())),
      };
}

class DoctorViewReportFile {
  String? image1;

  DoctorViewReportFile({
    this.image1,
  });

  factory DoctorViewReportFile.fromJson(Map<String, dynamic> json) =>
      DoctorViewReportFile(
        image1: json["Image1"],
      );

  Map<String, dynamic> toJson() => {
        "Image1": image1,
      };
}
