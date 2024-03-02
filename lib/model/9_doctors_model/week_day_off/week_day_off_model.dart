// To parse this JSON data, do
//
//     final weekAbsentSelect = weekAbsentSelectFromJson(jsonString);

import 'dart:convert';

WeekAbsentSelect weekAbsentSelectFromJson(String str) =>
    WeekAbsentSelect.fromJson(json.decode(str));

String weekAbsentSelectToJson(WeekAbsentSelect data) =>
    json.encode(data.toJson());

class WeekAbsentSelect {
  List<Day>? days;

  WeekAbsentSelect({
    this.days,
  });

  factory WeekAbsentSelect.fromJson(Map<String, dynamic> json) =>
      WeekAbsentSelect(
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days!.map((x) => x.toJson())),
      };
}

class Day {
  int? id;
  String? name;

  Day({
    this.id,
    this.name,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["Id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
      };
}
