// To parse this JSON data, do
//
//     final slotTomeing = slotTomeingFromJson(jsonString);

import 'dart:convert';

SlotTomeing slotTomeingFromJson(String str) =>
    SlotTomeing.fromJson(json.decode(str));

String slotTomeingToJson(SlotTomeing data) => json.encode(data.toJson());

class SlotTomeing {
  List<String>? slotdd;

  SlotTomeing({
    this.slotdd,
  });

  factory SlotTomeing.fromJson(Map<String, dynamic> json) => SlotTomeing(
        slotdd: json["slotdd"] == null
            ? []
            : List<String>.from(json["slotdd"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "slotdd":
            slotdd == null ? [] : List<dynamic>.from(slotdd!.map((x) => x)),
      };
}
