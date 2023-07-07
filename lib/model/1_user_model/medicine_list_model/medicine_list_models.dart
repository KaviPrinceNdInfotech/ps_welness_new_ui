// To parse this JSON data, do
//
//     final medicineList = medicineListFromJson(jsonString);

import 'dart:convert';

MedicineList medicineListFromJson(String str) => MedicineList.fromJson(json.decode(str));

String medicineListToJson(MedicineList data) => json.encode(data.toJson());

class MedicineList {
  MedicineList({
    required this.data,
  });

  List<Datum> data;

  factory MedicineList.fromJson(Map<String, dynamic> json) => MedicineList(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.medicineName,
    required this.medicineDescription,
    required this.medicineTypeId,
    required this.isDeleted,
    required this.mrp,
    required this.brandName,
  });

  int id;
  String medicineName;
  String medicineDescription;
  int medicineTypeId;
  bool isDeleted;
  double mrp;
  String brandName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    medicineName: json["MedicineName"],
    medicineDescription: json["MedicineDescription"],
    medicineTypeId: json["MedicineType_Id"],
    isDeleted: json["IsDeleted"],
    mrp: json["MRP"],
    brandName: json["BrandName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "MedicineName": medicineName,
    "MedicineDescription": medicineDescription,
    "MedicineType_Id": medicineTypeId,
    "IsDeleted": isDeleted,
    "MRP": mrp,
    "BrandName": brandName,
  };
}
