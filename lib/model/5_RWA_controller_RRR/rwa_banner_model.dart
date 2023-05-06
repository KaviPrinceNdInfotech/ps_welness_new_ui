// To parse this JSON data, do
//
//     final rwaBannerModel = rwaBannerModelFromJson(jsonString);

import 'dart:convert';

RwaBannerModel rwaBannerModelFromJson(String str) => RwaBannerModel.fromJson(json.decode(str));

String rwaBannerModelToJson(RwaBannerModel data) => json.encode(data.toJson());

class RwaBannerModel {
  List<BannerImageList>? bannerImageList;
  int? status;
  String? message;

  RwaBannerModel({
    this.bannerImageList,
    this.status,
    this.message,
  });

  factory RwaBannerModel.fromJson(Map<String, dynamic> json) => RwaBannerModel(
    bannerImageList: json["BannerImageList"] == null ? [] : List<BannerImageList>.from(json["BannerImageList"]!.map((x) => BannerImageList.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "BannerImageList": bannerImageList == null ? [] : List<dynamic>.from(bannerImageList!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class BannerImageList {
  int? id;
  String? bannerPath;
  dynamic imageFile;
  int? proId;
  dynamic bannerlist;

  BannerImageList({
    this.id,
    this.bannerPath,
    this.imageFile,
    this.proId,
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
