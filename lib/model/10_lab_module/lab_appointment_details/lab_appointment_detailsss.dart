// // To parse this JSON data, do
// //
// //     final labappointmentdetailsModel = labappointmentdetailsModelFromJson(jsonString);
// ///
// // import 'dart:convert';
// //
// // LabappointmentdetailsModel labappointmentdetailsModelFromJson(String str) =>
// //     LabappointmentdetailsModel.fromJson(json.decode(str));
// //
// // String labappointmentdetailsModelToJson(LabappointmentdetailsModel data) =>
// //     json.encode(data.toJson());
// //
// // class LabappointmentdetailsModel {
// //   List<LabAd>? labAd;
// //
// //   LabappointmentdetailsModel({
// //     this.labAd,
// //   });
// //
// //   factory LabappointmentdetailsModel.fromJson(Map<String, dynamic> json) =>
// //       LabappointmentdetailsModel(
// //         labAd: json["LabAD"] == null
// //             ? []
// //             : List<LabAd>.from(json["LabAD"]!.map((x) => LabAd.fromJson(x))),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "LabAD": labAd == null
// //             ? []
// //             : List<dynamic>.from(labAd!.map((x) => x.toJson())),
// //       };
// // }
// //
// // class LabAd {
// //   int? id;
// //   String? patientName;
// //   String? mobileNumber;
// //   String? location;
// //   String? cityName;
// //   double? amount;
// //   String? startSlotTime;
// //   String? endSlotTime;
// //
// //   LabAd({
// //     this.id,
// //     this.patientName,
// //     this.mobileNumber,
// //     this.location,
// //     this.cityName,
// //     this.amount,
// //     this.startSlotTime,
// //     this.endSlotTime,
// //   });
// //
// //   factory LabAd.fromJson(Map<String, dynamic> json) => LabAd(
// //         id: json["id"],
// //         patientName: json["PatientName"],
// //         mobileNumber: json["MobileNumber"],
// //         location: json["Location"],
// //         cityName: json["CityName"],
// //         amount: json["Amount"],
// //         startSlotTime: json["StartSlotTime"],
// //         endSlotTime: json["EndSlotTime"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "PatientName": patientName,
// //         "MobileNumber": mobileNumber,
// //         "Location": location,
// //         "CityName": cityName,
// //         "Amount": amount,
// //         "StartSlotTime": startSlotTime,
// //         "EndSlotTime": endSlotTime,
// //       };
// // }
// ///
// import 'dart:convert';
//
// LabappointmentdetailsModel labappointmentdetailsModelFromJson(String str) =>
//     LabappointmentdetailsModel.fromJson(json.decode(str));
//
// String labappointmentdetailsModelToJson(LabappointmentdetailsModel data) =>
//     json.encode(data.toJson());
//
// class LabappointmentdetailsModel {
//   List<LabAd>? labAd;
//
//   LabappointmentdetailsModel({
//     this.labAd,
//   });
//
//   factory LabappointmentdetailsModel.fromJson(Map<String, dynamic> json) =>
//       LabappointmentdetailsModel(
//         labAd: json["LabAD"] == null
//             ? []
//             : List<LabAd>.from(json["LabAD"]!.map((x) => LabAd.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "LabAD": labAd == null
//             ? []
//             : List<dynamic>.from(labAd!.map((x) => x.toJson())),
//       };
// }
//
// class LabAd {
//   int? id;
//   String? patientName;
//   String? mobileNumber;
//   String? location;
//   String? cityName;
//   num? amount;
//   String? slotTime;
//
//   LabAd({
//     this.id,
//     this.patientName,
//     this.mobileNumber,
//     this.location,
//     this.cityName,
//     this.amount,
//     this.slotTime,
//   });
//
//   factory LabAd.fromJson(Map<String, dynamic> json) => LabAd(
//         id: json["id"],
//         patientName: json["PatientName"],
//         mobileNumber: json["MobileNumber"],
//         location: json["Location"],
//         cityName: json["CityName"],
//         amount: json["Amount"],
//         slotTime: json["SlotTime"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "PatientName": patientName,
//         "MobileNumber": mobileNumber,
//         "Location": location,
//         "CityName": cityName,
//         "Amount": amount,
//         "SlotTime": slotTime,
//       };
// }
///
import 'dart:convert';

LabappointmentdetailssModel labappointmentdetailsModelFromJson(String str) =>
    LabappointmentdetailssModel.fromJson(json.decode(str));

String labappointmentdetailsModelToJson(LabappointmentdetailssModel data) =>
    json.encode(data.toJson());

class LabappointmentdetailssModel {
  List<Labaptdetail>? labAdapt;

  LabappointmentdetailssModel({
    this.labAdapt,
  });

  factory LabappointmentdetailssModel.fromJson(Map<String, dynamic> json) =>
      LabappointmentdetailssModel(
        labAdapt: json["LabAD"] == null
            ? []
            : List<Labaptdetail>.from(
                json["LabAD"]!.map((x) => Labaptdetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LabAD": labAdapt == null
            ? []
            : List<dynamic>.from(labAdapt!.map((x) => x.toJson())),
      };
}

class Labaptdetail {
  int? id;
  String? patientName;
  String? mobileNumber;
  String? location;
  String? cityName;
  num? amount;
  String? slotTime;

  Labaptdetail({
    this.id,
    this.patientName,
    this.mobileNumber,
    this.location,
    this.cityName,
    this.amount,
    this.slotTime,
  });

  factory Labaptdetail.fromJson(Map<String, dynamic> json) => Labaptdetail(
        id: json["id"],
        patientName: json["PatientName"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        cityName: json["CityName"],
        amount: json["Amount"],
        slotTime: json["SlotTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "PatientName": patientName,
        "MobileNumber": mobileNumber,
        "Location": location,
        "CityName": cityName,
        "Amount": amount,
        "SlotTime": slotTime,
      };
}
