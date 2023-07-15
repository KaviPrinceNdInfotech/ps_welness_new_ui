// To parse this JSON data, do
//
//     final frenchiesTotalTdsModel = frenchiesTotalTdsModelFromJson(jsonString);

import 'dart:convert';

FrenchiesTotalTdsModel frenchiesTotalTdsModelFromJson(String str) => FrenchiesTotalTdsModel.fromJson(json.decode(str));

String frenchiesTotalTdsModelToJson(FrenchiesTotalTdsModel data) => json.encode(data.toJson());

class FrenchiesTotalTdsModel {
  num? amount;

  FrenchiesTotalTdsModel({
    this.amount,
  });

  factory FrenchiesTotalTdsModel.fromJson(Map<String, dynamic> json) => FrenchiesTotalTdsModel(
    amount: json["TotalTDSAmount"],
  );

  Map<String, dynamic> toJson() => {
    "TotalTDSAmount": amount,
  };
}
