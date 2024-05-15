// // To parse this JSON data, do
// //
// //     final testNameModellab = testNameModellabFromJson(jsonString);
//
// import 'dart:convert';
//
// TestNameModellab testNameModellabFromJson(String str) => TestNameModellab.fromJson(json.decode(str));
//
// String testNameModellabToJson(TestNameModellab data) => json.encode(data.toJson());
//
// class TestNameModellab {
//   List<Testmodeldropdown>? tests;
//
//   TestNameModellab({
//     this.tests,
//   });
//
//   factory TestNameModellab.fromJson(Map<String, dynamic> json) => TestNameModellab(
//     tests: json["Tests"] == null ? [] : List<Testmodeldropdown>.from(json["Tests"]!.map((x) => Testmodeldropdown.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Tests": tests == null ? [] : List<dynamic>.from(tests!.map((x) => x.toJson())),
//   };
// }
//
// class Testmodeldropdown {
//   int? id;
//   String? testName;
//
//   Testmodeldropdown({
//     this.id,
//     this.testName,
//   });
//
//   factory Testmodeldropdown.fromJson(Map<String, dynamic> json) => Testmodeldropdown(
//     id: json["Id"],
//     testName: json["TestName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "TestName": testName,
//   };
// }
