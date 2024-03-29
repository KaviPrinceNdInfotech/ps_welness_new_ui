// To parse this JSON data, do
//
//     final driverBookingHistory = driverBookingHistoryFromJson(jsonString);

// import 'dart:convert';
//
// List<DriverBookingHistoryModel> driverBookingHistoryFromJson(String str) => List<DriverBookingHistoryModel>.from(json.decode(str).map((x) => DriverBookingHistoryModel.fromJson(x)));
//
// String driverBookingHistoryToJson(List<DriverBookingHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class DriverBookingHistoryModel {
//   DriverBookingHistoryModel({
//     this.id,
//     this.driverName,
//     this.mobileNumber,
//     this.state,
//     this.city,
//     this.pinCode,
//     this.paidAmount,
//     this.location,
//     this.status,
//   });
//
//   int? id;
//   String? driverName;
//   String? mobileNumber;
//   String? state;
//   String? city;
//   String? pinCode;
//   String? paidAmount;
//   String? location;
//   String? status;
//
//   factory DriverBookingHistoryModel.fromJson(Map<String, dynamic> json) => DriverBookingHistoryModel(
//     id: json["Id"],
//     driverName: json["DriverName"],
//     mobileNumber: json["MobileNumber"],
//     state: json["State"],
//     city: json["City"],
//     pinCode: json["PinCode"],
//     paidAmount: json["PaidAmount"],
//     location: json["Location"],
//     status: json["Status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "DriverName": driverName,
//     "MobileNumber": mobileNumber,
//     "State": state,
//     "City": city,
//     "PinCode": pinCode,
//     "PaidAmount": paidAmount,
//     "Location": location,
//     "Status": status,
//   };
// }

import 'dart:convert';

///
/// import 'dart:convert';

DriverBookingHistoryModel driverBookingHistoryModelFromJson(String str) =>
    DriverBookingHistoryModel.fromJson(json.decode(str));

String driverBookingHistoryModelToJson(DriverBookingHistoryModel data) =>
    json.encode(data.toJson());

class DriverBookingHistoryModel {
  List<BookingHistory>? bookingHistory;

  DriverBookingHistoryModel({
    this.bookingHistory,
  });

  factory DriverBookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverBookingHistoryModel(
        bookingHistory: json["BookingHistory"] == null
            ? []
            : List<BookingHistory>.from(
                json["BookingHistory"]!.map((x) => BookingHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BookingHistory": bookingHistory == null
            ? []
            : List<dynamic>.from(bookingHistory!.map((x) => x.toJson())),
      };
}

class BookingHistory {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? stateName;
  String? cityName;
  String? location;

  BookingHistory({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.stateName,
    this.cityName,
    this.location,
  });

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
        id: json["Id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        location: json["Location"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "StateName": stateName,
        "CityName": cityName,
        "Location": location,
      };
}
