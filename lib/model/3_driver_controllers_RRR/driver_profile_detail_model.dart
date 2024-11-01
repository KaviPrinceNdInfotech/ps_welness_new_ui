// To parse this JSON data, do
//
//     final driverProfileDetail = driverProfileDetailFromJson(jsonString);

// import 'dart:convert';
//
// DriverProfileDetailModel driverProfileDetailFromJson(String str) => DriverProfileDetailModel.fromJson(json.decode(str));
//
// String driverProfileDetailToJson(DriverProfileDetailModel data) => json.encode(data.toJson());
//
// class DriverProfileDetailModel {
//   DriverProfileDetailModel({
//     this.id,
//     this.driverName,
//     this.mobileNumber,
//     this.emailId,
//     this.state,
//     this.city,
//     this.pinCode,
//     this.location,
//   });
//
//   int? id;
//   String? driverName;
//   String? mobileNumber;
//   String? emailId;
//   String? state;
//   String? city;
//   String? pinCode;
//   String? location;
//
//   factory DriverProfileDetailModel.fromJson(Map<String, dynamic> json) => DriverProfileDetailModel(
//     id: json["Id"],
//     driverName: json["DriverName"],
//     mobileNumber: json["MobileNumber"],
//     emailId: json["EmailId"],
//     state: json["State"],
//     city: json["City"],
//     pinCode: json["PinCode"],
//     location: json["Location"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "DriverName": driverName,
//     "MobileNumber": mobileNumber,
//     "EmailId": emailId,
//     "State": state,
//     "City": city,
//     "PinCode": pinCode,
//     "Location": location,
//   };
// }
///
import 'dart:convert';

DriverProfileDetailModel driverProfileDetailModelFromJson(String str) =>
    DriverProfileDetailModel.fromJson(json.decode(str));

String driverProfileDetailModelToJson(DriverProfileDetailModel data) =>
    json.encode(data.toJson());

class DriverProfileDetailModel {
  int? id;
  String? driverName;
  String? mobileNumber;
  String? emailId;
  String? stateName;
  String? cityName;
  String? pinCode;
  num? cityMasterId;
  num? stateMasterId;
  String? location;

  DriverProfileDetailModel({
    this.id,
    this.driverName,
    this.mobileNumber,
    this.emailId,
    this.stateName,
    this.cityName,
    this.pinCode,
    this.cityMasterId,
    this.stateMasterId,
    this.location,
  });

  factory DriverProfileDetailModel.fromJson(Map<String, dynamic> json) =>
      DriverProfileDetailModel(
        id: json["Id"],
        driverName: json["DriverName"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        pinCode: json["PinCode"],
        cityMasterId: json["CityMaster_Id"],
        stateMasterId: json["StateMaster_Id"],
        location: json["Location"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "StateName": stateName,
        "CityName": cityName,
        "PinCode": pinCode,
        "CityMaster_Id": cityMasterId,
        "StateMaster_Id": stateMasterId,
        "Location": location,
      };
}

///

// DriverProfileDetailModel driverProfileDetailModelFromJson(String str) =>
//     DriverProfileDetailModel.fromJson(json.decode(str));
//
// String driverProfileDetailModelToJson(DriverProfileDetailModel data) =>
//     json.encode(data.toJson());
//
// class DriverProfileDetailModel {
//   int? id;
//   String? driverName;
//   String? mobileNumber;
//   String? emailId;
//   String? stateName;
//   String? cityName;
//   String? pinCode;
//   String? location;
//
//   DriverProfileDetailModel({
//     this.id,
//     this.driverName,
//     this.mobileNumber,
//     this.emailId,
//     this.stateName,
//     this.cityName,
//     this.pinCode,
//     this.location,
//   });
//
//   factory DriverProfileDetailModel.fromJson(Map<String, dynamic> json) =>
//       DriverProfileDetailModel(
//         id: json["Id"],
//         driverName: json["DriverName"],
//         mobileNumber: json["MobileNumber"],
//         emailId: json["EmailId"],
//         stateName: json["StateName"],
//         cityName: json["CityName"],
//         pinCode: json["PinCode"],
//         location: json["Location"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DriverName": driverName,
//         "MobileNumber": mobileNumber,
//         "EmailId": emailId,
//         "StateName": stateName,
//         "CityName": cityName,
//         "PinCode": pinCode,
//         "Location": location,
//       };
// }
