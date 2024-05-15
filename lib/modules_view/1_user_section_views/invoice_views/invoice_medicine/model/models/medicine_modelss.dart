// import 'dart:convert';
//
// MedicineInvoiceModelpdf medicineInvoiceModelpdfFromJson(String str) =>
//     MedicineInvoiceModelpdf.fromJson(json.decode(str));
//
// String medicineInvoiceModelpdfToJson(MedicineInvoiceModelpdf data) =>
//     json.encode(data.toJson());
//
// class MedicineInvoiceModelpdf {
//   List<InvoiceDatum>? invoiceData;
//   String? name;
//   String? email;
//   String? pinCode;
//   String? mobileNo;
//   String? address;
//   String? invoiceNumber;
//   String? orderId;
//   DateTime? orderDate;
//   num? gst;
//   num? grandTotal;
//   num? finalAmount;
//   num? deliveryCharge;
//   int? status;
//   String? message;
//
//   MedicineInvoiceModelpdf({
//     this.invoiceData,
//     this.name,
//     this.email,
//     this.pinCode,
//     this.mobileNo,
//     this.address,
//     this.invoiceNumber,
//     this.orderId,
//     this.orderDate,
//     this.gst,
//     this.grandTotal,
//     this.finalAmount,
//     this.deliveryCharge,
//     this.status,
//     this.message,
//   });
//
//   factory MedicineInvoiceModelpdf.fromJson(Map<String, dynamic> json) =>
//       MedicineInvoiceModelpdf(
//         invoiceData: json["InvoiceData"] == null
//             ? []
//             : List<InvoiceDatum>.from(
//                 json["InvoiceData"]!.map((x) => InvoiceDatum.fromJson(x))),
//         name: json["Name"],
//         email: json["Email"],
//         pinCode: json["PinCode"],
//         mobileNo: json["MobileNo"],
//         address: json["Address"],
//         invoiceNumber: json["InvoiceNumber"],
//         orderId: json["OrderId"],
//         orderDate: json["OrderDate"] == null
//             ? null
//             : DateTime.parse(json["OrderDate"]),
//         gst: json["GST"],
//         grandTotal: json["GrandTotal"]?.toDouble(),
//         finalAmount: json["FinalAmount"],
//         deliveryCharge: json["DeliveryCharge"],
//         status: json["Status"],
//         message: json["Message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "InvoiceData": invoiceData == null
//             ? []
//             : List<dynamic>.from(invoiceData!.map((x) => x.toJson())),
//         "Name": name,
//         "Email": email,
//         "PinCode": pinCode,
//         "MobileNo": mobileNo,
//         "Address": address,
//         "InvoiceNumber": invoiceNumber,
//         "OrderId": orderId,
//         "OrderDate": orderDate?.toIso8601String(),
//         "GST": gst,
//         "GrandTotal": grandTotal,
//         "FinalAmount": finalAmount,
//         "DeliveryCharge": deliveryCharge,
//         "Status": status,
//         "Message": message,
//       };
// }
//
// class InvoiceDatum {
//   int? patientId;
//   int? id;
//   String? medicineName;
//   num? quantity;
//   num? mrp;
//   num? gst;
//   num? amount;
//   String? orderId;
//   String? invoiceNumber;
//   DateTime? orderDate;
//
//   InvoiceDatum({
//     this.patientId,
//     this.id,
//     this.medicineName,
//     this.quantity,
//     this.mrp,
//     this.gst,
//     this.amount,
//     this.orderId,
//     this.invoiceNumber,
//     this.orderDate,
//   });
//
//   factory InvoiceDatum.fromJson(Map<String, dynamic> json) => InvoiceDatum(
//         patientId: json["Patient_Id"],
//         id: json["Id"],
//         medicineName: json["MedicineName"],
//         quantity: json["Quantity"],
//         mrp: json["MRP"],
//         gst: json["GST"],
//         amount: json["Amount"]?.toDouble(),
//         orderId: json["OrderId"],
//         invoiceNumber: json["InvoiceNumber"],
//         orderDate: json["OrderDate"] == null
//             ? null
//             : DateTime.parse(json["OrderDate"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Patient_Id": patientId,
//         "Id": id,
//         "MedicineName": medicineName,
//         "Quantity": quantity,
//         "MRP": mrp,
//         "GST": gst,
//         "Amount": amount,
//         "OrderId": orderId,
//         "InvoiceNumber": invoiceNumber,
//         "OrderDate": orderDate?.toIso8601String(),
//       };
// }
//
///
import 'dart:convert';

MedicineInvoiceModelpdf medicineInvoiceModelpdfFromJson(String str) =>
    MedicineInvoiceModelpdf.fromJson(json.decode(str));

String medicineInvoiceModelpdfToJson(MedicineInvoiceModelpdf data) =>
    json.encode(data.toJson());

class MedicineInvoiceModelpdf {
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
  num? deliveryCharge;
  int? status;
  String? message;

  MedicineInvoiceModelpdf({
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
    this.deliveryCharge,
    this.status,
    this.message,
  });

  factory MedicineInvoiceModelpdf.fromJson(Map<String, dynamic> json) =>
      MedicineInvoiceModelpdf(
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
        gstAmount: json["GSTAmount"]?.toDouble(),
        grandTotal: json["GrandTotal"]?.toDouble(),
        finalAmount: json["FinalAmount"],
        deliveryCharge: json["DeliveryCharge"],
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
        "DeliveryCharge": deliveryCharge,
        "Status": status,
        "Message": message,
      };
}

class InvoiceDatum {
  int? patientId;
  int? id;
  String? medicineName;
  num? quantity;
  num? mrp;
  num? gst;
  num? amount;
  String? orderId;
  String? invoiceNumber;
  DateTime? orderDate;

  InvoiceDatum({
    this.patientId,
    this.id,
    this.medicineName,
    this.quantity,
    this.mrp,
    this.gst,
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
        gst: json["GST"],
        amount: json["Amount"]?.toDouble(),
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
        "GST": gst,
        "Amount": amount,
        "OrderId": orderId,
        "InvoiceNumber": invoiceNumber,
        "OrderDate": orderDate?.toIso8601String(),
      };
}
