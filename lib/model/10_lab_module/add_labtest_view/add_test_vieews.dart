// To parse this JSON data, do
//
//     final labtestaddedlist = labtestaddedlistFromJson(jsonString);

import 'dart:convert';

Labtestaddedlist labtestaddedlistFromJson(String str) =>
    Labtestaddedlist.fromJson(json.decode(str));

String labtestaddedlistToJson(Labtestaddedlist data) =>
    json.encode(data.toJson());

class Labtestaddedlist {
  List<LabTest>? labTest;

  Labtestaddedlist({
    this.labTest,
  });

  factory Labtestaddedlist.fromJson(Map<String, dynamic> json) =>
      Labtestaddedlist(
        labTest: json["LabTest"] == null
            ? []
            : List<LabTest>.from(
                json["LabTest"]!.map((x) => LabTest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabTest": labTest == null
            ? []
            : List<dynamic>.from(labTest!.map((x) => x.toJson())),
      };
}

class LabTest {
  int? id;
  String? testName;

  LabTest({
    this.id,
    this.testName,
  });

  factory LabTest.fromJson(Map<String, dynamic> json) => LabTest(
        id: json["Id"],
        testName: json["TestName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "TestName": testName,
      };
}
