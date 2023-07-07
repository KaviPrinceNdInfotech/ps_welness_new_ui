// To parse this JSON data, do
//
//     final doctorBanner = doctorBannerFromJson(jsonString);

import 'dart:convert';

DoctorBannerModel doctorBannerFromJson(String str) => DoctorBannerModel.fromJson(json.decode(str));

String doctorBannerToJson(DoctorBannerModel data) => json.encode(data.toJson());

class DoctorBannerModel {
  DoctorBannerModel({
    this.bannerImageList,
    this.status,
    this.message,
  });

  List<BannerImageList>? bannerImageList;
  int? status;
  String? message;

  factory DoctorBannerModel.fromJson(Map<String, dynamic> json) => DoctorBannerModel(
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
  BannerImageList({
    this.id,
    this.bannerPath,
    this.imageFile,
    this.proId,
    this.bannerlist,
  });

  int? id;
  String? bannerPath;
  dynamic imageFile;
  int? proId;
  dynamic bannerlist;

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
