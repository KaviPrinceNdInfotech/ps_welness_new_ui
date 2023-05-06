
import 'dart:convert';

NurseProfileModel nurseProfileModelFromJson(String str) => NurseProfileModel.fromJson(json.decode(str));

String nurseProfileModelToJson(NurseProfileModel data) => json.encode(data.toJson());

class NurseProfileModel {
  int? id;
  String? nurseName;
  String? mobileNumber;
  String? emailId;
  String? state;
  String? cityName;
  String? pinCode;
  String? location;

  NurseProfileModel({
    this.id,
    this.nurseName,
    this.mobileNumber,
    this.emailId,
    this.state,
    this.cityName,
    this.pinCode,
    this.location,
  });

  factory NurseProfileModel.fromJson(Map<String, dynamic> json) => NurseProfileModel(
    id: json["Id"],
    nurseName: json["NurseName"],
    mobileNumber: json["MobileNumber"],
    emailId: json["EmailId"],
    state: json["State"],
    cityName: json["CityName"],
    pinCode: json["PinCode"],
    location: json["Location"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "NurseName": nurseName,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "State": state,
    "CityName": cityName,
    "PinCode": pinCode,
    "Location": location,
  };
}
