// To parse this JSON data, do
//
//     final frenchiesTdsReportDdModel = frenchiesTdsReportDdModelFromJson(jsonString);

import 'dart:convert';

FrenchiesTdsReportDdModel frenchiesTdsReportDdModelFromJson(String str) => FrenchiesTdsReportDdModel.fromJson(json.decode(str));

String frenchiesTdsReportDdModelToJson(FrenchiesTdsReportDdModel data) => json.encode(data.toJson());

class FrenchiesTdsReportDdModel {
  List<TdsDropdown> tdsDropdown;

  FrenchiesTdsReportDdModel({
    required this.tdsDropdown,
  });
  factory FrenchiesTdsReportDdModel.fromJson(Map<String, dynamic> json) => FrenchiesTdsReportDdModel(
    tdsDropdown: List<TdsDropdown>.from(json["TDSDropdown"].map((x) => TdsDropdown.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "TDSDropdown": List<dynamic>.from(tdsDropdown.map((x) => x.toJson())),
  };
}

class TdsDropdown {
  int id;
  String name;

  TdsDropdown({
    required this.id,
    required this.name,
  });

  factory TdsDropdown.fromJson(Map<String, dynamic> json) => TdsDropdown(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}
