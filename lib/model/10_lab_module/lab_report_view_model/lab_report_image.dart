// To parse this JSON data, do
//
//     final labReportimage = labReportimageFromJson(jsonString);

import 'dart:convert';

LabReportimage labReportimageFromJson(String str) =>
    LabReportimage.fromJson(json.decode(str));

String labReportimageToJson(LabReportimage data) => json.encode(data.toJson());

class LabReportimage {
  List<LabViewReportFile>? labViewReportFile;

  LabReportimage({
    this.labViewReportFile,
  });

  factory LabReportimage.fromJson(Map<String, dynamic> json) => LabReportimage(
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
