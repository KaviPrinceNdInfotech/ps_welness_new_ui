// To parse this JSON data, do
//
//     final medicineCartListModel = medicineCartListModelFromJson(jsonString);

import 'dart:convert';

MedicineCartListModel medicineCartListModelFromJson(String str) =>
    MedicineCartListModel.fromJson(json.decode(str));

String medicineCartListModelToJson(MedicineCartListModel data) =>
    json.encode(data.toJson());

class MedicineCartListModel {
  List<Datum>? data;
  num? totalPrice;
  num? quantity;
  int? status;
  String? message;

  MedicineCartListModel({
    this.data,
    this.totalPrice,
    this.quantity,
    this.status,
    this.message,
  });

  factory MedicineCartListModel.fromJson(Map<String, dynamic> json) =>
      MedicineCartListModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalPrice: json["TotalPrice"],
        quantity: json["Quantity"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "TotalPrice": totalPrice,
        "Quantity": quantity,
        "status": status,
        "message": message,
      };
}

class Datum {
  int? id;
  String? medicineName;
  String? brandName;
  num? quantity;
  num? unitPrice;
  num? totalPrice;

  Datum({
    this.id,
    this.medicineName,
    this.brandName,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        medicineName: json["MedicineName"],
        brandName: json["BrandName"],
        quantity: json["Quantity"],
        unitPrice: json["UnitPrice"],
        totalPrice: json["TotalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "MedicineName": medicineName,
        "BrandName": brandName,
        "Quantity": quantity,
        "UnitPrice": unitPrice,
        "TotalPrice": totalPrice,
      };
}
