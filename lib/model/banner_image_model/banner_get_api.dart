// To parse this JSON data, do
//
//     final bannerListModel = bannerListModelFromJson(jsonString);

import 'dart:convert';

BannerListModel bannerListModelFromJson(String str) =>
    BannerListModel.fromJson(json.decode(str));

String bannerListModelToJson(BannerListModel data) =>
    json.encode(data.toJson());

class BannerListModel {
  BannerListModel({
    required this.bannerImageList,
    required this.status,
    required this.message,
  });

  List<BannerImageList> bannerImageList;
  int status;
  String message;

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      BannerListModel(
        bannerImageList: List<BannerImageList>.from(
            json["BannerImageList"].map((x) => BannerImageList.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "BannerImageList":
            List<dynamic>.from(bannerImageList.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class BannerImageList {
  BannerImageList({
    required this.id,
    required this.bannerPath,
    this.imageFile,
    required this.proId,
    this.bannerlist,
  });

  int id;
  String bannerPath;
  dynamic imageFile;
  int proId;
  dynamic bannerlist;

  factory BannerImageList.fromJson(Map<String, dynamic> json) =>
      BannerImageList(
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
