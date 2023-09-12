// // To parse this JSON data, do
// //
// //     final myData = myDataFromJson(jsonString);
//
// import 'dart:convert';
//
// MyData myDataFromJson(String str) => MyData.fromJson(json.decode(str));
//
// String myDataToJson(MyData data) => json.encode(data.toJson());
//
// class MyData {
//   MyData({
//     required this.result,
//     required this.status,
//     required this.message,
//   });
//
//   Result2 result;
//   int status;
//   String message;
//
//   factory MyData.fromJson(Map<String, dynamic> json) => MyData(
//         result: Result2.fromJson(json["result"]),
//         status: json["status"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": result.toJson(),
//         "status": status,
//         "message": message,
//       };
// }
//
// class Result2 {
//   Result2({
//     required this.id,
//     required this.deliveryType,
//     required this.name,
//     required this.mobile,
//     required this.email,
//     required this.address,
//     required this.pinCode,
//     required this.date,
//     required this.totalItem,
//     required this.price,
//     required this.paymentMode,
//     required this.orderStatus,
//     required this.paymentStatus,
//     required this.productName,
//     required this.userId,
//   });
//
//   num id;
//   dynamic deliveryType;
//   String name;
//   String mobile;
//   String email;
//   String address;
//   String pinCode;
//   DateTime date;
//   num totalItem;
//   num price;
//   String paymentMode;
//   String orderStatus;
//   String paymentStatus;
//   String productName;
//   num userId;
//
//   factory Result2.fromJson(Map<String, dynamic> json) => Result2(
//         id: json["Id"],
//         deliveryType: json["Delivery_type"],
//         name: json["Name"],
//         mobile: json["Mobile"],
//         email: json["Email"],
//         address: json["Address"],
//         pinCode: json["PinCode"],
//         date: DateTime.parse(json["Date"]),
//         totalItem: json["Total_Item"],
//         price: json["Price"],
//         paymentMode: json["PaymentMode"],
//         orderStatus: json["OrderStatus"],
//         paymentStatus: json["PaymentStatus"],
//         productName: json["ProductName"],
//         userId: json["UserId"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Delivery_type": deliveryType,
//         "Name": name,
//         "Mobile": mobile,
//         "Email": email,
//         "Address": address,
//         "PinCode": pinCode,
//         "Date": date.toIso8601String(),
//         "Total_Item": totalItem,
//         "Price": price,
//         "PaymentMode": paymentMode,
//         "OrderStatus": orderStatus,
//         "PaymentStatus": paymentStatus,
//         "ProductName": productName,
//         "UserId": userId,
//       };
// }
