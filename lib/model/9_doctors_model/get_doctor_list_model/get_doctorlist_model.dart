// To parse this JSON data, do
//
//     final getDoctorListModel = getDoctorListModelFromJson(jsonString);

import 'dart:convert';

GetDoctorListModel getDoctorListModelFromJson(String str) => GetDoctorListModel.fromJson(json.decode(str));

String getDoctorListModelToJson(GetDoctorListModel data) => json.encode(data.toJson());

class GetDoctorListModel {
  GetDoctorListModel({
    this.getDoctor,
  });

  List<GetDoctor>? getDoctor;

  factory GetDoctorListModel.fromJson(Map<String, dynamic> json) => GetDoctorListModel(
    getDoctor: json["getDoctor"] == null ? [] : List<GetDoctor>.from(json["getDoctor"]!.map((x) => GetDoctor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "getDoctor": getDoctor == null ? [] : List<dynamic>.from(getDoctor!.map((x) => x.toJson())),
  };
}

class GetDoctor {
  GetDoctor({
    this.isCheckedTermsCondition,
    this.doctorId,
    this.uniqueId,
    this.deptList,
    this.page,
    this.numberOfPages,
    this.pinCode,
    this.joiningDate,
    this.id,
    this.isDeleted,
    this.vendorName,
    this.companyName,
    this.doctorName,
    this.phoneNumber,
    this.mobileNumber,
    this.emailId,
    this.stateMasterId,
    this.cityMasterId,
    this.location,
    this.licenceImage,
    this.licenceNumber,
    this.clinicName,
    this.departmentId,
    this.specialistId,
    this.fee,
    this.password,
    this.confirmPassword,
    this.isApproved,
    this.adminLoginId,
    this.departmentList,
    this.specialistList,
    this.licenceImageFile,
    this.departmentName,
    this.specialistName,
    this.vendorId,
    this.hospitalId,
    this.licenceBase64,
    this.licenceImageName,
    this.aadharBase64,
    this.aadharImageName,
    this.startTime,
    this.endTime,
    this.slotTiming,
    this.startTime2,
    this.endTime2,
    this.slotTiming2,
    this.licenseValidity,
    this.otherCity,
    this.refId,
    this.experience,
    this.states,
    this.cities,
    this.locations,
    this.stateName,
    this.cityName,
    this.locationName,
  });

  dynamic isCheckedTermsCondition;
  String? doctorId;
  dynamic uniqueId;
  dynamic deptList;
  dynamic page;
  dynamic numberOfPages;
  String? pinCode;
  DateTime? joiningDate;
  int? id;
  bool? isDeleted;
  dynamic vendorName;
  dynamic companyName;
  String? doctorName;
  String? phoneNumber;
  String? mobileNumber;
  String? emailId;
  int? stateMasterId;
  int? cityMasterId;
  String? location;
  String? licenceImage;
  String? licenceNumber;
  String? clinicName;
  int? departmentId;
  int? specialistId;
  double? fee;
  String? password;
  dynamic confirmPassword;
  bool? isApproved;
  int? adminLoginId;
  dynamic departmentList;
  dynamic specialistList;
  dynamic licenceImageFile;
  dynamic departmentName;
  dynamic specialistName;
  int? vendorId;
  dynamic hospitalId;
  dynamic licenceBase64;
  dynamic licenceImageName;
  dynamic aadharBase64;
  dynamic aadharImageName;
  String? startTime;
  String? endTime;
  dynamic slotTiming;
  String? startTime2;
  String? endTime2;
  dynamic slotTiming2;
  DateTime? licenseValidity;
  dynamic otherCity;
  String? refId;
  int? experience;
  dynamic states;
  dynamic cities;
  dynamic locations;
  dynamic stateName;
  dynamic cityName;
  dynamic locationName;

  factory GetDoctor.fromJson(Map<String, dynamic> json) => GetDoctor(
    isCheckedTermsCondition: json["IsCheckedTermsCondition"],
    doctorId: json["DoctorId"],
    uniqueId: json["UniqueId"],
    deptList: json["DeptList"],
    page: json["Page"],
    numberOfPages: json["NumberOfPages"],
    pinCode: json["PinCode"],
    joiningDate: json["JoiningDate"] == null ? null : DateTime.parse(json["JoiningDate"]),
    id: json["Id"],
    isDeleted: json["IsDeleted"],
    vendorName: json["VendorName"],
    companyName: json["CompanyName"],
    doctorName: json["DoctorName"],
    phoneNumber: json["PhoneNumber"],
    mobileNumber: json["MobileNumber"],
    emailId: json["EmailId"],
    stateMasterId: json["StateMaster_Id"],
    cityMasterId: json["CityMaster_Id"],
    location: json["Location"],
    licenceImage: json["LicenceImage"],
    licenceNumber: json["LicenceNumber"],
    clinicName: json["ClinicName"],
    departmentId: json["Department_Id"],
    specialistId: json["Specialist_Id"],
    fee: json["Fee"],
    password: json["Password"],
    confirmPassword: json["ConfirmPassword"],
    isApproved: json["IsApproved"],
    adminLoginId: json["AdminLogin_Id"],
    departmentList: json["DepartmentList"],
    specialistList: json["SpecialistList"],
    licenceImageFile: json["LicenceImageFile"],
    departmentName: json["DepartmentName"],
    specialistName: json["SpecialistName"],
    vendorId: json["Vendor_Id"],
    hospitalId: json["HospitalId"],
    licenceBase64: json["LicenceBase64"],
    licenceImageName: json["LicenceImageName"],
    aadharBase64: json["AadharBase64"],
    aadharImageName: json["AadharImageName"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    slotTiming: json["SlotTiming"],
    startTime2: json["StartTime2"],
    endTime2: json["EndTime2"],
    slotTiming2: json["SlotTiming2"],
    licenseValidity: json["LicenseValidity"] == null ? null : DateTime.parse(json["LicenseValidity"]),
    otherCity: json["OtherCity"],
    refId: json["RefId"],
    experience: json["Experience"],
    states: json["States"],
    cities: json["Cities"],
    locations: json["Locations"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    locationName: json["LocationName"],
  );

  Map<String, dynamic> toJson() => {
    "IsCheckedTermsCondition": isCheckedTermsCondition,
    "DoctorId": doctorId,
    "UniqueId": uniqueId,
    "DeptList": deptList,
    "Page": page,
    "NumberOfPages": numberOfPages,
    "PinCode": pinCode,
    "JoiningDate": joiningDate?.toIso8601String(),
    "Id": id,
    "IsDeleted": isDeleted,
    "VendorName": vendorName,
    "CompanyName": companyName,
    "DoctorName": doctorName,
    "PhoneNumber": phoneNumber,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "StateMaster_Id": stateMasterId,
    "CityMaster_Id": cityMasterId,
    "Location": location,
    "LicenceImage": licenceImage,
    "LicenceNumber": licenceNumber,
    "ClinicName": clinicName,
    "Department_Id": departmentId,
    "Specialist_Id": specialistId,
    "Fee": fee,
    "Password": password,
    "ConfirmPassword": confirmPassword,
    "IsApproved": isApproved,
    "AdminLogin_Id": adminLoginId,
    "DepartmentList": departmentList,
    "SpecialistList": specialistList,
    "LicenceImageFile": licenceImageFile,
    "DepartmentName": departmentName,
    "SpecialistName": specialistName,
    "Vendor_Id": vendorId,
    "HospitalId": hospitalId,
    "LicenceBase64": licenceBase64,
    "LicenceImageName": licenceImageName,
    "AadharBase64": aadharBase64,
    "AadharImageName": aadharImageName,
    "StartTime": startTime,
    "EndTime": endTime,
    "SlotTiming": slotTiming,
    "StartTime2": startTime2,
    "EndTime2": endTime2,
    "SlotTiming2": slotTiming2,
    "LicenseValidity": licenseValidity?.toIso8601String(),
    "OtherCity": otherCity,
    "RefId": refId,
    "Experience": experience,
    "States": states,
    "Cities": cities,
    "Locations": locations,
    "StateName": stateName,
    "CityName": cityName,
    "LocationName": locationName,
  };
}
