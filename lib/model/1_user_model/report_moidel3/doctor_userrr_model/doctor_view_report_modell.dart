// To parse this JSON data, do
//
//     final doctorReportUserImageView = doctorReportUserImageViewFromJson(jsonString);

import 'dart:convert';

DoctorReportUserImageView doctorReportUserImageViewFromJson(String str) =>
    DoctorReportUserImageView.fromJson(json.decode(str));

String doctorReportUserImageViewToJson(DoctorReportUserImageView data) =>
    json.encode(data.toJson());

class DoctorReportUserImageView {
  List<DoctorViewReportFile>? doctorViewReportFile;

  DoctorReportUserImageView({
    this.doctorViewReportFile,
  });

  factory DoctorReportUserImageView.fromJson(Map<String, dynamic> json) =>
      DoctorReportUserImageView(
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
