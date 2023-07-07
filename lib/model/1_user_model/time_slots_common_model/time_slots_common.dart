// To parse this JSON data, do
//
//     final timeSlots = timeSlotsFromJson(jsonString);

import 'dart:convert';

TimeSlots timeSlotsFromJson(String str) => TimeSlots.fromJson(json.decode(str));

String timeSlotsToJson(TimeSlots data) => json.encode(data.toJson());

class TimeSlots {
  TimeSlots({
    this.timeSlots,
  });

  List<TimeSlot>? timeSlots;

  factory TimeSlots.fromJson(Map<String, dynamic> json) => TimeSlots(
    timeSlots: List<TimeSlot>.from(json["TimeSlots"].map((x) => TimeSlot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "TimeSlots": List<dynamic>.from(timeSlots!.map((x) => x.toJson())),
  };
}

class TimeSlot {
  TimeSlot({
    this.slotid,
    this.slotTime,
  });

  int ?slotid;
  String? slotTime;

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
    slotid: json["Slotid"],
    slotTime: json["SlotTime"],
  );

  Map<String, dynamic> toJson() => {
    "Slotid": slotid,
    "SlotTime": slotTime,
  };
}
