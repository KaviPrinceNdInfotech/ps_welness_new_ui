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

DriverBookingHistoryModel driverBookingHistoryModelFromJson(String str) =>
    DriverBookingHistoryModel.fromJson(json.decode(str));

String driverBookingHistoryModelToJson(DriverBookingHistoryModel data) =>
    json.encode(data.toJson());

class DriverBookingHistoryModel {
  List<BookingHistory> bookingHistory;

  DriverBookingHistoryModel({
    required this.bookingHistory,
  });

  factory DriverBookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverBookingHistoryModel(
        bookingHistory: List<BookingHistory>.from(
            json["BookingHistory"].map((x) => BookingHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BookingHistory":
            List<dynamic>.from(bookingHistory.map((x) => x.toJson())),
      };
}

class BookingHistory {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? stateName;
  String? cityName;
  String? location;
  String? pinCode;
  double? endLat;
  double? endLong;
  double? startLat;
  double? startLong;
  String? pickUpLoaction;
  String? dropLocation;

  BookingHistory({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.stateName,
    this.cityName,
    this.location,
    this.pinCode,
    this.endLat,
    this.endLong,
    this.startLat,
    this.startLong,
    this.pickUpLoaction,
    this.dropLocation,
  });

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
        id: json["Id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        location: json["Location"],
        pinCode: json["PinCode"],
        endLat: json["end_Lat"].toDouble(),
        endLong: json["end_Long"].toDouble(),
        startLat: json["start_Lat"].toDouble(),
        startLong: json["start_Long"].toDouble(),
        pickUpLoaction: json["PickUpLoaction"],
        dropLocation: json["DropLocation"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "StateName": stateName,
        "CityName": cityName,
        "Location": location,
        "PinCode": pinCode,
        "end_Lat": endLat,
        "end_Long": endLong,
        "start_Lat": startLat,
        "start_Long": startLong,
        "PickUpLoaction": pickUpLoaction,
        "DropLocation": dropLocation,
      };
}

///

// DriverBookingHistoryModel driverBookingHistoryModelFromJson(String str) =>
//     DriverBookingHistoryModel.fromJson(json.decode(str));
//
// String driverBookingHistoryModelToJson(DriverBookingHistoryModel data) =>
//     json.encode(data.toJson());
//
// class DriverBookingHistoryModel {
//   List<BookingHistory>? bookingHistory;
//
//   DriverBookingHistoryModel({
//     this.bookingHistory,
//   });
//
//   factory DriverBookingHistoryModel.fromJson(Map<String, dynamic> json) =>
//       DriverBookingHistoryModel(
//         bookingHistory: json["BookingHistory"] == null
//             ? []
//             : List<BookingHistory>.from(
//                 json["BookingHistory"]!.map((x) => BookingHistory.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "BookingHistory": bookingHistory == null
//             ? []
//             : List<dynamic>.from(bookingHistory!.map((x) => x.toJson())),
//       };
// }
//
// class BookingHistory {
//   int? id;
//   String? patientName;
//   String? mobileNumber;
//   String? stateName;
//   String? cityName;
//   String? location;
//
//   BookingHistory({
//     this.id,
//     this.patientName,
//     this.mobileNumber,
//     this.stateName,
//     this.cityName,
//     this.location,
//   });
//
//   factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
//         id: json["Id"],
//         patientName: json["PatientName"],
//         mobileNumber: json["MobileNumber"],
//         stateName: json["StateName"],
//         cityName: json["CityName"],
//         location: json["Location"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "PatientName": patientName,
//         "MobileNumber": mobileNumber,
//         "StateName": stateName,
//         "CityName": cityName,
//         "Location": location,
//       };
// }
