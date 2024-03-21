// To parse this JSON data, do
//
//     final slotTmeingDoctor = slotTmeingDoctorFromJson(jsonString);

import 'dart:convert';

SlotTmeingDoctor slotTmeingDoctorFromJson(String str) =>
    SlotTmeingDoctor.fromJson(json.decode(str));

String slotTmeingDoctorToJson(SlotTmeingDoctor data) =>
    json.encode(data.toJson());

class SlotTmeingDoctor {
  List<TimeSlotDoctorss>? timeSlot;

  SlotTmeingDoctor({
    this.timeSlot,
  });

  factory SlotTmeingDoctor.fromJson(Map<String, dynamic> json) =>
      SlotTmeingDoctor(
        timeSlot: json["TimeSlot"] == null
            ? []
            : List<TimeSlotDoctorss>.from(
                json["TimeSlot"]!.map((x) => TimeSlotDoctorss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TimeSlot": timeSlot == null
            ? []
            : List<dynamic>.from(timeSlot!.map((x) => x.toJson())),
      };
}

class TimeSlotDoctorss {
  int? id;
  String? startTime;

  TimeSlotDoctorss({
    this.id,
    this.startTime,
  });

  factory TimeSlotDoctorss.fromJson(Map<String, dynamic> json) =>
      TimeSlotDoctorss(
        id: json["Id"],
        startTime: json["StartTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "StartTime": startTime,
      };
}
