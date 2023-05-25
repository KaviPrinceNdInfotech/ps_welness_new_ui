// To parse this JSON data, do
//
//     final chemistBannerModel = chemistBannerModelFromJson(jsonString);

import 'dart:convert';

ChemistBannerModel chemistBannerModelFromJson(String str) => ChemistBannerModel.fromJson(json.decode(str));

String chemistBannerModelToJson(ChemistBannerModel data) => json.encode(data.toJson());

class ChemistBannerModel {
  List<BannerImageList>? bannerImageList;
  int? status;
  String? message;

  ChemistBannerModel({
    this.bannerImageList,
    this.status,
    this.message,
  });

  factory ChemistBannerModel.fromJson(Map<String, dynamic> json) => ChemistBannerModel(
    bannerImageList: List<BannerImageList>.from(json["BannerImageList"].map((x) => BannerImageList.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "BannerImageList": List<dynamic>.from(bannerImageList!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class BannerImageList {
  int? id;
  String? bannerPath;
  dynamic? imageFile;
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
