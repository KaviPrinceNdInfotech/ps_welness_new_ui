// To parse this JSON data, do
//
//     final nurseReportUserListView = nurseReportUserListViewFromJson(jsonString);

import 'dart:convert';

NurseReportUserListView nurseReportUserListViewFromJson(String str) =>
    NurseReportUserListView.fromJson(json.decode(str));

String nurseReportUserListViewToJson(NurseReportUserListView data) =>
    json.encode(data.toJson());

class NurseReportUserListView {
  List<NurseViewssReport>? nurseViewReport;

  NurseReportUserListView({
    this.nurseViewReport,
  });

  factory NurseReportUserListView.fromJson(Map<String, dynamic> json) =>
      NurseReportUserListView(
        nurseViewReport: json["NurseViewReport"] == null
            ? []
            : List<NurseViewssReport>.from(json["NurseViewReport"]!
                .map((x) => NurseViewssReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "NurseViewReport": nurseViewReport == null
            ? []
            : List<dynamic>.from(nurseViewReport!.map((x) => x.toJson())),
      };
}

class NurseViewssReport {
  int? id;
  String? nurseName;
  String? file;

  NurseViewssReport({
    this.id,
    this.nurseName,
    this.file,
  });

  factory NurseViewssReport.fromJson(Map<String, dynamic> json) =>
      NurseViewssReport(
        id: json["Id"],
        nurseName: json["NurseName"],
        file: json["File"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NurseName": nurseName,
        "File": file,
      };
}
