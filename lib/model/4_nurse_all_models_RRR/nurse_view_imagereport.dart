// To parse this JSON data, do
//
//     final nurseImageviewModel = nurseImageviewModelFromJson(jsonString);

import 'dart:convert';

NurseImageviewModel nurseImageviewModelFromJson(String str) =>
    NurseImageviewModel.fromJson(json.decode(str));

String nurseImageviewModelToJson(NurseImageviewModel data) =>
    json.encode(data.toJson());

class NurseImageviewModel {
  List<NurseViewReportFile>? nurseViewReportFile;

  NurseImageviewModel({
    this.nurseViewReportFile,
  });

  factory NurseImageviewModel.fromJson(Map<String, dynamic> json) =>
      NurseImageviewModel(
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
