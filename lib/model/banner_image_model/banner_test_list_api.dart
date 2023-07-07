// // To parse this JSON data, do
// //
// //     final sliderListModel = sliderListModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SliderListModel sliderListModelFromJson(String str) =>
//     SliderListModel.fromJson(json.decode(str));
//
// String sliderListModelToJson(SliderListModel data) =>
//     json.encode(data.toJson());
//
// class SliderListModel {
//   SliderListModel({
//     this.bannerImageList,
//     this.status,
//     this.message,
//   });
//
//   List<String>? bannerImageList;
//   int? status;
//   String? message;
//
//   factory SliderListModel.fromJson(Map<String, dynamic> json) =>
//       SliderListModel(
//         bannerImageList:
//         List<String>.from(json["BannerImageList"].map((x) => x)),
//         status: json["status"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "BannerImageList": List<dynamic>.from(bannerImageList!.map((x) => x)),
//     "status": status,
//     "message": message,
//   };
// }
