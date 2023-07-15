// To parse this JSON data, do
//
//     final frenchiesTestList = frenchiesTestListFromJson(jsonString);

import 'dart:convert';

FrenchiesTestListModel frenchiesTestListFromJson(String str) => FrenchiesTestListModel.fromJson(json.decode(str));

String frenchiesTestListToJson(FrenchiesTestListModel data) => json.encode(data.toJson());

class FrenchiesTestListModel {
  List<TestList>? testList;

  FrenchiesTestListModel({
    this.testList,
  });

  factory FrenchiesTestListModel.fromJson(Map<String, dynamic> json) => FrenchiesTestListModel(
    testList: json["TestList"] == null ? [] : List<TestList>.from(json["TestList"]!.map((x) => TestList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "TestList": testList == null ? [] : List<dynamic>.from(testList!.map((x) => x.toJson())),
  };
}

class TestList {
  int? id;
  String? testName;

  TestList({
    this.id,
    this.testName,
  });

  factory TestList.fromJson(Map<String, dynamic> json) => TestList(
    id: json["Id"],
    testName: json["TestName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "TestName": testName,
  };
}
