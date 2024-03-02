// To parse this JSON data, do
//
//     final franchiseIdSelect = franchiseIdSelectFromJson(jsonString);

import 'dart:convert';

FranchiseIdSelect franchiseIdSelectFromJson(String str) =>
    FranchiseIdSelect.fromJson(json.decode(str));

String franchiseIdSelectToJson(FranchiseIdSelect data) =>
    json.encode(data.toJson());

class FranchiseIdSelect {
  List<Vendor>? vendor;

  FranchiseIdSelect({
    this.vendor,
  });

  factory FranchiseIdSelect.fromJson(Map<String, dynamic> json) =>
      FranchiseIdSelect(
        vendor:
            List<Vendor>.from(json["Vendor"].map((x) => Vendor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Vendor": List<dynamic>.from(vendor!.map((x) => x.toJson())),
      };
}

class Vendor {
  int? id;
  String? companyName;

  Vendor({
    this.id,
    this.companyName,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["Id"],
        companyName: json["CompanyName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CompanyName": companyName,
      };
}
