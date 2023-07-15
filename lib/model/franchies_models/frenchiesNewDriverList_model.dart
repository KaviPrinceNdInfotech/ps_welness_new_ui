// To parse this JSON data, do
//
//     final frenchiesNewDriverListModel = frenchiesNewDriverListModelFromJson(jsonString);

import 'dart:convert';

FrenchiesNewDriverListModel frenchiesNewDriverListModelFromJson(String str) => FrenchiesNewDriverListModel.fromJson(json.decode(str));

String frenchiesNewDriverListModelToJson(FrenchiesNewDriverListModel data) => json.encode(data.toJson());

class FrenchiesNewDriverListModel {
  List<NewDriver>? newDriver;

  FrenchiesNewDriverListModel({
    this.newDriver,
  });

  factory FrenchiesNewDriverListModel.fromJson(Map<String, dynamic> json) => FrenchiesNewDriverListModel(
    newDriver: json["NewDriver"] == null ? [] : List<NewDriver>.from(json["NewDriver"]!.map((x) => NewDriver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "NewDriver": newDriver == null ? [] : List<dynamic>.from(newDriver!.map((x) => x.toJson())),
  };
}

class NewDriver {
  int? id;
  String? driverName;

  NewDriver({
    this.id,
    this.driverName,
  });

  factory NewDriver.fromJson(Map<String, dynamic> json) => NewDriver(
    id: json["Id"],
    driverName: json["DriverName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DriverName": driverName,
  };
}
