// To parse this JSON data, do
//
//     final timeDurationSlot = timeDurationSlotFromJson(jsonString);

import 'dart:convert';

TimeDurationSlot timeDurationSlotFromJson(String str) =>
    TimeDurationSlot.fromJson(json.decode(str));

String timeDurationSlotToJson(TimeDurationSlot data) =>
    json.encode(data.toJson());

class TimeDurationSlot {
  List<DurationSlot>? durationSlot;

  TimeDurationSlot({
    this.durationSlot,
  });

  factory TimeDurationSlot.fromJson(Map<String, dynamic> json) =>
      TimeDurationSlot(
        durationSlot: List<DurationSlot>.from(
            json["DurationSlot"].map((x) => DurationSlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DurationSlot":
            List<dynamic>.from(durationSlot!.map((x) => x.toJson())),
      };
}

class DurationSlot {
  int? durationId;
  String? durationTime;

  DurationSlot({
    this.durationId,
    this.durationTime,
  });

  factory DurationSlot.fromJson(Map<String, dynamic> json) => DurationSlot(
        durationId: json["DurationId"],
        durationTime: json["DurationTime"],
      );

  Map<String, dynamic> toJson() => {
        "DurationId": durationId,
        "DurationTime": durationTime,
      };
}
