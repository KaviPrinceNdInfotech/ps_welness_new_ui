// To parse this JSON data, do
//
//     final labInvoiceModelpdf = labInvoiceModelpdfFromJson(jsonString);

import 'dart:convert';

LabInvoiceModelpdf labInvoiceModelpdfFromJson(String str) =>
    LabInvoiceModelpdf.fromJson(json.decode(str));

String labInvoiceModelpdfToJson(LabInvoiceModelpdf data) =>
    json.encode(data.toJson());

class LabInvoiceModelpdf {
  List<InvoiceDatum>? invoiceData;
  String? name;
  String? email;
  String? pinCode;
  String? mobileNo;
  String? address;
  String? invoiceNumber;
  String? orderId;
  DateTime? orderDate;
  num? gst;
  num? grandTotal;
  num? finalAmount;
  num? status;
  String? message;

  LabInvoiceModelpdf({
    this.invoiceData,
    this.name,
    this.email,
    this.pinCode,
    this.mobileNo,
    this.address,
    this.invoiceNumber,
    this.orderId,
    this.orderDate,
    this.gst,
    this.grandTotal,
    this.finalAmount,
    this.status,
    this.message,
  });

  factory LabInvoiceModelpdf.fromJson(Map<String, dynamic> json) =>
      LabInvoiceModelpdf(
        invoiceData: json["InvoiceData"] == null
            ? []
            : List<InvoiceDatum>.from(
                json["InvoiceData"]!.map((x) => InvoiceDatum.fromJson(x))),
        name: json["Name"],
        email: json["Email"],
        pinCode: json["PinCode"],
        mobileNo: json["MobileNo"],
        address: json["Address"],
        invoiceNumber: json["InvoiceNumber"],
        orderId: json["OrderId"],
        orderDate: json["OrderDate"] == null
            ? null
            : DateTime.parse(json["OrderDate"]),
        gst: json["GST"],
        grandTotal: json["GrandTotal"]?.toDouble(),
        finalAmount: json["finalAmount"],
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
        "InvoiceNumber": invoiceNumber,
        "OrderId": orderId,
        "OrderDate": orderDate?.toIso8601String(),
        "GST": gst,
        "GrandTotal": grandTotal,
        "finalAmount": finalAmount,
        "Status": status,
        "Message": message,
      };
}

class InvoiceDatum {
  int? patientId;
  int? id;
  String? labName;
  num? testAmount;
  num? amount;
  num? gst;
  String? orderId;
  String? invoiceNumber;
  DateTime? orderDate;

  InvoiceDatum({
    this.patientId,
    this.id,
    this.labName,
    this.testAmount,
    this.amount,
    this.gst,
    this.orderId,
    this.invoiceNumber,
    this.orderDate,
  });

  factory InvoiceDatum.fromJson(Map<String, dynamic> json) => InvoiceDatum(
        patientId: json["Patient_Id"],
        id: json["Id"],
        labName: json["LabName"],
        testAmount: json["TestAmount"],
        amount: json["Amount"],
        gst: json["GST"],
        orderId: json["OrderId"],
        invoiceNumber: json["InvoiceNumber"],
        orderDate: json["OrderDate"] == null
            ? null
            : DateTime.parse(json["OrderDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Patient_Id": patientId,
        "Id": id,
        "LabName": labName,
        "TestAmount": testAmount,
        "Amount": amount,
        "GST": gst,
        "OrderId": orderId,
        "InvoiceNumber": invoiceNumber,
        "OrderDate": orderDate?.toIso8601String(),
      };
}
