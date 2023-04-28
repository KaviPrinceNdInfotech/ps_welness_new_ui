// To parse this JSON data, do
//
//     final medicineAddressModel = medicineAddressModelFromJson(jsonString);

import 'dart:convert';

MedicineAddressModel medicineAddressModelFromJson(String str) => MedicineAddressModel.fromJson(json.decode(str));

String medicineAddressModelToJson(MedicineAddressModel data) => json.encode(data.toJson());

class MedicineAddressModel {
  List<AddAddressMediciness>? addAddressMediciness;

  MedicineAddressModel({
    this.addAddressMediciness,
  });

  factory MedicineAddressModel.fromJson(Map<String, dynamic> json) => MedicineAddressModel(
    addAddressMediciness: json["AddAddressMediciness"] == null ? [] : List<AddAddressMediciness>.from(json["AddAddressMediciness"]!.map((x) => AddAddressMediciness.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "AddAddressMediciness": addAddressMediciness == null ? [] : List<dynamic>.from(addAddressMediciness!.map((x) => x.toJson())),
  };
}

class AddAddressMediciness {
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? stateName;
  String? cityName;
  String? deliveryAddress;
  String? pinCode;

  AddAddressMediciness({
    this.id,
    this.name,
    this.mobileNumber,
    this.email,
    this.stateName,
    this.cityName,
    this.deliveryAddress,
    this.pinCode,
  });

  factory AddAddressMediciness.fromJson(Map<String, dynamic> json) => AddAddressMediciness(
    id: json["Id"],
    name: json["Name"],
    mobileNumber: json["MobileNumber"],
    email: json["Email"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    deliveryAddress: json["DeliveryAddress"],
    pinCode: json["PinCode"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "MobileNumber": mobileNumber,
    "Email": email,
    "StateName": stateName,
    "CityName": cityName,
    "DeliveryAddress": deliveryAddress,
    "PinCode": pinCode,
  };
}
