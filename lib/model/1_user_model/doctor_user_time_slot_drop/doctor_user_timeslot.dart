// To parse this JSON data, do
//
//     final timeslotDoctorModel = timeslotDoctorModelFromJson(jsonString);

import 'dart:convert';

TimeslotDoctorModel timeslotDoctorModelFromJson(String str) =>
    TimeslotDoctorModel.fromJson(json.decode(str));

String timeslotDoctorModelToJson(TimeslotDoctorModel data) =>
    json.encode(data.toJson());

class TimeslotDoctorModel {
  List<TimeSlotDoctor>? timeSlotdoctor;

  TimeslotDoctorModel({
    this.timeSlotdoctor,
  });

  factory TimeslotDoctorModel.fromJson(Map<String, dynamic> json) =>
      TimeslotDoctorModel(
        timeSlotdoctor: json["TimeSlot"] == null
            ? []
            : List<TimeSlotDoctor>.from(
                json["TimeSlot"]!.map((x) => TimeSlotDoctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TimeSlot": timeSlotdoctor == null
            ? []
            : List<dynamic>.from(timeSlotdoctor!.map((x) => x.toJson())),
      };
}

class TimeSlotDoctor {
  int? id;
  String? slotTime;

  TimeSlotDoctor({
    this.id,
    this.slotTime,
  });

  factory TimeSlotDoctor.fromJson(Map<String, dynamic> json) => TimeSlotDoctor(
        id: json["Id"],
        slotTime: json["SlotTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "SlotTime": slotTime,
      };
}
