// To parse this JSON data, do
//
//     final doctorAppoinmentDetail = doctorAppoinmentDetailFromJson(jsonString);
///
// import 'dart:convert';
//
// List<DoctorAppoinmentDetailModel> doctorAppoinmentDetailFromJson(String str) =>
//     List<DoctorAppoinmentDetailModel>.from(
//         json.decode(str).map((x) => DoctorAppoinmentDetailModel.fromJson(x)));
//
// String doctorAppoinmentDetailToJson(List<DoctorAppoinmentDetailModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class DoctorAppoinmentDetailModel {
//   DoctorAppoinmentDetailModel({
//     this.id,
//     this.doctorName,
//     this.location,
//     this.startTime,
//     this.endTime,
//     this.disease,
//     this.status,
//     this.message,
//   });
//
//   int? id;
//   String? doctorName;
//   String? location;
//   String? startTime;
//   String? endTime;
//   String? disease;
//   bool? status;
//   dynamic message;
//
//   factory DoctorAppoinmentDetailModel.fromJson(Map<String, dynamic> json) =>
//       DoctorAppoinmentDetailModel(
//         id: json["Id"],
//         doctorName: json["DoctorName"],
//         location: json["Location"],
//         startTime: json["StartTime"],
//         endTime: json["EndTime"],
//         disease: json["Disease"],
//         status: json["Status"],
//         message: json["Message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DoctorName": doctorName,
//         "Location": location,
//         "StartTime": startTime,
//         "EndTime": endTime,
//         "Disease": disease,
//         "Status": status,
//         "Message": message,
//       };
// }
///
///
///
//import 'dart:convert';

// DoctorNewAppoinmentDetailModel doctorNewAppoinmentDetailModelFromJson(
//         String str) =>
//     DoctorNewAppoinmentDetailModel.fromJson(json.decode(str));
//
// String doctorNewAppoinmentDetailModelToJson(
//         DoctorNewAppoinmentDetailModel data) =>
//     json.encode(data.toJson());
//
// class DoctorNewAppoinmentDetailModel {
//   List<AppointmentDetail>? appointmentDetail;
//
//   DoctorNewAppoinmentDetailModel({
//     this.appointmentDetail,
//   });
//
//   factory DoctorNewAppoinmentDetailModel.fromJson(Map<String, dynamic> json) =>
//       DoctorNewAppoinmentDetailModel(
//         appointmentDetail: json["AppointmentDetail"] == null
//             ? []
//             : List<AppointmentDetail>.from(json["AppointmentDetail"]!
//                 .map((x) => AppointmentDetail.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "AppointmentDetail": appointmentDetail == null
//             ? []
//             : List<dynamic>.from(appointmentDetail!.map((x) => x.toJson())),
//       };
// }
//
// class AppointmentDetail {
//   int? id;
//   String? doctorName;
//   String? location;
//   String? startTime;
//   String? endTime;
//   String? disease;
//   DateTime? joiningDate;
//
//   AppointmentDetail({
//     this.id,
//     this.doctorName,
//     this.location,
//     this.startTime,
//     this.endTime,
//     this.disease,
//     this.joiningDate,
//   });
//
//   factory AppointmentDetail.fromJson(Map<String, dynamic> json) =>
//       AppointmentDetail(
//         id: json["Id"],
//         doctorName: json["DoctorName"],
//         location: json["Location"],
//         startTime: json["StartTime"],
//         endTime: json["EndTime"],
//         disease: json["Disease"],
//         joiningDate: json["JoiningDate"] == null
//             ? null
//             : DateTime.parse(json["JoiningDate"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DoctorName": doctorName,
//         "Location": location,
//         "StartTime": startTime,
//         "EndTime": endTime,
//         "Disease": disease,
//         "JoiningDate": joiningDate?.toIso8601String(),
//       };
// }

///...import 'dart:convert';
import 'dart:convert';

DoctorNewAppoinmentDetailModel doctorNewAppoinmentDetailModelFromJson(
        String str) =>
    DoctorNewAppoinmentDetailModel.fromJson(json.decode(str));

String doctorNewAppoinmentDetailModelToJson(
        DoctorNewAppoinmentDetailModel data) =>
    json.encode(data.toJson());

class DoctorNewAppoinmentDetailModel {
  List<AppointmentDetail>? appointmentDetail;

  DoctorNewAppoinmentDetailModel({
    this.appointmentDetail,
  });

  factory DoctorNewAppoinmentDetailModel.fromJson(Map<String, dynamic> json) =>
      DoctorNewAppoinmentDetailModel(
        appointmentDetail: json["AppointmentDetail"] == null
            ? []
            : List<AppointmentDetail>.from(json["AppointmentDetail"]!
                .map((x) => AppointmentDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AppointmentDetail": appointmentDetail == null
            ? []
            : List<dynamic>.from(appointmentDetail!.map((x) => x.toJson())),
      };
}

class AppointmentDetail {
  int? id;
  String? patientName;
  String? location;
  String? slotTime;
  DateTime? appointmentdate;
  String? deviceId;

  AppointmentDetail({
    this.id,
    this.patientName,
    this.location,
    this.slotTime,
    this.appointmentdate,
    this.deviceId,
  });

  factory AppointmentDetail.fromJson(Map<String, dynamic> json) =>
      AppointmentDetail(
        id: json["Id"],
        patientName: json["PatientName"],
        location: json["Location"],
        slotTime: json["SlotTime"],
        appointmentdate: json["Appointmentdate"] == null
            ? null
            : DateTime.parse(json["Appointmentdate"]),
        deviceId: json["DeviceId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "Location": location,
        "SlotTime": slotTime,
        "Appointmentdate": appointmentdate?.toIso8601String(),
        "DeviceId": deviceId,
      };
}
