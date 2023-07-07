// To parse this JSON data, do
//
//     final frenchiesBannerApiMode = frenchiesBannerApiModeFromJson(jsonString);

import 'dart:convert';

FrenchiesBannerApiMode frenchiesBannerApiModeFromJson(String str) => FrenchiesBannerApiMode.fromJson(json.decode(str));

String frenchiesBannerApiModeToJson(FrenchiesBannerApiMode data) => json.encode(data.toJson());

class FrenchiesBannerApiMode {
  List<BannerImageList> bannerImageList;
  int status;
  String message;

  FrenchiesBannerApiMode({
    required this.bannerImageList,
    required this.status,
    required this.message,
  });

  factory FrenchiesBannerApiMode.fromJson(Map<String, dynamic> json) => FrenchiesBannerApiMode(
    bannerImageList: List<BannerImageList>.from(json["BannerImageList"].map((x) => BannerImageList.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "BannerImageList": List<dynamic>.from(bannerImageList.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class BannerImageList {
  int id;
  String bannerPath;
  dynamic imageFile;
  int proId;
  dynamic bannerlist;

  BannerImageList({
    required this.id,
    required this.bannerPath,
    this.imageFile,
    required this.proId,
    this.bannerlist,
  });

  factory BannerImageList.fromJson(Map<String, dynamic> json) => BannerImageList(
    id: json["ID"],
    bannerPath: json["BannerPath"],
    imageFile: json["ImageFile"],
    proId: json["pro_id"],
    bannerlist: json["bannerlist"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "BannerPath": bannerPath,
    "ImageFile": imageFile,
    "pro_id": proId,
    "bannerlist": bannerlist,
  };
}
