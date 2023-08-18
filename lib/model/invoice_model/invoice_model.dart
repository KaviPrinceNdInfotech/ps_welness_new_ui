//
//
// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
  InvoiceModel({
    this.result,
    this.name,
    this.mobile,
    this.email,
    this.address,
    this.pinCode,
    this.date,
    this.grandTotal,
    this.status,
    this.message,
  });

  List<Result>? result;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? pinCode;
  DateTime? date;
  num? grandTotal;
  num? status;
  String? message;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    name: json["Name"],
    mobile: json["Mobile"],
    email: json["Email"],
    address: json["Address"],
    pinCode: json["PinCode"],
    date: DateTime.parse(json["Date"]),
    grandTotal: json["GrandTotal"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "Name": name,
    "Mobile": mobile,
    "Email": email,
    "Address": address,
    "PinCode": pinCode,
    "Date": date?.toIso8601String(),
    "GrandTotal": grandTotal,
    "status": status,
    "message": message,
  };
}

class Result {
  Result({
    this.id,
    this.totalItem,
    this.price,
    this.paymentMode,
    this.orderStatus,
    this.paymentStatus,
    this.productName,
    this.userId,
    this.discountPrice,
    this.finalPrice,
    this.invoice,
  });

  num? id;
  num? totalItem;
  double? price;
  String? paymentMode;
  String? orderStatus;
  String? paymentStatus;
  String? productName;
  num? userId;
  double? discountPrice;
  double? finalPrice;
  String? invoice;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    totalItem: json["Total_Item"],
    price: json["Price"],
    paymentMode: json["PaymentMode"],
    orderStatus: json["OrderStatus"],
    paymentStatus: json["PaymentStatus"],
    productName: json["ProductName"],
    userId: json["UserId"],
    discountPrice: json["DiscountPrice"],
    finalPrice: json["FinalPrice"],
    invoice: json["Invoice"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Total_Item": totalItem,
    "Price": price,
    "PaymentMode": paymentMode,
    "OrderStatus": orderStatus,
    "PaymentStatus": paymentStatus,
    "ProductName": productName,
    "UserId": userId,
    "DiscountPrice": discountPrice,
    "FinalPrice": finalPrice,
    "Invoice": invoice,
  };
}


///new model
// // To parse this JSON data, do
// //
// //     final invoiceModel = invoiceModelFromJson(jsonString);
//
// import 'dart:convert';
//
// InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));
//
// String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());
//
// class InvoiceModel {
//   InvoiceModel({
//     this.result,
//     this.name,
//     this.mobile,
//     this.email,
//     this.address,
//     this.pinCode,
//     this.date,
//     this.grandTotal,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   String? name;
//   String? mobile;
//   String? email;
//   String? address;
//   String? pinCode;
//   DateTime? date;
//   int? grandTotal;
//   int? status;
//   // num? grandTotal;
//   // num? status;
//   String? message;
//
//   factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
//     result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//     name: json["Name"],
//     mobile: json["Mobile"],
//     email: json["Email"],
//     address: json["Address"],
//     pinCode: json["PinCode"],
//     date: DateTime.parse(json["Date"]),
//     grandTotal: json["GrandTotal"],
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result!.map((x) => x.toJson())),
//     "Name": name,
//     "Mobile": mobile,
//     "Email": email,
//     "Address": address,
//     "PinCode": pinCode,
//     "Date": date?.toIso8601String(),
//     "GrandTotal": grandTotal,
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     this.id,
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
//   int? totalItem;
//   double? price;
//   // num? id;
//   // num? totalItem;
//   // double? price;
//   String? paymentMode;
//   String? orderStatus;
//   String? paymentStatus;
//   String? productName;
//   int? userId;
//   double? discountPrice;
//   double? finalPrice;
//   String? invoice;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["Id"],
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



///null safety model
// // To parse this JSON data, do
// //
// //     final invoiceModel = invoiceModelFromJson(jsonString);
//
// import 'dart:convert';
//
// InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));
//
// String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());
//
// class InvoiceModel {
//   InvoiceModel({
//     required this.result,
//     required this.name,
//     required this.mobile,
//     required this.email,
//     required this.address,
//     required this.pinCode,
//     required this.date,
//     required this.grandTotal,
//     required this.status,
//     required this.message,
//   });
//
//   List<Result> result;
//   String name;
//   String mobile;
//   String email;
//   String address;
//   String pinCode;
//   DateTime date;
//   int grandTotal;
//   int status;
//   String message;
//
//   factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
//     result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//     name: json["Name"],
//     mobile: json["Mobile"],
//     email: json["Email"],
//     address: json["Address"],
//     pinCode: json["PinCode"],
//     date: DateTime.parse(json["Date"]),
//     grandTotal: json["GrandTotal"],
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result.map((x) => x.toJson())),
//     "Name": name,
//     "Mobile": mobile,
//     "Email": email,
//     "Address": address,
//     "PinCode": pinCode,
//     "Date": date.toIso8601String(),
//     "GrandTotal": grandTotal,
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     required this.id,
//     required this.totalItem,
//     required this.price,
//     required this.paymentMode,
//     required this.orderStatus,
//     required this.paymentStatus,
//     required this.productName,
//     required this.userId,
//     required this.discountPrice,
//     required this.finalPrice,
//     required this.invoice,
//   });
//
//   int id;
//   int totalItem;
//   double price;
//   String paymentMode;
//   String orderStatus;
//   String paymentStatus;
//   String productName;
//   int userId;
//   double discountPrice;
//   double finalPrice;
//   String invoice;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["Id"],
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
