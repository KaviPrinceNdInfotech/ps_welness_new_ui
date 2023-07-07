// To parse this JSON data, do
//
//     final franchiseGetGallery = franchiseGetGalleryFromJson(jsonString);

import 'dart:convert';

FranchiseGetGalleryModel franchiseGetGalleryFromJson(String str) => FranchiseGetGalleryModel.fromJson(json.decode(str));

String franchiseGetGalleryToJson(FranchiseGetGalleryModel data) => json.encode(data.toJson());

class FranchiseGetGalleryModel {
  List<Gallery>? gallery;

  FranchiseGetGalleryModel({
    this.gallery,
  });

  factory FranchiseGetGalleryModel.fromJson(Map<String, dynamic> json) => FranchiseGetGalleryModel(
    gallery: json["Gallery"] == null ? [] : List<Gallery>.from(json["Gallery"]!.map((x) => Gallery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x.toJson())),
  };
}

class Gallery {
  int? id;
  String? imageName;
  String? images;

  Gallery({
    this.id,
    this.imageName,
    this.images,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["Id"],
    imageName: json["ImageName"],
    images: json["Images"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ImageName": imageName,
    "Images": images,
  };
}
