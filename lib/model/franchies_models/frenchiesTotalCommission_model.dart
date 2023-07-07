// To parse this JSON data, do
//
//     final frenchiesTotalCommissionModel = frenchiesTotalCommissionModelFromJson(jsonString);

import 'dart:convert';

FrenchiesTotalCommissionModel frenchiesTotalCommissionModelFromJson(String str) => FrenchiesTotalCommissionModel.fromJson(json.decode(str));

String frenchiesTotalCommissionModelToJson(FrenchiesTotalCommissionModel data) => json.encode(data.toJson());

class FrenchiesTotalCommissionModel {
  num? totalCommissionAmount;

  FrenchiesTotalCommissionModel({
    this.totalCommissionAmount,
  });

  factory FrenchiesTotalCommissionModel.fromJson(Map<String, dynamic> json) => FrenchiesTotalCommissionModel(
    totalCommissionAmount: json["TotalCommissionAmount"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "TotalCommissionAmount": totalCommissionAmount,
  };
}
