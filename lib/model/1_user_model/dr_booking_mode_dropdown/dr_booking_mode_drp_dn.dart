// To parse this JSON data, do
//
//     final doctorbookingMode = doctorbookingModeFromJson(jsonString);

import 'dart:convert';

DoctorbookingMode doctorbookingModeFromJson(String str) =>
    DoctorbookingMode.fromJson(json.decode(str));

String doctorbookingModeToJson(DoctorbookingMode data) =>
    json.encode(data.toJson());

class DoctorbookingMode {
  List<BookingMode>? bookingMode;

  DoctorbookingMode({
    this.bookingMode,
  });

  factory DoctorbookingMode.fromJson(Map<String, dynamic> json) =>
      DoctorbookingMode(
        bookingMode: json["BookingMode"] == null
            ? []
            : List<BookingMode>.from(
                json["BookingMode"]!.map((x) => BookingMode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BookingMode": bookingMode == null
            ? []
            : List<dynamic>.from(bookingMode!.map((x) => x.toJson())),
      };
}

class BookingMode {
  int? id;
  String? mode;

  BookingMode({
    this.id,
    this.mode,
  });

  factory BookingMode.fromJson(Map<String, dynamic> json) => BookingMode(
        id: json["Id"],
        mode: json["Mode"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Mode": mode,
      };
}
