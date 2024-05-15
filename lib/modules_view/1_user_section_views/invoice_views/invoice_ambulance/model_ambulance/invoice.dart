// import 'package:invoice1/model/customer.dart';
// import 'package:invoice1/model/supplier.dart';

import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_ambulance/model_ambulance/supplier_amblnce.dart';

import 'customer.dart';

///import 'package:ps_welness_new_ui/modules_view/invoice_views/model/supplier.dart';

class InvoiceAmblnce {
  final InvoiceInfo info;
  final SupplierAmb supplieramblnce;
  final Customer customer;
  final List<InvoiceItem> items;

  const InvoiceAmblnce({
    required this.info,
    required this.supplieramblnce,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final DateTime orderDate;
  final DateTime invoiceDate;
  final String orderStatus;
  final String paymentStatus;
  const InvoiceInfo({
    required this.orderDate,
    required this.invoiceDate,
    required this.orderStatus,
    required this.paymentStatus,
    /*final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,*/
  });
}

class InvoiceItem {
  final String description;
  // final DateTime date;
  final String quantity;
  final double vat;
  final double unitPrice;
  final double total;

  const InvoiceItem({
    required this.description,
    //required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
    required this.total,
  });
}

///new model
// // To parse this JSON data, do
// //
// //     final invoice = invoiceFromJson(jsonString);
//
// import 'dart:convert';
//
// Invoice invoiceFromJson(String str) => Invoice.fromJson(json.decode(str));
//
// String invoiceToJson(Invoice data) => json.encode(data.toJson());
//
// class Invoice {
//   Invoice({
//     this.result,
//     this.grandTotal,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? grandTotal;
//   int? status;
//   String? message;
//
//   factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
//     result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
//     grandTotal: json["GrandTotal"],
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
//     "GrandTotal": grandTotal,
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     this.id,
//     this.deliveryType,
//     this.name,
//     this.mobile,
//     this.email,
//     this.address,
//     this.pinCode,
//     this.date,
//     this.totalItem,
//     this.price,
//     this.paymentMode,
//     this.orderStatus,
//     this.paymentStatus,
//     this.productName,
//     this.userId,
//     this.discountPrice,
//     this.finalPrice,
//     this.invoice,
//   });
//
//   int? id;
//   dynamic deliveryType;
//   dynamic name;
//   String? mobile;
//   String? email;
//   String? address;
//   String? pinCode;
//   DateTime? date;
//   int? totalItem;
//   int? price;
//   String? paymentMode;
//   String? orderStatus;
//   String? paymentStatus;
//   String? productName;
//   int? userId;
//   int? discountPrice;
//   int? finalPrice;
//   String? invoice;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["Id"],
//     deliveryType: json["Delivery_type"],
//     name: json["Name"],
//     mobile: json["Mobile"],
//     email: json["Email"],
//     address: json["Address"],
//     pinCode: json["PinCode"],
//     date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
//     totalItem: json["Total_Item"],
//     price: json["Price"],
//     paymentMode: json["PaymentMode"],
//     orderStatus: json["OrderStatus"],
//     paymentStatus: json["PaymentStatus"],
//     productName: json["ProductName"],
//     userId: json["UserId"],
//     discountPrice: json["DiscountPrice"],
//     finalPrice: json["FinalPrice"],
//     invoice: json["Invoice"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "Delivery_type": deliveryType,
//     "Name": name,
//     "Mobile": mobile,
//     "Email": email,
//     "Address": address,
//     "PinCode": pinCode,
//     "Date": date?.toIso8601String(),
//     "Total_Item": totalItem,
//     "Price": price,
//     "PaymentMode": paymentMode,
//     "OrderStatus": orderStatus,
//     "PaymentStatus": paymentStatus,
//     "ProductName": productName,
//     "UserId": userId,
//     "DiscountPrice": discountPrice,
//     "FinalPrice": finalPrice,
//     "Invoice": invoice,
//   };
// }
//
