// To parse this JSON data, do
//
//     final checkoutmedicineModel = checkoutmedicineModelFromJson(jsonString);

import 'dart:convert';

CheckoutmedicineModel checkoutmedicineModelFromJson(String str) =>
    CheckoutmedicineModel.fromJson(json.decode(str));

String checkoutmedicineModelToJson(CheckoutmedicineModel data) =>
    json.encode(data.toJson());

class CheckoutmedicineModel {
  Data? data;
  String? message;

  CheckoutmedicineModel({
    this.data,
    this.message,
  });

  factory CheckoutmedicineModel.fromJson(Map<String, dynamic> json) =>
      CheckoutmedicineModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "Message": message,
      };
}

class Data {
  String? name;
  String? mobileNumber;
  String? deliveryAddress;
  String? cityName;
  String? stateName;
  String? pinCode;
  num? totalPrice;
  num? deliverycharge;

  Data({
    this.name,
    this.mobileNumber,
    this.deliveryAddress,
    this.cityName,
    this.stateName,
    this.pinCode,
    this.totalPrice,
    this.deliverycharge,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["Name"],
        mobileNumber: json["MobileNumber"],
        deliveryAddress: json["DeliveryAddress"],
        cityName: json["CityName"],
        stateName: json["StateName"],
        pinCode: json["PinCode"],
        totalPrice: json["TotalPrice"],
        deliverycharge: json["Deliverycharge"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "MobileNumber": mobileNumber,
        "DeliveryAddress": deliveryAddress,
        "CityName": cityName,
        "StateName": stateName,
        "PinCode": pinCode,
        "TotalPrice": totalPrice,
        "Deliverycharge": deliverycharge,
      };
}
