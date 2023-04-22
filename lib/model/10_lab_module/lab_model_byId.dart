// To parse this JSON data, do
//
//     final labHistorybyLabId = labHistorybyLabIdFromJson(jsonString);

import 'dart:convert';

LabHistorybyLabId labHistorybyLabIdFromJson(String str) => LabHistorybyLabId.fromJson(json.decode(str));

String labHistorybyLabIdToJson(LabHistorybyLabId data) => json.encode(data.toJson());

class LabHistorybyLabId {
  LabHistorybyLabId({
    this.testList,
    this.bookingHistory,
    this.totalPages,
    this.pageNumber,
    this.patientName,
  });

  List<TestList>? testList;
  dynamic bookingHistory;
  int? totalPages;
  int? pageNumber;
  dynamic patientName;

  factory LabHistorybyLabId.fromJson(Map<String, dynamic> json) => LabHistorybyLabId(
    testList: json["TestList"] == null ? [] : List<TestList>.from(json["TestList"]!.map((x) => TestList.fromJson(x))),
    bookingHistory: json["BookingHistory"],
    totalPages: json["TotalPages"],
    pageNumber: json["PageNumber"],
    patientName: json["PatientName"],
  );

  Map<String, dynamic> toJson() => {
    "TestList": testList == null ? [] : List<dynamic>.from(testList!.map((x) => x.toJson())),
    "BookingHistory": bookingHistory,
    "TotalPages": totalPages,
    "PageNumber": pageNumber,
    "PatientName": patientName,
  };
}

class TestList {
  TestList({
    this.id,
    this.labId,
    this.patientName,
    this.patientAddress,
    this.contactNumber,
    this.testDate,
    this.availableTime,
    this.testName,
    this.testAmount,
    this.isTaken,
  });

  int? id;
  int? labId;
  PatientName? patientName;
  PatientAddress? patientAddress;
  String? contactNumber;
  DateTime? testDate;
  AvailableTime? availableTime;
  TestName? testName;
  double? testAmount;
  bool? isTaken;

  factory TestList.fromJson(Map<String, dynamic> json) => TestList(
    id: json["Id"],
    labId: json["LabId"],
    patientName: patientNameValues.map[json["PatientName"]]!,
    patientAddress: patientAddressValues.map[json["PatientAddress"]]!,
    contactNumber: json["ContactNumber"],
    testDate: json["TestDate"] == null ? null : DateTime.parse(json["TestDate"]),
    availableTime: availableTimeValues.map[json["AvailableTime"]]!,
    testName: testNameValues.map[json["TestName"]]!,
    testAmount: json["TestAmount"],
    isTaken: json["IsTaken"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "LabId": labId,
    "PatientName": patientNameValues.reverse[patientName],
    "PatientAddress": patientAddressValues.reverse[patientAddress],
    "ContactNumber": contactNumber,
    "TestDate": testDate?.toIso8601String(),
    "AvailableTime": availableTimeValues.reverse[availableTime],
    "TestName": testNameValues.reverse[testName],
    "TestAmount": testAmount,
    "IsTaken": isTaken,
  };
}

enum AvailableTime { THE_930_AM_1030_AM }

final availableTimeValues = EnumValues({
  "9:30AM-10:30AM": AvailableTime.THE_930_AM_1030_AM
});

enum PatientAddress { NOIDA }

final patientAddressValues = EnumValues({
  "noida": PatientAddress.NOIDA
});

enum PatientName { A }

final patientNameValues = EnumValues({
  "a": PatientName.A
});

enum TestName { BLOOD }

final testNameValues = EnumValues({
  "Blood": TestName.BLOOD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
