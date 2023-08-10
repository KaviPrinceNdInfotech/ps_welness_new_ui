// To parse this JSON data, do
//
//     final testNameModelNew = testNameModelNewFromJson(jsonString);

import 'dart:convert';

TestNameModelNew testNameModelNewFromJson(String str) =>
    TestNameModelNew.fromJson(json.decode(str));

String testNameModelNewToJson(TestNameModelNew data) =>
    json.encode(data.toJson());

class TestNameModelNew {
  List<LabTestName>? labTestName;

  TestNameModelNew({
    this.labTestName,
  });

  factory TestNameModelNew.fromJson(Map<String, dynamic> json) =>
      TestNameModelNew(
        labTestName: json["LabTestName"] == null
            ? []
            : List<LabTestName>.from(
                json["LabTestName"]!.map((x) => LabTestName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabTestName": labTestName == null
            ? []
            : List<dynamic>.from(labTestName!.map((x) => x.toJson())),
      };
}

class LabTestName {
  int? id;
  String? testDesc;

  LabTestName({
    this.id,
    this.testDesc,
  });

  factory LabTestName.fromJson(Map<String, dynamic> json) => LabTestName(
        id: json["Id"],
        testDesc: json["TestDesc"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "TestDesc": testDesc,
      };
}
