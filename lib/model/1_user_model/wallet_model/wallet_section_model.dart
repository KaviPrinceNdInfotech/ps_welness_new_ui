
// // To parse this JSON data, do
// //
// //     final walletModel = walletModelFromJson(jsonString);
//
// import 'dart:convert';
//
// WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));
//
// String walletModelToJson(WalletModel data) => json.encode(data.toJson());
//
// class WalletModel {
//   WalletModel({
//     required this.result,
//     required this.status,
//     required this.message,
//   });
//
//   List<Result> result;
//   int status;
//   String message;
//
//   factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
//     result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result.map((x) => x.toJson())),
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     required this.id,
//     required this.walletAmount,
//   });
//
//   int id;
//   // int walletAmount;
//   double walletAmount;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["Id"],
//     walletAmount: json["walletAmount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "walletAmount": walletAmount,
//   };
// }

///new model
// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

// WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));
//
// String walletModelToJson(WalletModel data) => json.encode(data.toJson());
//
// class WalletModel {
//   WalletModel({
//     required this.result,
//     required this.status,
//     required this.message,
//   });
//
//   List<Result> result;
//   int status;
//   String message;
//
//   factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
//     result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result.map((x) => x.toJson())),
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     required this.id,
//     required this.walletAmount,
//   });
//
//   int id;
//   double? walletAmount;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["Id"],
//     walletAmount: json["walletAmount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "walletAmount": walletAmount,
//   };
// }

// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  WalletModel({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Result {
  Result({
    this.id,
    this.walletAmount,
  });

  int? id;
  double ?walletAmount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    walletAmount: json["walletAmount"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "walletAmount": walletAmount,
  };
}


