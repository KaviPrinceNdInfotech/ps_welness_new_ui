// To parse this JSON data, do
//
//     final testNameModel = testNameModelFromJson(jsonString);

import 'dart:convert';

TestNameModel testNameModelFromJson(String str) =>
    TestNameModel.fromJson(json.decode(str));

String testNameModelToJson(TestNameModel data) => json.encode(data.toJson());

class TestNameModel {
  TestNameModel({
    required this.tests,
  });

  List<TestModel> tests;

  factory TestNameModel.fromJson(Map<String, dynamic> json) => TestNameModel(
        tests: List<TestModel>.from(
            json["Tests"].map((x) => TestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Tests": List<dynamic>.from(tests.map((x) => x.toJson())),
      };
}

class TestModel {
  TestModel({
    required this.id,
    required this.testName,
  });

  int id;
  String testName;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json["Id"],
        testName: json["TestName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "TestName": testName,
      };
}
