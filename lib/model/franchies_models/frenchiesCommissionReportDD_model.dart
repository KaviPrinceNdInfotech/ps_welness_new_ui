// To parse this JSON data, do
//
//     final frenchiesCommissionReportDdModel = frenchiesCommissionReportDdModelFromJson(jsonString);

import 'dart:convert';

FrenchiesCommissionReportDdModel frenchiesCommissionReportDdModelFromJson(String str) => FrenchiesCommissionReportDdModel.fromJson(json.decode(str));

String frenchiesCommissionReportDdModelToJson(FrenchiesCommissionReportDdModel data) => json.encode(data.toJson());

class FrenchiesCommissionReportDdModel {
  List<CommissionDropdown> commissionDropdown;

  FrenchiesCommissionReportDdModel({
    required this.commissionDropdown,
  });

  factory FrenchiesCommissionReportDdModel.fromJson(Map<String, dynamic> json) => FrenchiesCommissionReportDdModel(
    commissionDropdown: List<CommissionDropdown>.from(json["CommissionDropdown"].map((x) => CommissionDropdown.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CommissionDropdown": List<dynamic>.from(commissionDropdown.map((x) => x.toJson())),
  };
}

class CommissionDropdown {
  int id;
  String name;

  CommissionDropdown({
    required this.id,
    required this.name,
  });

  factory CommissionDropdown.fromJson(Map<String, dynamic> json) => CommissionDropdown(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}
