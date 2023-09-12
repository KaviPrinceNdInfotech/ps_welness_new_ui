// To parse this JSON data, do
//
//     final medicineInvoiceModel = medicineInvoiceModelFromJson(jsonString);

import 'dart:convert';

MedicineInvoiceModel medicineInvoiceModelFromJson(String str) =>
    MedicineInvoiceModel.fromJson(json.decode(str));

String medicineInvoiceModelToJson(MedicineInvoiceModel data) =>
    json.encode(data.toJson());

class MedicineInvoiceModel {
  List<InvoiceDatum>? invoiceData;
  String? name;
  String? email;
  String? pinCode;
  String? mobileNo;
  String? address;
  int? grandTotal;
  int? status;
  String? message;

  MedicineInvoiceModel({
    this.invoiceData,
    this.name,
    this.email,
    this.pinCode,
    this.mobileNo,
    this.address,
    this.grandTotal,
    this.status,
    this.message,
  });

  factory MedicineInvoiceModel.fromJson(Map<String, dynamic> json) =>
      MedicineInvoiceModel(
        invoiceData: json["InvoiceData"] == null
            ? []
            : List<InvoiceDatum>.from(
                json["InvoiceData"]!.map((x) => InvoiceDatum.fromJson(x))),
        name: json["Name"],
        email: json["Email"],
        pinCode: json["PinCode"],
        mobileNo: json["MobileNo"],
        address: json["Address"],
        grandTotal: json["GrandTotal"],
        status: json["Status"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "InvoiceData": invoiceData == null
            ? []
            : List<dynamic>.from(invoiceData!.map((x) => x.toJson())),
        "Name": name,
        "Email": email,
        "PinCode": pinCode,
        "MobileNo": mobileNo,
        "Address": address,
        "GrandTotal": grandTotal,
        "Status": status,
        "Message": message,
      };
}

class InvoiceDatum {
  int? patientId;
  int? id;
  String? medicineName;
  int? quantity;
  int? mrp;
  int? amount;
  String? orderId;
  String? invoiceNumber;
  DateTime? orderDate;

  InvoiceDatum({
    this.patientId,
    this.id,
    this.medicineName,
    this.quantity,
    this.mrp,
    this.amount,
    this.orderId,
    this.invoiceNumber,
    this.orderDate,
  });

  factory InvoiceDatum.fromJson(Map<String, dynamic> json) => InvoiceDatum(
        patientId: json["Patient_Id"],
        id: json["Id"],
        medicineName: json["MedicineName"],
        quantity: json["Quantity"],
        mrp: json["MRP"],
        amount: json["Amount"],
        orderId: json["OrderId"],
        invoiceNumber: json["InvoiceNumber"],
        orderDate: json["OrderDate"] == null
            ? null
            : DateTime.parse(json["OrderDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Patient_Id": patientId,
        "Id": id,
        "MedicineName": medicineName,
        "Quantity": quantity,
        "MRP": mrp,
        "Amount": amount,
        "OrderId": orderId,
        "InvoiceNumber": invoiceNumber,
        "OrderDate": orderDate?.toIso8601String(),
      };
}
