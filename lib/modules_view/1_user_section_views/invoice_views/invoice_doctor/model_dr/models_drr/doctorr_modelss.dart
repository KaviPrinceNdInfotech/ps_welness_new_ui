// To parse this JSON data, do
//
//     final drInvoiceModelpdf = drInvoiceModelpdfFromJson(jsonString);

import 'dart:convert';

DrInvoiceModelpdf drInvoiceModelpdfFromJson(String str) =>
    DrInvoiceModelpdf.fromJson(json.decode(str));

String drInvoiceModelpdfToJson(DrInvoiceModelpdf data) =>
    json.encode(data.toJson());

class DrInvoiceModelpdf {
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
  num? gstAmount;
  num? grandTotal;
  num? finalAmount;
  int? status;
  String? message;

  DrInvoiceModelpdf({
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
    this.gstAmount,
    this.grandTotal,
    this.finalAmount,
    this.status,
    this.message,
  });

  factory DrInvoiceModelpdf.fromJson(Map<String, dynamic> json) =>
      DrInvoiceModelpdf(
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
        gstAmount: json["GSTAmount"],
        grandTotal: json["GrandTotal"],
        finalAmount: json["FinalAmount"],
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
        "GSTAmount": gstAmount,
        "GrandTotal": grandTotal,
        "FinalAmount": finalAmount,
        "Status": status,
        "Message": message,
      };
}

class InvoiceDatum {
  int? patientId;
  int? id;
  String? doctorName;
  num? fee;
  num? totalFee;
  num? gst;
  String? orderId;
  String? invoiceNumber;
  DateTime? orderDate;

  InvoiceDatum({
    this.patientId,
    this.id,
    this.doctorName,
    this.fee,
    this.totalFee,
    this.gst,
    this.orderId,
    this.invoiceNumber,
    this.orderDate,
  });

  factory InvoiceDatum.fromJson(Map<String, dynamic> json) => InvoiceDatum(
        patientId: json["Patient_Id"],
        id: json["Id"],
        doctorName: json["DoctorName"],
        fee: json["Fee"],
        totalFee: json["TotalFee"],
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
        "DoctorName": doctorName,
        "Fee": fee,
        "TotalFee": totalFee,
        "GST": gst,
        "OrderId": orderId,
        "InvoiceNumber": invoiceNumber,
        "OrderDate": orderDate?.toIso8601String(),
      };
}
