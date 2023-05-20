// To parse this JSON data, do
//
//     final nurseRatingView = nurseRatingViewFromJson(jsonString);

import 'dart:convert';

NurseRatingView nurseRatingViewFromJson(String str) =>
    NurseRatingView.fromJson(json.decode(str));

String nurseRatingViewToJson(NurseRatingView data) =>
    json.encode(data.toJson());

class NurseRatingView {
  List<Rating>? rating;

  NurseRatingView({
    this.rating,
  });

  factory NurseRatingView.fromJson(Map<String, dynamic> json) =>
      NurseRatingView(
        rating: json["rating"] == null
            ? []
            : List<Rating>.from(json["rating"]!.map((x) => Rating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating == null
            ? []
            : List<dynamic>.from(rating!.map((x) => x.toJson())),
      };
}

class Rating {
  int? proId;
  String? professional;
  String? name;
  String? description;
  String? image;
  int? rating;

  Rating({
    this.proId,
    this.professional,
    this.name,
    this.description,
    this.image,
    this.rating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        proId: json["Pro_Id"],
        professional: json["Professional"],
        name: json["Name"],
        description: json["Description"],
        image: json["Image"],
        rating: json["Rating"],
      );

  Map<String, dynamic> toJson() => {
        "Pro_Id": proId,
        "Professional": professional,
        "Name": name,
        "Description": description,
        "Image": image,
        "Rating": rating,
      };
}
