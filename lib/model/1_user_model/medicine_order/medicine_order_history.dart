// To parse this JSON data, do
//
//     final medicineOrderHistory = medicineOrderHistoryFromJson(jsonString);

import 'dart:convert';

MedicineOrderHistory medicineOrderHistoryFromJson(String str) => MedicineOrderHistory.fromJson(json.decode(str));

String medicineOrderHistoryToJson(MedicineOrderHistory data) => json.encode(data.toJson());

class MedicineOrderHistory {
  MedicineOrderHistory({
    this.paMedicine,
  });

  List<PaMedicine>? paMedicine;

  factory MedicineOrderHistory.fromJson(Map<String, dynamic> json) => MedicineOrderHistory(
    paMedicine: json["PaMedicine"] == null ? [] : List<PaMedicine>.from(json["PaMedicine"]!.map((x) => PaMedicine.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PaMedicine": paMedicine == null ? [] : List<dynamic>.from(paMedicine!.map((x) => x.toJson())),
  };
}

class PaMedicine {
  PaMedicine({
    this.id,
    this.medicineName,
    this.medicineTypeName,
    //this.medicineDescription,
    this.brandName,
    this.amount,
    this.quantity,
    this.orderId,
    this.invoiceNumber,
    this.deliveryAddress,
    this.deliveryDate,
  });

  int? id;
  String? medicineName;
  String? medicineTypeName;
  //dynamic medicineDescription;
  String? brandName;
  double? amount;
  int? quantity;
  String? orderId;
  String? invoiceNumber;
  String? deliveryAddress;
  DateTime? deliveryDate;

  factory PaMedicine.fromJson(Map<String, dynamic> json) => PaMedicine(
    id: json["Id"],
    medicineName: json["MedicineName"],
    medicineTypeName: json["MedicineTypeName"],
    //medicineDescription: json["MedicineDescription"],
    brandName: json["BrandName"],
    amount: json["Amount"],
    quantity: json["Quantity"],
    orderId: json["OrderId"],
    invoiceNumber: json["InvoiceNumber"],
    deliveryAddress: json["DeliveryAddress"],
    deliveryDate: json["DeliveryDate"] == null ? null : DateTime.parse(json["DeliveryDate"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "MedicineName": medicineName,
    "MedicineTypeName": medicineTypeName,
    //"MedicineDescription": medicineDescription,
    "BrandName": brandName,
    "Amount": amount,
    "Quantity": quantity,
    "OrderId": orderId,
    "InvoiceNumber": invoiceNumber,
    "DeliveryAddress": deliveryAddress,
    "DeliveryDate": deliveryDate?.toIso8601String(),
  };
}
