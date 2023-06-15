// To parse this JSON data, do
//
//     final nurseReportUserImageView = nurseReportUserImageViewFromJson(jsonString);

import 'dart:convert';

NurseReportUserImageView nurseReportUserImageViewFromJson(String str) =>
    NurseReportUserImageView.fromJson(json.decode(str));

String nurseReportUserImageViewToJson(NurseReportUserImageView data) =>
    json.encode(data.toJson());

class NurseReportUserImageView {
  List<NurseViewReportFile>? nurseViewReportFile;

  NurseReportUserImageView({
    this.nurseViewReportFile,
  });

  factory NurseReportUserImageView.fromJson(Map<String, dynamic> json) =>
      NurseReportUserImageView(
        nurseViewReportFile: json["NurseViewReport_file"] == null
            ? []
            : List<NurseViewReportFile>.from(json["NurseViewReport_file"]!
                .map((x) => NurseViewReportFile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "NurseViewReport_file": nurseViewReportFile == null
            ? []
            : List<dynamic>.from(nurseViewReportFile!.map((x) => x.toJson())),
      };
}

class NurseViewReportFile {
  String? file;

  NurseViewReportFile({
    this.file,
  });

  factory NurseViewReportFile.fromJson(Map<String, dynamic> json) =>
      NurseViewReportFile(
        file: json["File"],
      );

  Map<String, dynamic> toJson() => {
        "File": file,
      };
}
