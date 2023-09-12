import 'dart:convert';

NurseModelpdf nurseModelpdfFromJson(String str) =>
    NurseModelpdf.fromJson(json.decode(str));

String nurseModelpdfToJson(NurseModelpdf data) => json.encode(data.toJson());

class NurseModelpdf {
  List<InvoiceDatum>? invoiceData;
  String? name;
  String? email;
  String? pinCode;
  String? mobileNo;
  String? address;
  String? invoiceNumber;
  String? orderId;
  DateTime? orderDate;
  num? numberOfDays;
  num? gst;
  num? gstAmount;
  num? grandTotal;
  num? finalamount;
  num? status;
  String? message;

  NurseModelpdf({
    this.invoiceData,
    this.name,
    this.email,
    this.pinCode,
    this.mobileNo,
    this.address,
    this.invoiceNumber,
    this.orderId,
    this.orderDate,
    this.numberOfDays,
    this.gst,
    this.gstAmount,
    this.grandTotal,
    this.finalamount,
    this.status,
    this.message,
  });

  factory NurseModelpdf.fromJson(Map<String, dynamic> json) => NurseModelpdf(
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
        numberOfDays: json["NumberOfDays"],
        gst: json["GST"],
        gstAmount: json["GSTAmount"],
        grandTotal: json["GrandTotal"],
        finalamount: json["Finalamount"],
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
        "NumberOfDays": numberOfDays,
        "GST": gst,
        "GSTAmount": gstAmount,
        "GrandTotal": grandTotal,
        "Finalamount": finalamount,
        "Status": status,
        "Message": message,
      };
}

class InvoiceDatum {
  int? patientId;
  int? id;
  String? nurseName;
  num? totalFee;
  num? fee;
  num? gst;
  String? orderId;
  String? invoiceNumber;
  DateTime? orderDate;
  num? numberOfDays;

  InvoiceDatum({
    this.patientId,
    this.id,
    this.nurseName,
    this.totalFee,
    this.fee,
    this.gst,
    this.orderId,
    this.invoiceNumber,
    this.orderDate,
    this.numberOfDays,
  });

  factory InvoiceDatum.fromJson(Map<String, dynamic> json) => InvoiceDatum(
        patientId: json["Patient_Id"],
        id: json["Id"],
        nurseName: json["NurseName"],
        totalFee: json["TotalFee"],
        fee: json["Fee"],
        gst: json["GST"],
        orderId: json["OrderId"],
        invoiceNumber: json["InvoiceNumber"],
        orderDate: json["OrderDate"] == null
            ? null
            : DateTime.parse(json["OrderDate"]),
        numberOfDays: json["NumberOfDays"],
      );

  Map<String, dynamic> toJson() => {
        "Patient_Id": patientId,
        "Id": id,
        "NurseName": nurseName,
        "TotalFee": totalFee,
        "Fee": fee,
        "GST": gst,
        "OrderId": orderId,
        "InvoiceNumber": invoiceNumber,
        "OrderDate": orderDate?.toIso8601String(),
        "NumberOfDays": numberOfDays,
      };
}
