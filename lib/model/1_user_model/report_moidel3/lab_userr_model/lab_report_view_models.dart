// To parse this JSON data, do
//
//     final labReportUserImage = labReportUserImageFromJson(jsonString);

import 'dart:convert';

LabReportUserImage labReportUserImageFromJson(String str) =>
    LabReportUserImage.fromJson(json.decode(str));

String labReportUserImageToJson(LabReportUserImage data) =>
    json.encode(data.toJson());

class LabReportUserImage {
  List<LabViewReportFile>? labViewReportFile;

  LabReportUserImage({
    this.labViewReportFile,
  });

  factory LabReportUserImage.fromJson(Map<String, dynamic> json) =>
      LabReportUserImage(
        labViewReportFile: json["LabViewReport_file"] == null
            ? []
            : List<LabViewReportFile>.from(json["LabViewReport_file"]!
                .map((x) => LabViewReportFile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabViewReport_file": labViewReportFile == null
            ? []
            : List<dynamic>.from(labViewReportFile!.map((x) => x.toJson())),
      };
}

class LabViewReportFile {
  String? file;

  LabViewReportFile({
    this.file,
  });

  factory LabViewReportFile.fromJson(Map<String, dynamic> json) =>
      LabViewReportFile(
        file: json["File"],
      );

  Map<String, dynamic> toJson() => {
        "File": file,
      };
}
