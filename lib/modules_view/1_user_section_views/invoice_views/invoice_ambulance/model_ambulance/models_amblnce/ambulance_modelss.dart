// To parse this JSON data, do
//
//     final invoiceAmbulanceUser = invoiceAmbulanceUserFromJson(jsonString);

import 'dart:convert';

InvoiceAmbulanceUser invoiceAmbulanceUserFromJson(String str) =>
    InvoiceAmbulanceUser.fromJson(json.decode(str));

String invoiceAmbulanceUserToJson(InvoiceAmbulanceUser data) =>
    json.encode(data.toJson());

class InvoiceAmbulanceUser {
  List<InvoiceDatum>? invoiceData;
  String? name;
  String? email;
  String? pinCode;
  String? mobileNo;
  String? address;
  String? invoiceNumber;
  String? orderid;
  DateTime? orderdate;
  num? gst;
  num? gstAmount;
  num? grandTotal;
  num? finalAmount;
  num? status;
  String? message;

  InvoiceAmbulanceUser({
    this.invoiceData,
    this.name,
    this.email,
    this.pinCode,
    this.mobileNo,
    this.address,
    this.invoiceNumber,
    this.orderid,
    this.orderdate,
    this.gst,
    this.gstAmount,
    this.grandTotal,
    this.finalAmount,
    this.status,
    this.message,
  });

  factory InvoiceAmbulanceUser.fromJson(Map<String, dynamic> json) =>
      InvoiceAmbulanceUser(
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
        orderid: json["orderid"],
        orderdate: json["orderdate"] == null
            ? null
            : DateTime.parse(json["orderdate"]),
        gst: json["gst"],
        gstAmount: json["GSTAmount"],
        grandTotal: json["GrandTotal"],
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
        "orderid": orderid,
        "orderdate": orderdate?.toIso8601String(),
        "gst": gst,
        "GSTAmount": gstAmount,
        "GrandTotal": grandTotal,
        "finalAmount": finalAmount,
        "Status": status,
        "Message": message,
      };
}

class InvoiceDatum {
  int? patientId;
  num? id;
  String? driverName;
  String? vehicleName;
  String? vehicleNumber;
  num? amount;
  num? gst;
  String? orderId;
  String? invoiceNumber;
  DateTime? orderDate;

  InvoiceDatum({
    this.patientId,
    this.id,
    this.driverName,
    this.vehicleName,
    this.vehicleNumber,
    this.amount,
    this.gst,
    this.orderId,
    this.invoiceNumber,
    this.orderDate,
  });

  factory InvoiceDatum.fromJson(Map<String, dynamic> json) => InvoiceDatum(
        patientId: json["PatientId"],
        id: json["Id"],
        driverName: json["DriverName"],
        vehicleName: json["VehicleName"],
        vehicleNumber: json["VehicleNumber"],
        amount: json["Amount"],
        gst: json["GST"],
        orderId: json["OrderId"],
        invoiceNumber: json["InvoiceNumber"],
        orderDate: json["OrderDate"] == null
            ? null
            : DateTime.parse(json["OrderDate"]),
      );

  Map<String, dynamic> toJson() => {
        "PatientId": patientId,
        "Id": id,
        "DriverName": driverName,
        "VehicleName": vehicleName,
        "VehicleNumber": vehicleNumber,
        "Amount": amount,
        "GST": gst,
        "OrderId": orderId,
        "InvoiceNumber": invoiceNumber,
        "OrderDate": orderDate?.toIso8601String(),
      };
}
