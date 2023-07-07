// To parse this JSON data, do
//
//     final aboutUsModelDoctor = aboutUsModelDoctorFromJson(jsonString);

import 'dart:convert';

AboutUsModelDoctor aboutUsModelDoctorFromJson(String str) =>
    AboutUsModelDoctor.fromJson(json.decode(str));

String aboutUsModelDoctorToJson(AboutUsModelDoctor data) =>
    json.encode(data.toJson());

class AboutUsModelDoctor {
  About? about;

  AboutUsModelDoctor({
    this.about,
  });

  factory AboutUsModelDoctor.fromJson(Map<String, dynamic> json) =>
      AboutUsModelDoctor(
        about: json["About"] == null ? null : About.fromJson(json["About"]),
      );

  Map<String, dynamic> toJson() => {
        "About": about?.toJson(),
      };
}

class About {
  String? about;

  About({
    this.about,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
        about: json["About"],
      );

  Map<String, dynamic> toJson() => {
        "About": about,
      };
}
