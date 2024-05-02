import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_booking_history.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/doctor_list_byhospitalid/doctor_list_through_api.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_department_list_model/department_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_list_models.dart';
import 'package:ps_welness_new_ui/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
import 'package:ps_welness_new_ui/model/1_user_model/medicine_list_model/medicine_list_models.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_detail_id.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_list_modelby_locationid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_location_model/nurse_location_models.dart';
import 'package:ps_welness_new_ui/model/1_user_model/slot_duration_common_model/slot_duration_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/test_name_model/test_name_modells.dart';
import 'package:ps_welness_new_ui/model/1_user_model/time_slots_common_model/time_slots_common.dart';
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/vehicle_type_dropdown.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/complain_nurse_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmentdetail_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmenthistory_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_banner_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/franchise_model_comman/franchise_model_id.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/week_day_off/week_day_off_model.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';
import 'package:ps_welness_new_ui/model/franchies_models/Dept_dropdown_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/Frenchies_payoutReport_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/franchies_specialist.dart';
import 'package:ps_welness_new_ui/model/franchies_models/franchise_comission_by_role_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesAddVehicleList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesBanner_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesChemistRegistration_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesCommissionReportDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesCommissionReport_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDept&SpecList2_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDept&SpecList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDoctorDetail_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDriverDetails_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesLabDetail_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesNewDriverList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesNurseDetails_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesOldDriverList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesPatientDetails_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesPaymentReport_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesProfileDetail_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesRWADetail_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTDSReportDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTDSReportList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTdsListByDate_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTotalCommission_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTotalTDS_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleCategoryDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleDetails_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleTypeDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDChemistReportApi_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDDoctorReportApi_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDLabReportApi_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDNurseReportApi_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDVehicleReportApi_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchies_getRole_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchies_testList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/specialistDW_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/update_old_driver_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/update_old_driver_model_vehicle_number.dart';
import 'package:ps_welness_new_ui/model/franchies_models/vechle_number_list_newdriverupdate_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/vehicle_number_list_old_driver_model.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/view_dept_specialist_view/view_dept_special_list.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/comman_bank_update/all_get_bank_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import '../../model/1_user_model/health_checkup_list/health_checkup_list.dart';
import '../../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
import '../../model/1_user_model/nurse_type_model/nurse_type_model.dart';
import '../../model/1_user_model/states_model/state_modells.dart';
import '../../model/3_driver_controllers_RRR/driver_appoinment_detail_model.dart';
import '../../model/3_driver_controllers_RRR/driver_booking_history_model.dart';
import '../../model/3_driver_controllers_RRR/driver_payment_history_model.dart';
import '../../model/3_driver_controllers_RRR/driver_payout_history_model.dart';
import '../../model/3_driver_controllers_RRR/driver_profile_detail_model.dart';
import '../../model/4_nurse_all_models_RRR/nurse_appointment_details_list.dart';
import '../../model/4_nurse_all_models_RRR/nurse_patient_list_model.dart';
import '../../model/4_nurse_all_models_RRR/nurse_payment_history_model.dart';
import '../../model/4_nurse_all_models_RRR/nurse_profile_model.dart';
import '../../model/5_RWA_controller_RRR/rwa_banner_model.dart';
import '../../model/5_RWA_controller_RRR/rwa_patient_list_model.dart';
import '../../model/5_RWA_controller_RRR/rwa_payment_report_model.dart';
import '../../model/5_RWA_controller_RRR/rwa_payout_report_model.dart';
import '../../model/5_RWA_controller_RRR/rwa_profile_detail_model.dart';
import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_bannerModel.dart';
import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_order_historyModel.dart';
import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_payment_historyModel.dart';
import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_payoutModel.dart';
import '../../model/9_doctors_model/doctor_homepage_model/doctor_appointment_online.dart';
import '../../model/9_doctors_model_RRR/doctor_payment_history.dart';
import '../../model/9_doctors_model_RRR/get_all_skils_model/get_all_skils_model.dart';
import '../../model/9_doctors_model_RRR/view_patient_report_model.dart';
import '../../model/franchies_models/frenchiesGetGallery_model.dart';
import '../../model/franchies_models/update_new_vehicle_vehicletypeid_model.dart';

var base64Code = "base64";
//base64Encode( File(selectedPath.value).readAsBytes());
///
var prefs = GetStorage();

class ApiProvider {
  static var baseUrl = 'http://pswellness.in/';

  //'http://pswellness.in/';
  static String token = '';
  static String Token = '';

  //static String catid = '';
  //static String productid = '';
  //static String orderid = '';
  static String Id = ''.toString();
  static String MedicineId = ''.toString();
  static String adminId = ''.toString();
  static String userid = ''.toString();
  static String StatemasterId = ''.toString();
  static String CitymasterId = ''.toString();
  static String AdminLoginId = ''.toString();
  //static String adminId = ''.toString();

  //static String cartlistid = '';
  //static String addressid = '';
  //static String Message = "";

  ///TODO: here we have to add different api in this page...........
  /// TODO: from here user 1 section...........
  ///
  //user signup..............

  //login user api ps welness api 1..................................

  static UserSignUpApi(
    var PatientName,
    var EmailId,
    var MobileNumber,
    var Password,
    var State,
    var City,
    var Address,
    var Pincode,
  ) async {
    var url = '${baseUrl}api/PatientApi/PatientRegistration';

    var body = {
      "PatientName": PatientName,
      "EmailId": EmailId,
      "MobileNumber": MobileNumber,
      "Password": Password,
      "State": State,
      "City": City,
      "Address": Address,
      "Pincode": Pincode,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //login user api ps welness api 2..................................

  static LoginEmailApi(
    var Username,
    var Password,
  ) async {
    var url = '${baseUrl}api/SignupApi/Login';

    var body = {
      "Username": Username,
      "Password": Password,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      ///....
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      userid = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
//adminId
      //StatemasterId = ''.toString();
      //   static String CitymasterId
      ///todo: save state id........
      prefs.write("StateMaster_Id".toString(),
          json.decode(r.body)['data']['StateMaster_Id']);
      StatemasterId = prefs.read("StateMaster_Id").toString();
      print('&&&&statemasterId:${StatemasterId}');

      ///todo: save city id........
      prefs.write("CityMaster_Id".toString(),
          json.decode(r.body)['data']['CityMaster_Id']);
      CitymasterId = prefs.read("CityMaster_Id").toString();
      print('&&citymasterId:${CitymasterId}');

      ///var prefs = GetStorage();
      //savid..........
      prefs.write("AdminLogin_Id".toString(),
          json.decode(r.body)['data']['AdminLogin_Id']);
      adminId = prefs.read("AdminLogin_Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');

      //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

//Change passwo

  static ChangePasswordApi(var ID, var Password, var ConfirmPassword) async {
    var url = '${baseUrl}api/SignupApi/ChangePassword';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

    var body = {
      "ID": Id.toString(),
      // Id.toString(),
      //2.toString(),
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      //Id = prefs.read("data")["Id"].toString();
      //print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //user signup..............

  //login user api ps welness api 1..................................

  static NurseselectionformApi(
    var ServiceType,
    var ServiceTime,
    var NurseTypeId,
    var PatientId,
    var Mobile,
    var ServiceDate,
    var StartDate,
    var EndDate,
    var LocationId,
  ) async {
    var url = '${baseUrl}api/ApiTest/BookAppointment';

    var body = {
      "ServiceType": ServiceType,
      "ServiceTime": ServiceTime,
      "NurseType_Id": NurseTypeId,
      "PatientId": PatientId,
      "Mobile": Mobile,
      "ServiceDate": ServiceDate,
      "StartDate": StartDate,
      "EndDate": EndDate,
      "LocationId": LocationId,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      ///
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //complain_register user api................

  static UserComplainApi(
    var LoginId,
    var Subjects,
    var Complaints,
    var IsDeleted,
    var IsResolved,
    var Others,
    var Doctor,
  ) async {
    var url = '${baseUrl}api/ComplaintApi/PatientComplaint';
    // var prefs = GetStorage();
    // //saved id..........
    // //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    // Id = prefs.read("Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

    var body = {
      "Login_Id": Id,
      "Subjects": Subjects,
      "Complaints": Complaints,
      "IsDeleted": IsDeleted,
      "IsResolved": IsResolved,
      "Others": Others,
      "Doctor": Doctor,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///lab test name Api get ...........................
  static Future<List<TestModel>> getTestNameApi() async {
    var url = "${baseUrl}api/CommonApi/TestList";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var testnameData = testNameModelFromJson(r.body);
        return testnameData.tests;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///Todo: from here franchies 2 section.................
  static FranchiesSpealistApi() async {
    var url = '${baseUrl}api/CommonApi/GetSpecialist?depId=87';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        SpealistFranchies? catagarylist = spealistFranchiesFromJson(r.body);
        return catagarylist;
      }
    } catch (error) {
      return;
    }
  }

  ///Todo: from here nurse 3 section.................
  // nurse appointment detail.............................

  //from_here nurse type.........................
  ///new nuese appointment nurse section.....api....29---aug--2023..

  static NurseappointmentApi() async {
    //
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var NurseuserListId = preferences.getString("NurseuserListId");
    // print("nurseuserlistId: ${NurseuserListId}");
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');

    var url =
        //"http://test.pswellness.in/api/NurseAPI/NurseDetails?id=56";
        //"http://test.pswellness.in/api/NurseAPI/NurseDetails?id=$NurseuserListId";
        "${baseUrl}api/NurseAppointmentAPI/NurseAppointmentList?NurseId=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseAppointmentDetail nurseAppointmentDetail =
            nurseAppointmentDetailFromJson(r.body);
        print("rtrrtrtrtrrahukllllkjj:${r.body}");
        print("nurseLisruseIdUrlrrr: ${url}");

        return nurseAppointmentDetail;
      }
    } catch (error) {
      print("rtrrtrtrtrrahukllllkuuuuulrrrr:${error}");
      return;
    }
  }

  //doctor profile  api 2..........................
  static NurseTypeApi() async {
    var url = '${baseUrl}api/CommonApi/NurseList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseList? nurseList = nurseListFromJson(r.body);
        return nurseList;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: Delete user from nurse appointmrnt ......5 sep 2023....
  static userAptnrsdeleteApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&skilsprofiledetail:${userid}');
    print(userid);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseesspartId = preferences.getString("NurseesspartId");
    print("userrrlistssId111: ${NurseesspartId}");

    var url = '${baseUrl}api/PatientApi/CancelAppointment_ByNurse';

    var body = {"Id": "$NurseesspartId", "Pro_Id": userid};
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar("Your Booking deleted", r.body);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: Delete user from dr appointmrnt ......5 sep 2023....
  static userAptdrdeleteApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&skilsprofiledetail:${userid}');
    print(userid);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DrIds = preferences.getString("DrIds");
    print("userrrlistssId111211: ${DrIds}");

    var url = '${baseUrl}api/PatientApi/CancelAppointment_ByDoctor';

    var body = {"Id": "$DrIds", "Pro_Id": userid};
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    print("draptbodywqdwrrwewewe12:${r.body}");

    if (r.statusCode == 200) {
      Get.snackbar("Sucess", "Seccessful");
      print("draptdddd:${url}");
      print("draptbodywqdwrrwewewe:${r.body}");
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: Delete user from dr appointmrnt ......30 april  2024....
  static userAcceptdrApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&skilsprofiledetail:${userid}');
    print(userid);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DrIds = preferences.getString("DrIds");
    print("userrrlistssId111211: ${DrIds}");

    var url = '${baseUrl}api/DoctorApi/AcceptBooking';

    var body = {"Id": "$DrIds"};
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    print("draptbodywqdwrrwewewe12:${r.body}");

    if (r.statusCode == 200) {
      Get.snackbar("Sucess", " Booking Accepted ");
      print("draptdddd:${url}");
      print("draptbodywqdwrrwewewe:${r.body}");
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///Todo: from here doctor 9 section...9 june 2023..............
  ///
  //sign up  Api doctor Api 1........................................................
  static signDoctorUpApi(
      var PAN,
      var DoctorName,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var MobileNumber,
      var PhoneNumber,
      var ClinicName,
      var StateMaster_Id,
      var CityMaster_Id,
      var Location,
      var LicenceImage,
      var LicenceBase64,
      var LicenceNumber,
      var LicenseValidity,
      var PinCode,
      var PanImage,
      var PanImageBase64,
      var SlotTiming,
      TimeOfDay? startTime,
      TimeOfDay? EndTime,
      var SlotTiming2,
      TimeOfDay? StartTime2,
      TimeOfDay? EndTime2,
      var Experience,
      var Department_Id,
      var Specialist_Id,
      var Fee,
      var Qualification,
      var RegistrationNumber,
      var SignaturePic,
      var SignaturePicBase64,
      var Day_Id,
      var VirtualFee,
      var About,
      var Vendor_Id) async {
    try {
      var url = '${baseUrl}api/SignupApi/DoctorRegistration';

      String formattedTime =
          '${startTime?.hour.toString().padLeft(2, '0')}:${startTime?.minute.toString().padLeft(2, '0')}:00.0000000';
      print('Frenchies122: ${formattedTime}');

      String formattedTime1 =
          '${EndTime?.hour.toString().padLeft(2, '0')}:${EndTime?.minute.toString().padLeft(2, '0')}:00.0000000';
      print('Frenc1: ${formattedTime1}');

      String formattedTime2 =
          '${StartTime2?.hour.toString().padLeft(2, '0')}:${StartTime2?.minute.toString().padLeft(2, '0')}:00.0000000';
      print('Frenchies122: ${formattedTime2}');

      String formattedTime3 =
          '${EndTime2?.hour.toString().padLeft(2, '0')}:${EndTime2?.minute.toString().padLeft(2, '0')}:00.0000000';
      print('Frenchies122: ${formattedTime3}');

      Id = prefs.read("Id").toString();

      var body = {
        "PAN": "$PAN",
        "DoctorName": "$DoctorName",
        "EmailId": "$EmailId",
        "Password": "$Password",
        "ConfirmPassword": "$ConfirmPassword",
        "MobileNumber": "$MobileNumber",
        "PhoneNumber": "$PhoneNumber",
        "ClinicName": "$ClinicName",
        "StateMaster_Id": "$StateMaster_Id",
        "CityMaster_Id": "$CityMaster_Id",
        "Location": "$Location",
        "LicenceImage": "$LicenceImage",
        "LicenceBase64": "$LicenceBase64",
        "LicenceNumber": "$LicenceNumber",
        "LicenseValidity": "$LicenseValidity",
        "PinCode": "$PinCode",
        "PanImage": "$PanImage",
        "PanImageBase64": "$PanImageBase64",
        "SlotTiming": "$SlotTiming",
        "StartTime": formattedTime,
        //"01:50:00.0000000",
        "EndTime": formattedTime1,
        //"14:27:00.0000000",
        "SlotTiming2": "$SlotTiming2",
        "StartTime2": formattedTime2,
        //"14:27:00.0000000",
        "EndTime2": formattedTime3,
        //"18:24:00.0000000",
        /// "Vendor_Id": "$Id",
        "Experience": "$Experience",
        "Department_Id": "$Department_Id",
        "Specialist_Id": "$Specialist_Id",
        "Fee": "$Fee",
        "Qualification": "$Qualification",
        "RegistrationNumber": "$RegistrationNumber",
        "SignaturePic": "$SignaturePic",
        "SignaturePicBase64": "$SignaturePicBase64",
        "Day_Id": "$Day_Id",
        "VirtualFee": "$VirtualFee",
        "About": "$About",
        "Vendor_Id": "$Vendor_Id"
      };
      print("Bo: ${body}");
      // print("Body%%%%%%%%%%%%%%%%%%%%%%%%%%%Time: ${StartTime}");
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
      );
      if (r.statusCode == 200) {
        print("Bodydr200: ${body}");

        Get.snackbar(
          'Success',
          r.body,
          duration: const Duration(seconds: 2),
        );
        print("Success123: ${r.body}");
        //Get.snackbar("Success", "${r.body}");
        return r;
      } else {
        print("Doctor registration failed: ${r.statusCode}");
        print("Doctor registration failed: ${r.body}");
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //doctor profile  api 2..........................
  // static DoctorProfileApi() async {
  //   var url = '${baseUrl}api/DoctorApi/DoctorProfile?DoctorId=150';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       DoctorProfile? doctorProfile = doctorProfileFromJson(r.body);
  //       return doctorProfile;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  /// todo doctor complain_register ................Rahul
  static doctorComplainApi(
    var Subjects,
    var Complaints,
    var Others,
  ) async {
    var url = '${baseUrl}api/ComplaintApi/DoctorComplaint';
    var body = {
      "Subjects": Subjects,
      "Complaints": Complaints,
      "Others": Others,
    };
    print('DoctorComplainApi: ${body}');
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  /// todo driver complain register......modified
  static driverComplainApi(var Subjects, var Complaints, var Others) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&ddwduseridEEE:${userid}');
    var url = '${baseUrl}api/ComplaintApi/DriverComplaints';
    var body = {
      "Login_Id": userid,
      "Subjects": Subjects,
      "Complaints": Complaints,
      "Others": Others,
    };
    print("DriverComplainApi: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      print('Register complain error2: ${r.body}');
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  /// todo complain_register doctor api................ rahul
  static NurseComplainApi(var Subjects, var Others, var Complaints) async {
    var url = '${baseUrl}api/ComplaintApi/NurseComplaints';
    var body = {
      "Subjects": Subjects,
      "Complaints": Complaints,
      "Others": Others,
    };
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    if (r.statusCode == 200) {
      Get.snackbar('message', "${r.body}");
      print("NurseComplainApiSuccess: ${r.body}");
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //view_patient_list api 3.........
  static ViewPatientReportsApi() async {
    var url =
        '${baseUrl}api/DoctorApi/PatientReports?DoctorId=151&PatientId=77';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        ViewPatientReport? viewPatientReport =
            viewPatientReportFromJson(r.body);
        print("ViewPatientReport: ${viewPatientReport}");
        return viewPatientReport;
      }
    } catch (error) {
      return;
    }
  }

  //view_payment_history.............

//ViewPaymentHistoryApi()
  ///
//   static DoctorPaymentHistoryApi() async {
//     var prefs = GetStorage();
//     userid = prefs.read("Id").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&ddwduserid:${userid}');
//     var url = '${baseUrl}api/DoctorApi/DoctorpaymentHistory?Id=$userid';
//     try {
//       http.Response r = await http.get(Uri.parse(url));
//       print("DoctorPaymentHistory Response: ${r.toString()}");
//       if (r.statusCode == 200) {
//         print("apointment${r.body}");
//         print("apointmenturl${url}");
//         DoctorPaymentHistoryModel? viewPatientpaymentReport =
//             doctorPaymentHistoryModelFromJson(r.body);
//         // print("DoctorPaymentHistory: ${viewPatientpaymentReport.paymentHistory![0].amount}");
//         return viewPatientpaymentReport;
//       }
//     } catch (error) {
//       print("DoctorPaymentHistoryError: ${error}");
//       return;
//     }
//   }

  //patient_list_api..........................
  ///
  //ViewPaymentHistoryApi()
  static DoctorPaymentHistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&ddwduserid:${userid}');
    var url = '${baseUrl}api/DoctorApi/DoctorpaymentHistory?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print("DoctorPaymentHistory Response: ${r.toString()}");
      if (r.statusCode == 200) {
        print("apointment${r.body}");
        print("apointmenturl${url}");
        DoctorPaymentHistoryModel? viewPatientpaymentReport =
            doctorPaymentHistoryModelFromJson(r.body);
        print(
            "DoctorPaymentHistory: ${viewPatientpaymentReport?.paymentHistory![0].amount}");
        return viewPatientpaymentReport;
      }
    } catch (error) {
      print("DoctorPaymentHistoryError: ${error}");
      return;
    }
  }

  // static ViewPatientsListApi() async {
  //   var url = "${baseUrl}api/DoctorApi/ViewPatientList?DoctorId=151";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var PatientList = patientListFromJson(r.body);
  //       return PatientList;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///todo:from here 1_user................................
//lab_list_api..........................
  static ViewLabListApi() async {
    var url = "${baseUrl}api/LabApi/LabsList?CityId=786";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var LabListUser = labListUserFromJson(r.body);
        return LabListUser;
      }
    } catch (error) {
      return;
    }
  }

  ///todo:add to cart......................................................add to cart...
  static Addtocartmedicineapi(MedicineId, Quantity) async {
    var url = '${baseUrl}api/PatientMedicine/AddMedicineToCart';
    var prefs = GetStorage();
    //saved id..........
    final PatientId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');
    // token = prefs.read("token").toString();

    var body = {
      "PatientId": PatientId,
      "MedicineId": MedicineId,
      "Quantity": Quantity,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      CallLoader.hideLoader();
      Get.snackbar('Error', "${r.body}");
      return r;
    }
  }

  /// user medicinrcart_list_api.............................................
  static MedicinecartlistApi() async {
    var prefs = GetStorage();
    //saved id..........
    final PatientId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');
    var url = "${baseUrl}api/PatientMedicine/MedicineCart?patientId=$PatientId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var MedicineCartListModel = medicineCartListModelFromJson(r.body);
        return MedicineCartListModel;
      }
      //print('&&&&&&&&&&&&&&&&&&&&&&okokouuuuu:${Id}');
    } catch (error) {
      return;
    }
  }

  //
  /// user medicine_list_api..........................
  static MedicinelistApi() async {
    var url = "${baseUrl}api/PatientMedicine/GetMedicines";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var MedicineList = medicineListFromJson(r.body);
        return MedicineList;
      }
    } catch (error) {
      return;
    }
  }

  ///lab_list_2...........................
  static LabListDrowerApi() async {
    var url = "${baseUrl}api/HealthCheckUpApi/ViewMore?HealthId=18";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var HealthCheckupList = healthCheckupListFromJson(r.body);
        return HealthCheckupList;
      }
    } catch (error) {
      return;
    }
  }

  ///checkup_history_3...........................
  static LabHistoryApi() async {
    var url = "${baseUrl}api/HealthCheckUpApi/H_CheckUpList?cityId=67";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var HealthCheckupListss = healthCheckupListssFromJson(r.body);
        return HealthCheckupListss;
      }
    } catch (error) {
      return;
    }
  }

  //
  ///state Api get...........................
  static Future<List<StateModel>> getSatesApi() async {
    var url = "${baseUrl}api/CommonApi/GetStates";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var statesData = statesModelFromJson(r.body);
        return statesData.states;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_cities_api...........

  static Future<List<City>> getCitiesApi(String stateID) async {
    var url = "${baseUrl}api/CommonApi/GetCitiesByState?stateId=$stateID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var citiesData = cityModelFromJson(r.body);
        return citiesData.cities;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///state Api get........15june 2023.................driver..vehicle registration
  static Future<List<VehicleTypeElement>?> getvehicledriverApi() async {
    var url = "${baseUrl}api/DriverApi/GetVehicleTypeDropdown";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var vehicleData = vehicleTypeFromJson(r.body);
        print('&&&driverokoko:${r.body}');

        return vehicleData.vehicleType;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///doctor department Api get..dropdownapi user.........................
  static Future<List<DepartmentModel>> getDortorDepartmentApi() async {
    var url = "${baseUrl}api/CommonApi/GetDepartments";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var statesData = getdepartmentmodelFromJson(r.body);
        return statesData.departments;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_cities_api...........

  static Future<List<SpecialistModel>> getSpeaclistbyIdApi(String depId) async {
    var url = "${baseUrl}api/CommonApi/GetSpecialist?depId=$depId";
    //"http://test.pswellness.in/api/CommonApi/GetCitiesByState?stateId=$stateID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var speclistData = getspecialistdeptbyIdFromJson(r.body);
        return speclistData.specialist;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_skils_api...........

  static getSkillsApi() async {
    var url = '${baseUrl}api/DoctorApi/GetDoctorSkills?doctorId=111';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        GetskillsModel? viewSkilsReport = getskillsModelFromJson(r.body);
        return viewSkilsReport;
      }
    } catch (error) {
      return;
    }
  }

  ///

  ///nurse Api get...........................
  static Future<List<NurseModels>> getnursetypeApi() async {
    var url = "${baseUrl}api/CommonApi/NurseList";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var nursetypeData = getNurseTypeModelFromJson(r.body);
        return nursetypeData.nurse;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///nurse location Api get.........................................................
  static Future<List<NurseLocationModel>> getnurselocationtApi() async {
    var url = "${baseUrl}api/CommonApi/GetLocation";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var nurselocationData = getNurseLocationModelFromJson(r.body);
        return nurselocationData.location;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///add doctor's skils api...........

  static doctorSkillsApi(
    var DoctorId,
    var SkillName,
  ) async {
    var url = '${baseUrl}api/DoctorApi/AddSkill';

    var body = {
      "Doctor_Id": "111",
      "SkillName": SkillName,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      //Get.snackbar("Skills added",r.body);
      var prefs = GetStorage();
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      ///
      // //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //GetDoctorListHospitalModel...

  ///get_skils_api...........

  static getListOfDoctorApi() async {
    var url = '${baseUrl}api/HospitalAPI/DoctorList?hospitalId=209';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        GetDoctorListHospitalModel? viewdoctorlist =
            getDoctorListHospitalModelFromJson(r.body);
        return viewdoctorlist;
      }
    } catch (error) {
      return;
    }
  }

  ///Todo: Doctor signup Api........Rahul
  static DoctorsSignUpApi(
    var DoctorName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var Fee,
    var PhoneNumber,
    var StartTime,
    var SlotTiming,
    var DepartmentId,
    var SpecialistId,
    var LicenceNumber,
    var LicenceImage,
    var LicenceImageName,
    var PinCode,
    var ClinicName,
    var Location,
    var StateMasterId,
    var CityMasterId,
    var EndTime,
    var LicenceBase64,
  ) async {
    var url = '${baseUrl}api/SignupApi/DoctorRegistration';
    var body = {
      "DoctorName": DoctorName,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "MobileNumber": MobileNumber,
      "Fee": Fee,
      "PhoneNumber": PhoneNumber,
      "StartTime": StartTime,
      "SlotTiming": SlotTiming,
      "Department_Id": DepartmentId,
      "Specialist_Id": SpecialistId,
      "LicenceNumber": LicenceNumber,
      "LicenceImage": LicenceImage,
      "LicenceImageName": LicenceImageName,
      "PinCode": PinCode,
      "ClinicName": ClinicName,
      "Location": Location,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "EndTime": EndTime,
      "LicenceBase64": LicenceBase64,
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else if (r.statusCode == 500) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: banner Api for user.........
  static getbanneruserApi() async {
    var url = '${baseUrl}api/SignupApi/getBanner/?id=1';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for doctor.........
  static getbannerdoctorApi() async {
    var url = '${baseUrl}api/SignupApi/getBanner/?id=4';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DoctorBannerModel doctorBannerModel = doctorBannerFromJson(r.body);
        print("doctorrrbaner:${r.body}");
        // print("Doctorbanner: ${doctorBannerModel.bannerImageList?[0].id}");
        return doctorBannerModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo doctor appoinment detail..........
  static DoctorAppoinmentDetail() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var url = '${baseUrl}api/DoctorApi/GetAppointmentDetail?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        var doctornewAppoinmentDetail =
            doctorNewAppoinmentDetailModelFromJson(r.body);
        print("drapt:${url}");
        print("draptbody:${r.body}");
        // print(
        //"doctorAppoinmentDetail: ${doctorAppoinmentDetail?.doctorAppoinmentDetail..[0].doctorName}");
        return doctornewAppoinmentDetail;
      }
    } catch (error) {
      print(":::::::::${error}");
      return;
    }
  }

  ///todo doctor appoinment detail..........
  static DoctorAppoinmentOnline() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    //http://test.pswellness.in/api/DoctorApi/GetVirtualAppointmentDetail?Id=242
    var url = '${baseUrl}api/DoctorApi/GetVirtualAppointmentDetail?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        var OnlineDoctorApt = onlineDoctorAptFromJson(r.body);
        print("draptee:${url}");
        print("draptbodyeeere:${r.body}");
        // print(
        //"doctorAppoinmentDetail: ${doctorAppoinmentDetail?.doctorAppoinmentDetail..[0].doctorName}");
        return OnlineDoctorApt;
      }
    } catch (error) {
      print("::::::::errr:${error}");
      return;
    }
  }

//todo Doctor Appoinment History ........Rahul
  static DoctorAppoinmentHistory() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userassaid:${userid}');
    var url = '${baseUrl}api/DoctorApi/GetAppointmentDetail?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DoctorAppoinmentHistorydetailModel doctorAppoinmentHistoryModel =
            doctorAppoinmentHistoryFromJson(r.body);

        print("draptdddd:${url}");
        print("draptbodywqdwrr:${r.body}");
        return doctorAppoinmentHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo doctor update profile.............Rahul
  static DoctorUpdateProfile(
    //var ID,
    var DoctorName,
    var MobileNumber,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var PinCode,
    var ClinicName,
    var EmailId,
    //var Fee,
    //var adminLogin_id,
    //var accountnoEditText,
    //var ifscCodeEditText,
    // var branchNameEditText
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userid}');
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');
    var url = '${baseUrl}api/DoctorApi/UpdateProfile';
    var body = {
      "ID": userid,
      "DoctorName": DoctorName,
      "MobileNumber": MobileNumber,
      "StateMaster_Id": "$StateMaster_Id",
      "CityMaster_Id": "$CityMaster_Id",
      "Location": Location,
      "PinCode": PinCode,
      "ClinicName": ClinicName,
      "EmailId": "$EmailId",
      //"Fee": Fee,
      //"adminLogin_id": adminId,
      // "AccountNo": accountnoEditText,
      //"IFSCCode": ifscCodeEditText,
      //"BranchName": branchNameEditText
    };
    print("okokodr33${body}");

    http.Response r = await http.post(Uri.parse(url), body: body);
    print("okokodr${r.body}");

    if (r.statusCode == 200) {
      print("okokodr${r.body}");
      Get.snackbar("Success", r.body);
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo driver update profile..............Rahul
  static DriverUpdateProfile(
    var DriverName,
    var MobileNumber,
    //var VehicleName,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var EmailId,
    var PinCode,
    //var DlNumber,
    //var DlImage,
    // var DlBase64Image,
  ) async {
    var url = '${baseUrl}api/DriverApi/UpdateProfile';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var body = {
      "Id": userid,
      "DriverName": DriverName.toString(),
      "MobileNumber": MobileNumber.toString(),
      // "VehicleName": VehicleName.toString(),
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location.toString(),
      "EmailId": "$EmailId",
      "PinCode": "$PinCode",
      // "DlNumber": DlNumber.toString(),
      //"DlImage": DlImage.toString(),
      // "DlBase64Image": "$DlBase64Image",
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("DriverUpdateProfil: ${body}");
    if (r.statusCode == 200) {
      print("DriverUpdateProfil200: ${body}");

      print("DriverUpdateProfilSuccess############################: ${r.body}");
      Get.snackbar("Success", r.body);
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo driver Update bank Details............Rahul
  static DriverUpdateBankDetail(
      var idController,
      var LoginIdController,
      var accountnoController,
      var ifscController,
      var branchNameController,
      var branchaddressController,
      var holderNameController,
      var mobileNumberController) async {
    var url = '${baseUrl}api/SignupApi/UpdateBank';
    var body = {
      "Id": idController,
      "Login_Id": LoginIdController,
      "AccountNo": accountnoController,
      "IFSCCode": ifscController,
      "BranchName": branchNameController,
      "BranchAddress": branchaddressController,
      "HolderName": holderNameController,
      "MobileNumber": mobileNumberController
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("driver Update bank Details Successs: ${r.body}");
      Get.snackbar(
        "Success",
        "Successfully Updated",
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      return r;
    } else {
      print("driver Update bank Details Error: ${r.body}");
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo driver appointment details............
  static DriverAppointmentDetails() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid434:${userid}');
    var url = '${baseUrl}api/DriverApi/getAppointmentDetail/?Id=$userid';
    //88
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DriverAppoinmentDetailModel driverAppoinmentDetail =
            driverAppoinmentDetailModelFromJson(r.body);
        return driverAppoinmentDetail;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driverPaymentHistory...................
  static DriverPaymentHistory() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userid}');
    var url = '${baseUrl}api/DriverApi/PaymentHistory?Id=$userid';
    //176
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        //DriverAppoinmentDetailModel driverAppoinmentDetail =
        //             driverAppoinmentDetailModelFromJson(r.body);
        List<DriverPaymentHistoryModel> driverPaymentHistoryModel =
            driverPaymentHistoryModelFromJson(r.body);
        return driverPaymentHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driverPaymentHistory.....user---side..................
  static DriverUserPaymentHistory() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userid}');
    var url =
        '${baseUrl}api/DriverApi/GetDriverBookingHistory?PatientId=$userid';
    //176
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        //DriverAppoinmentDetailModel driverAppoinmentDetail =
        //             driverAppoinmentDetailModelFromJson(r.body);
        AmbulanceUserPaymentHistory driveruserPaymentHistoryModel =
            ambulanceUserPaymentHistoryFromJson(r.body);
        return driveruserPaymentHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driver Booking History............
  /// /

  static DriverBookingHistory() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid455:${userid}');
    var url = '${baseUrl}api/DriverApi/BookingHistory?DriverId=$userid';
    //var url = '${baseUrl}api/DriverApi/BookingHistory?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DriverBookingHistoryModel driverBookingHistory =
            driverBookingHistoryModelFromJson(r.body);

        return driverBookingHistory;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driver payout history.............
  static DriverPayoutHistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid455ee:${userid}');
    http: //test.pswellness.in/api/DriverApi/payouthistory?id
    var url = '${baseUrl}api/DriverApi/PayoutHistory?id=$userid';
    //'$userid';
    //169
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        List<DriverPayoutHistoryModel> driverPayoutHistory =
            driverPayoutHistoryModelFromJson(r.body);
        return driverPayoutHistory;
      }
    } catch (error) {
      return;
    }
  }

  /// todo Driver signup api..........rahul .............Pending
  static DriverSignUpApi(
    var DoctorName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var Fee,
    var PhoneNumber,
    var StartTime,
    var SlotTiming,
    var DepartmentId,
    var SpecialistId,
    var LicenceNumber,
    var LicenceImage,
    var LicenceImageName,
    var PinCode,
    var ClinicName,
    var Location,
    var StateMasterId,
    var CityMasterId,
    var EndTime,
    var LicenceBase64,
  ) async {
    var url = '${baseUrl}api/SignupApi/DoctorRegistration';
    var body = {
      "DoctorName": DoctorName,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "MobileNumber": MobileNumber,
      "Fee": Fee,
      "PhoneNumber": PhoneNumber,
      "StartTime": StartTime,
      "SlotTiming": SlotTiming,
      "Department_Id": DepartmentId,
      "Specialist_Id": SpecialistId,
      "LicenceNumber": LicenceNumber,
      "LicenceImage": LicenceImage,
      "LicenceImageName": LicenceImageName,
      "PinCode": PinCode,
      "ClinicName": ClinicName,
      "Location": Location,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "EndTime": EndTime,
      "LicenceBase64": LicenceBase64,
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else if (r.statusCode == 500) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  /// todo Driver Profile detail.....................Rahul
  static DriverProfileDetailApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid55:${userid}');
    var url = '${baseUrl}api/DriverApi/GetDriverProfile?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DriverProfileDetailModel driverProfileDetail =
            driverProfileDetailModelFromJson(r.body);
        return driverProfileDetail;
      }
    } catch (error) {
      return;
    }
  }

  /// todo nurse appointment history.........Rahul.....2june...
  // static NurseAppointmentHistoryApi() async {
  //   var prefs = GetStorage();
  //   userid = prefs.read("Id").toString();
  //   print('&&&&&&&&&&&&&&&&&&&&&&userid:${userid}');
  //   var url =
  //       'http://test.pswellness.in/api/NurseAPI/AppoinmentHistory?ID=$userid';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     if (r.statusCode == 200) {
  //       print("yuyuyuy:${url}");
  //       List<NurseAppointmentHistoryModel> nurseAppointmentHistoryModel =
  //           nurseAppointmentHistoryModelFromJson(r.body)
  //               as List<NurseAppointmentHistoryModel>;
  //       return nurseAppointmentHistoryModel;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  /// todo nurse payment history.........Rahul
  static NursePaymentHistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userid}');

    var url = "${baseUrl}api/NurseAPI/PaymentHistory?NurseID=$userid";
    //'${baseUrl}api/NurseAPI/PaymentHistory?NurseID=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("urllllljjjrrrpayment:${url}");
        NursePaymentHistoryModel? nursePaymentHistory =
            nursePaymentHistoryModelFromJson(r.body);
        //List<NursePaymentHistoryModel> nursePaymentHistory = nursePaymentHistoryModelFromJson(r.body);
        return nursePaymentHistory;
      }
    } catch (error) {
      return;
    }
  }

  /// todo nurse patient list .........Rahul
  static NursePatientListApi() async {
    var url = '${baseUrl}api/NurseAPI/Patientlist?ID=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        List<NursePatientListModel> nursePatientList =
            nursePatientListFromJson(r.body);
        return nursePatientList;
      }
    } catch (error) {
      return;
    }
  }

  /// todo Doctor Complain DropDown .........Rahul
  static Future<List<Complaint41Patient>> DoctorComplainDropDownApi() async {
    var url = "${baseUrl}api/CommonApi/PatientSubjects";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        var subjecttypeData = complainSubjectModelFromJson(r.body);
        return subjecttypeData.complaint41Patient;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo nurse Complain DropDown .........prince
  static Future<List<ComplaintNurse41Patient>>
      NurseComplainDropDownApi() async {
    var url = "${baseUrl}api/CommonApi/PatientSubjects";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        var subjecttypeData = complainnurseSubjectModelFromJson(r.body);
        return subjecttypeData.complaint41Patient;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo Nurse Profile api..........rahul .............
  static NurseEditProfileApi(
    /// var idController,
    var nameController,
    var mobileController,
    var selectedStatee,
    var selectedCityy,
    var locationController,
    var pinController,
    // var clinicNameController,
    var EmailIdController,

    ///var adminLoginIdController,
    // var accountnoController,
    // var ifscController,
    // var branchNameController
  ) async {
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var url = '${baseUrl}api/NurseAPI/UpdateNurseProfile';
    var body = {
      "ID": userid,
      "NurseName": nameController,
      "MobileNumber": mobileController,
      "StateMaster_Id": selectedStatee,
      "CityMaster_Id": selectedCityy,
      "Location": locationController,
      "PinCode": pinController,
      //"ClinicName": clinicNameController,
      "EmailId": EmailIdController,
      "adminLogin_id": adminId,
      // "AccountNo": accountnoController,
      //"IFSCCode": ifscController,
      //"BranchName": branchNameController
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("bodyyyeeee:${body}");
    if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
      return r;
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  // todo Nurse Profile.................Rahul
  static NurseProfileApi() async {
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var url = '${baseUrl}api/NurseAPI/GetNurseProfile?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print('urknrs:$url');
        print('usradmin:${adminId}');

        NurseProfileModel nurseProfileModel = nurseProfileModelFromJson(r.body);
        return nurseProfileModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo Nurse Signup api..........rahul .............
  static NurseSignupApi(
    var PAN,
    var NurseName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var Location,
    var StateMaster_Id,
    var CityMaster_Id,
    var PanImage,
    var PanBase64Image,
    var NurseImage,
    var NurseImageBase64Image,
    var CertificateImage,
    var CertificateBase64Image,
    var CertificateNumber,
    var PinCode,
    var NurseType_Id,
    var Fee,
    var Location_id,
    var experience,
    var about,
    var Vendor_Id,
  ) async {
    var url = '${baseUrl}api/SignupApi/NurseRegistration';
    var body = {
      "PAN": "$PAN",
      "NurseName": NurseName,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "MobileNumber": MobileNumber,
      "Location": Location,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "PanImage": PanImage,
      "PanBase64Image": PanBase64Image,
      "NurseImage": NurseImage,
      "NurseImageBase64Image": NurseImageBase64Image,
      "CertificateImage": CertificateImage,
      "CertificateBase64Image": CertificateBase64Image,
      "CertificateNumber": CertificateNumber,
      "PinCode": PinCode,
      "NurseType_Id": NurseType_Id,
      "Fee": Fee,
      "Location_id": Location_id,
      "experience": experience,
      "about": about,
      "Vendor_Id": "$Vendor_Id",
    };

    http.Response r = await http.post(Uri.parse(url), body: body);
    print("Nurse Signup Api: ${body}");
    if (r.statusCode == 200) {
      print("Nurse 200: ${body}");

      Get.snackbar('message', r.body);
      return r;
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  /// todo  RWA Section...........Rahul
  /// RWA Patient List..............Rahul
  static RWAPatientListApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var url = '${baseUrl}api/PatientApi/GetPatientList?RWA_Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final rwaPatientListModel = rwaPatientListModelFromJson(r.body);
        print("RWAPatientList: ${rwaPatientListModel.patient?[0].patientName}");
        return rwaPatientListModel;
      }
    } catch (error) {
      return;
    }
  }

  /// RWA Payout Report..............Rahul
  static RWAPayoutReportApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var url = '${baseUrl}api/PatientApi/GetRWA_PayoutList?RWA_Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print("RWAPayoutbodyurlrr: ${url}");

      if (r.statusCode == 200) {
        final rwaPayoutReportModel = rwaPayoutReportModelFromJson(r.body);
        print(
            "RWAPayoutReport: ${rwaPayoutReportModel.rwaPayoutList?[0].authorityName}");
        print("RWAPayoutbody: ${r.body}");
        print("RWAPayoutbodyurl: ${url}");
        return rwaPayoutReportModel;
      }
    } catch (error) {
      print("RWAPayoutReporterror: ${error}");
      return;
    }
  }

  /// RWA Profile Detail..............Rahul
  static RWAProfileDetailApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userid}');
    var url = '${baseUrl}api/PatientApi/GetRWA_ProfileDetails?RWA_Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final rwaProfileDetailModel = rwaProfileDetailModelFromJson(r.body);
        print("RWAPayoutReportbody: ${r.body}");

        return rwaProfileDetailModel;
      }
    } catch (error) {
      print("RWAPayoutReport: ${error}");
      return;
    }
  }

  /// todo RWA Add Patient...........
  static RWAAddPatientApi(var PatientName, var EmailId, var MobileNumber,
      var Password, var ConfirmPassword, var Location, var PinCode) async {
    var prefs = GetStorage();
    //savid..........
    // prefs.write("AdminLogin_Id".toString(),
    //     json.decode(r.body)['data']['AdminLogin_Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userirwaaid:${userid}');
    var url = '${baseUrl}api/PatientApi/AddPatient';
    var body = {
      "Rwa_Id": userid,
      //"AdminLogin_Id": adminId,
      "PatientName": PatientName,
      "EmailId": EmailId,
      "MobileNumber": MobileNumber,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "Location": Location,
      "PinCode": PinCode
    };
    print('AddPatientBody: ${body}');
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("AddPatientSuccesss: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Add All  Bank Detail...........5 march 2024....prince
  static AddBankDetailApi(
    var AccountNo,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    var MobileNumber,
  ) async {
    var url = '${baseUrl}api/CommonApi/AddBankDetail';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var body = {
      //"Id": userid,
      "Login_Id": adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName,
      "BranchAddress": BranchAddress,
      "HolderName": HolderName,
      "MobileNumber": MobileNumber,
    };
    print('AddbankjBody: ${body}');
    print(adminId);
    print(AccountNo);
    print(IFSCCode);
    print(BranchName);
    print(BranchAddress);
    print(HolderName);
    print(MobileNumber);

    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print('AddbankjBody: ${body}');

      print("BankDetailSuccesss: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      // Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo update All  Bank Detail...coman........5 march 2024....prince
  static UpdateBankDetailApi(
    var AccountNo,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    var MobileNumber,
  ) async {
    var url = '${baseUrl}api/CommonApi/UpdateBank';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var body = {
      //"Id": userid,
      "Login_Id": adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName,
      "BranchAddress": BranchAddress,
      "HolderName": HolderName,
      "MobileNumber": MobileNumber,
    };
    print('update bank Body: ${body}');
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("BankDetailSuccesss: ${r.body}");
      // Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo all add Bank Detail...............alll bank.....
  static AddAllBankDetailApi(
    var AccountNo,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    var MobileNumber,
  ) async {
    //http://pswellness.in/api/CommonApi/AddBankDetail
    //{
    //     "Login_Id":"3712",
    //     "AccountNo":"8757439598357937",
    //     "IFSCCode":"PNBU783647",
    //     "BranchName":"PNB",
    //     "BranchAddress":"Noida",
    //     "HolderName":"Madhu",
    //     "MobileNumber":"89746676767"
    // }
    var url = '${baseUrl}api/DoctorApi/Doctor_AddBankDetail';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var body = {
      "Login_Id": adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName,
      "BranchAddress": BranchAddress,
      "HolderName": HolderName,
      "MobileNumber": MobileNumber,
    };
    print('AddPatientBodygg: ${body}');
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("BankDetailSuccessstt: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  ///get_bank detail all common api.......4 march 2024...
  ///
  static GetbankDetailAllApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&d:${adminId}');

    var url = '${baseUrl}api/CommonApi/GetBankDetail?AdminLogin_Id=$adminId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final allbankgetModel = bankAllDetailModelFromJson(r.body);
        return allbankgetModel;
      }
    } catch (error) {
      print("RWAPaymentReportApiError: ${error}");
      return;
    }
  }

  ///todo: all update Bank Detail...........12 june 2023
  static ChemistBankSeperateDetailApi(
    var AccountNo,
    var IFSCCode,
    var BranchName,
  ) async {
    var url = '${baseUrl}api/CommonApi/UpdateBank';
    //http://test.pswellness.in/api/CommonApi/UpdateBank
    //var url = '${baseUrl}api/ComplaintApi/CHUpdateBank';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var body = {
      "Login_Id": adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName,
    };
    print('AddPatientBodyggdd: ${body}');
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("BankDetailSuccessstdddt: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  ///todo: all franchise update Bank Detail...........3 august 2023
  static FranchiseBankSeperateDetailApi(
    var AccountNo,
    var IFSCCode,
    var BranchName,
  ) async {
    var url = '${baseUrl}api/CommonApi/UpdateBank';
    //http://test.pswellness.in/api/CommonApi/UpdateBank
    //var url = '${baseUrl}api/ComplaintApi/CHUpdateBank';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var body = {
      "Login_Id": adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName,
    };
    print('AddPatientBodyggdd: ${body}');
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("BankDetailSuccessstdddt: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Rwa Payment Report........
  static RWAPaymentReportApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var url = '${baseUrl}api/PatientApi/GetRWA_PaymentReport?RWA_Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final rwaPaymentReportModel = rwaPaymentReportModelFromJson(r.body);
        print(
            "RWAPaymentReportApiSuccess: ${rwaPaymentReportModel.rwaPaymentReport?[0].patientName}");
        return rwaPaymentReportModel;
      }
    } catch (error) {
      print("RWAPaymentReportApiError: ${error}");
      return;
    }
  }

  /// todo RWA Complain ............Rahul
  static RWAComplainApi(var Subject, var Complaints) async {
    var url = '${baseUrl}api/PatientApi/Add_RWAComplaint';
    var body = {
      "RWA_Id": "26",
      "Subjects": "$Subject",
      "Complaints": "$Complaints"
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo RWA Complain ........
  static RWAProfileApi(
    var AuthorityName,
    var LandlineNumber,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var EmailId,
    var PinCode,
  ) async {
    var url = '${baseUrl}api/PatientApi/UpdateRWA_Data';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var body = {
      "ID": userid,
      "AuthorityName": AuthorityName,
      "LandlineNumber": LandlineNumber,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "EmailId": EmailId,
      "PinCode": PinCode,
      //"ClinicName": clinicNameController,

      // "CertificateImage": "$CertificateImage",
      // "CertificateImagebase64": "$CertificateImagebase64"
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("RWAPROFILEAPI:5454 ${body}");
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo RWA Signup ............Rahul
  static RWASignupApi(
      var AuthorityName,
      var PhoneNumber,
      var MobileNumber,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var StateMaster_Id,
      var CityMaster_Id,
      var Location,
      var LandlineNumber,
      var Pincode,
      var CertificateImage) async {
    var url = '${baseUrl}api/SignupApi/SignUpRWA';
    var body = {
      "AdminLogin_Id": "1024",
      "AuthorityName": AuthorityName,
      "PhoneNumber": PhoneNumber,
      "MobileNumber": MobileNumber,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "LandlineNumber": LandlineNumber,
      "Pincode": Pincode,
      "CertificateImage": CertificateImage,
      "CertificateImagebase64": base64Code
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("RWASignupSuccess: ${r.body}");
      print("RWASignupSuccess: ${body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  ///todo: RWA banner Api for doctor.........
  static rwaBannerApi() async {
    var url = "${baseUrl}api/SignupApi/getBanner/?id=7";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        RwaBannerModel rrwaBannerModel = rwaBannerModelFromJson(r.body);
        // print("Rwabanner: ${rrwaBannerModel.bannerImageList?[0].bannerPath}");
        print("Rwabannerbody:${r.body}");
        return rrwaBannerModel;
      }
    } catch (error) {
      print("errrrrrr:${error}");
      return;
    }
  }

  ///nurse_serctio_prince....
  ///
  ///todo: nurse booking 2 api........27 april 2023...it will comment on 6 june...kumar prince
//
//   static Nursesebooking2Api(
//     var NurseId,
//     var ServiceDate,
//     var Slotid,
//   ) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     var NurseuserListId = preferences.getString("NurseuserListId");
//     print("nurseuserlistId: ${NurseuserListId}");
//
//     var prefs = GetStorage();
//     //prefs.write(
//         //"nursebooking_Id".toString(), json.decode(r.body)['NurseBookingId']);
//     nursebooking_Id = prefs.read("nursebooking_Id").toString();
//     print('&&&&&&&&&&&&&&&&&nurse:${nursebooking_Id}’);
//     var url = baseUrl + 'api/NurseServices/NurseBookings';
//
//     var body = {
//       "Nurse_Id": "${NurseuserListId}",
//       "ServiceDate": ServiceDate,
//       "Slotid": Slotid,
//     };
//     print(body);
//     http.Response r = await http.post(
//       Uri.parse(url), body: body,
//       //headers: headers
//     );
//     print(r.body);
//     if (r.statusCode == 200) {
//       print("nurseeeaa:${body}");
//       // var prefs = GetStorage();
//       //saved id..........
//       //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
//       // Id = prefs.read("Id").toString();
//       // print('&&&&&&&&&&&&&&nursebookingId:${Id}');
//       ///
//       // //saved token.........
//       // prefs.write("token".toString(), json.decode(r.body)['token']);
//       // token = prefs.read("token").toString();
//       // print(token);
//       return r;
//     } else if (r.statusCode == 401) {
//       Get.snackbar('message', r.body);
//     } else {
//       Get.snackbar('Error', r.body);
//       return r;
//     }
//   }
  ///

  ///todo nurse list detail...18april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static NursListApi() async {
    var url = "${baseUrl}api/NurseAPI/getNurseList?cityid=67";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseListbycityId? nurseListbycityId =
            nurseListbycityIdFromJson(r.body);
        return nurseListbycityId;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: nurse......details........18 april....

  static NursDetailApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistId: ${NurseuserListId}");
    var url = "${baseUrl}api/NurseAPI/NurseDetails?id=$NurseuserListId";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        // NursedetailbyId? nursedetailbyId =
        // nursedetailbyIdFromJson(r.body);
        var nursedetailbyId = nursedetailbyIdFromJson(r.body);
        print('############nurse123: ${nursedetailbyId.nurseName}');
        return nursedetailbyId;
      }
    } catch (error) {
      print("okokokocnurseeee:${error}");
      return;
    }
  }

  ///time slots Api get...........................26 april 2023.....slot........

  static Future<List<TimeSlot>?> gettimeslotApi() async {
    var url = "${baseUrl}api/CommonApi/TimeSlot";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var timeslotData = timeSlotsFromJson(r.body);
        return timeslotData.timeSlots;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///time slots duration Api get...........................27 feb 2024.....slot........

  static Future<List<DurationSlot>?> gettimeslotDurationsApi() async {
    var url = "${baseUrl}api/DoctorApi/DurationDropdown";
    //http://pswellness.in/api/DoctorApi/DurationDropdown
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var timesduration = timeDurationSlotFromJson(r.body);
        return timesduration.durationSlot;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///time slots franchise Id Api get...........................28 feb 2024.....slot........

  static Future<List<Vendor>?> getfranchiseDurationsApi() async {
    var url = "${baseUrl}api/DoctorApi/FranchiseDropdown";
    //http://pswellness.in/api/DoctorApi/DurationDropdown
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var franchiseid = franchiseIdSelectFromJson(r.body);
        return franchiseid.vendor;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///time slots weekly off Api get...........................28 feb 2024.....slot........

  static Future<List<Day>?> getweekoffApi() async {
    var url = "${baseUrl}api/DoctorApi/DaysDropdown";
    //http://pswellness.in/api/DoctorApi/DurationDropdown
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var weekdayid = weekAbsentSelectFromJson(r.body);
        return weekdayid.days;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///
//todo Chemist///////////..
  /// todo Chemist Order History
  static chemistOrderHistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${userid}');
    //http://test.pswellness.in/api/ChemistApi/chemisthistory?Id=18
    var url = '${baseUrl}api/ChemistApi/chemisthistory?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final chemistOrderHistory = chemistOrderHistoryFromJson(r.body);
        print('ChemistOrderHistor: ${r.body}');
        print('ChemistOrderHistorrrrrrr: ${url}');
        print(
            "ChemistOrderHistoryRRR: ${chemistOrderHistory.chmi1?[0].id.toString()}");
        return chemistOrderHistory;
      }
    } catch (error) {
      print('ChemistOrderHistoryRRRError: ${error}');
      return;
    }
  }

  // todo Chemist Payment History
  static chemistPaymentHistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${userid}');
    var url = '${baseUrl}api/ChemistApi/paymenthistory?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final chemistPaymentHistory = chemistPaymentHistoryFromJson(r.body);
        print(
            "ChemistOrderHistoryRRR: ${chemistPaymentHistory.pay?[0].amount}");
        return chemistPaymentHistory;
      }
    } catch (error) {
      print('ChemistOrderHistoryRRRError: ${error}');
      return;
    }
  }

  /// todo Chemist Profile Detail..........
  // static chemistProfileDetailApi() async {
  //   var prefs = GetStorage();
  //   adminId = prefs.read("AdminLogin_Id").toString();
  //   userid = prefs.read("userid").toString();
  //   print('&&&&&&&&&&&&&&&&&&&&&&eee:${adminId}');
  //   print('&&&&&&&&&&&&&&&&&&&&&&eeedddeee:${userid}');
  //
  //   var url = '${baseUrl}api/ChemistApi/chemistprofiledetail?id=$userid';
  //   //'$userid'; //22
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     if (r.statusCode == 200) {
  //       print("urrllllrrr:${url}");
  //       final chemistProfileDetail = chemistProfileDetailFromJson(r.body);
  //       print("ChemistProfileDetail: ${chemistProfileDetail.chemistName}");
  //       return chemistProfileDetail;
  //     }
  //   } catch (error) {
  //     print('ChemistProfileDetailRRRErrorrr: ${error}');
  //     return;
  //   }
  // }

  // todo Chemist Payout History
  static chemistPayoutHistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${userid}');
    //http://test.pswellness.in/api/ChemistApi/payouthistory?Id=18
    var url = '${baseUrl}api/ChemistApi/payouthistory?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final chemistPayout = chemistPayoutFromJson(r.body);
        print('ChemistPayoutSuccess: ${chemistPayout.payout?[0].chemistName}');
        return chemistPayout;
      }
    } catch (error) {
      print('ChemistPayoutRRRError: ${error}');
      return;
    }
  }

  /// todo Chemist Update Profile ............
  static ChemistUpdateProfileApi(
    // var id,
    var ShopName,
    var MobileNumber,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    //var AdminLogin_Id,
    var PinCode,
    var EmailId,
    // var AccountNo,
    // var IFSCCode,
    // var BranchName
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&cemist:${userid}');
    print(userid);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&cemist:${userid}');
    print(userid);
    var url = '${baseUrl}api/ChemistApi/UpdateProfilebyChemist';
    var body = {
      "id": userid,
      "ShopName": ShopName,
      "MobileNumber": MobileNumber,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "AdminLogin_Id": adminId,
      "PinCode": PinCode,
      "EmailId": EmailId,
      //"AccountNo": AccountNo,
      //"IFSCCode": IFSCCode,
      //"BranchName": BranchName
    };
    print("ChemistBody: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("ChemistUpdateProfileSuccess: ${body}");
      print("ChemistUpdateProfileSuccess: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Chemist Manage Profile ............Rahul.....
  static ChemistManageProfileApi(
      var Id,
      var ChemistName,
      var ShopName,
      var StateMaster_Id,
      var CityMaster_Id,
      var Location,
      var GSTNumber,
      var LicenceNumber,
      var LicenceImage,
      var LicenceImageBase64) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&update:${userid}');
    print(userid);
    var url = '${baseUrl}api/ChemistApi/ManageProfile';
    var body = {
      "Id": userid,
      "ChemistName": ChemistName,
      "ShopName": ShopName,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "GSTNumber": GSTNumber,
      "LicenceNumber": LicenceNumber,
      "LicenceImage": LicenceImage,
      "LicenceImageBase64": "$LicenceImageBase64"
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("bodychemist:${body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Chemist Update bank Detail............Rahul......
  static ChemistUpdateBankDetailApi(
      var AccountNo, var IFSCCode, var BranchName) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&backdetailchemist:${userid}');
    print(userid);
    var url = '${baseUrl}api/ComplaintApi/CHUpdateBank';
    var body = {
      "Login_Id": userid,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("yyyyuuuuurrree:${body}");
    if (r.statusCode == 200) {
      print("urrllll:${url}");
      print("yyyyuuuuu:${body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Chemist Complain............Rahul
  static ChemistComplainApi(var Subject, var Other, var Complain) async {
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("userid").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&rr:${adminId}');
    var url = '${baseUrl}api/ComplaintApi/Chemist_Complaint';
    var body = {
      "patsubid": Subject,
      "Others": Other,
      "Complaints": Complain,
      "Login_Id": adminId
    };
    print("ChemistComplainBody: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("ChemistComplainApi: ${body}");
      print("ChemistComplainApiSuccess: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Chemist Banner Api ...........Rahul
  static ChemistBannnerApi() async {
    var url = '${baseUrl}api/SignupApi/getBanner?id=8';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final chemistBannerModel = chemistBannerModelFromJson(r.body);
        return chemistBannerModel;
      }
    } catch (error) {
      print('ChemistBannerRRRError: ${error}');
      return;
    }
  }

  /// todo Chemist SignUp............
  static ChemistSignupApi(
      var PAN,
      var ChemistName,
      var ShopName,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var MobileNumber,
      var Location,
      var StateMaster_Id,
      var CityMaster_Id,
      var Certificateimg,
      var Certificateimgbase64,
      var LicenceNumber,
      var LicenseValidity,
      var PinCode) async {
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("userid").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');

    //userid
    var url = '${baseUrl}api/SignupApi/ChemistRegistration';
    var body = {
      "PAN": "$PAN",
      "ChemistName": ChemistName,
      "ShopName": ShopName,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "MobileNumber": MobileNumber,
      "Location": Location,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Certificateimg": '$Certificateimg',
      "Certificateimgbase64": '$Certificateimgbase64',
      "LicenceNumber": LicenceNumber,
      "LicenseValidity": LicenseValidity,
      "PinCode": PinCode,
    };
    print("ChemistComplainBody: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("ChemistSignupApi: ${body}");
      print("ChemistSignupApiSuccess: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Chemist about Api ...........Rahul
  static ChemistAboutApi() async {
    var url = '${baseUrl}api/SignupApi/getBanner?id=8';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final chemistBannerModel = chemistBannerModelFromJson(r.body);
        return chemistBannerModel;
      }
    } catch (error) {
      print('ChemistBannerRRRError: ${error}');
      return;
    }
  }

  ///todo:from here we have signup Api for RWA....31 may 2023 prince

  static RwaSignupApi(
    var PAN,
    var AuthorityName,
    var PhoneNumber,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var LandlineNumber,
    var Pincode,
    var CertificateNo,
    var CertificateImage,
    var CertificateImagebase64,
    //var Vendor_Id

    //var Patient_Id,
  ) async {
    var body = {
      "PAN": "$PAN",
      "AuthorityName": AuthorityName,
      "PhoneNumber": PhoneNumber,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "LandlineNumber": LandlineNumber,
      "Pincode": Pincode,
      "CertificateNo": CertificateNo,
      'CertificateImagebase64': '$CertificateImagebase64',
      'CertificateImage': '$CertificateImage',
      // "Vendor_Id": Vendor_Id
    };
    try {
      var url = '${baseUrl}api/SignupApi/SignUpRWA';
      var r = await http.post(Uri.parse(url), body: body);
      print("nlmknmkmk:${r.body}");
      print("###3###3####1rrrererttrrrrr: ${body}");
      if (r.statusCode == 200) {
        print("body3200:${body}");

        print("###3###3####1rwwwrr: ${r.body}");
        print('&&&&&&&&&&&&&&&&&&&&&&rwausewwwreportrerer:${userid}');
        //print("####userid: ${r.Patient_Id}");
        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
      print("###3###3####1error: ${e}");
    }
  }

  ///driver signup.........16 june....
  static DriverSignupApi(
    var PAN,
    var DriverName,
    var PinCode,
    var MobileNumber,
    var EmailId,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var DlNumber,
    var DlValidity,
    var Password,
    var ConfirmPassword,
    var DriverImage,
    var DriverImageBase64,
    var DlImage1,
    var DlImage1Base64,
    var DlImage2,
    var DlImage2Base64,
    var AadharImage,
    var AadharImageBase64,
    var AadharImage2,
    var AadharImage2Base64,
    var Vendor_Id,
    // var VehicleType_Id,
    ///var Paidamount,

    //var Patient_Id,
  ) async {
    var body = {
      "PAN": "$PAN",
      "DriverName": DriverName,
      "PinCode": PinCode,
      "MobileNumber": MobileNumber,
      "EmailId": EmailId,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "DlNumber": DlNumber,
      "DlValidity": DlValidity,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "DriverImage": "$DriverImage",
      "DriverImageBase64": "$DriverImageBase64",
      "DlImage1": "$DlImage1",
      "DlImage1Base64": "$DlImage1Base64",
      "DlImage2": "$DlImage2",
      "DlImage2Base64": "$DlImage2Base64",
      "AadharImage": "$AadharImage",
      "AadharImageBase64": "$AadharImageBase64",
      "AadharImage2": "$AadharImage2",
      "AadharImage2Base64": "$AadharImage2Base64",
      "Vendor_Id": "$Vendor_Id",
      // "VehicleType_Id": "null",
      ///"Paidamount": "$Paidamount"
    };
    try {
      var url = '${baseUrl}api/SignupApi/DriverRegistration';
      var r = await http.post(Uri.parse(url), body: body);
      print("nlmknmkmkdriveree:${r.body}");
      print("###3###3####1rrrererttrrrrrrttt: ${body}");
      if (r.statusCode == 200) {
        print("###3###3###200: ${body}");
        print("###3###3####1drriver22: ${r.body}");
        print('&&&&&&&&&&&&&&&&&&&&&driverrsq:${userid}');
        //print("####userid: ${r.Patient_Id}");
        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
      print("###3###3####1error: ${e}");
    }
  }

  // todo Rahul Frenchies .............. start
/////todo Frenchies Start
  /// todo Frechies Banner Api ...........Rahul
  /// todo Frechies Banner Api ...........Rahul
  static FrenchiesBannnerApi(String id) async {
    print("##################88: ${id}");
    var url = '${baseUrl}api/SignupApi/getBanner?id=2';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesBannerApiMode = frenchiesBannerApiModeFromJson(r.body);
        return frenchiesBannerApiMode;
      }
    } catch (error) {
      print('FrenchiesBannerRRRError: ${error}');
      return;
    }
  }

  /// todo Frenchies Edit Profile ............Rahul
  static FrenchiesEditProfileApi(
      var CompanyName,
      var StateMaster_Id,
      var City_Id,
      var Location,
      var GSTNumber,
      var MobileNumber,
      var AadharOrPANNumber,
      var AadharOrPANImage,
      String aadhar1imageAsBase64) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/EditProfile';
    var body = {
      "Id": "$Id",
      "VendorName": CompanyName,
      "StateMaster_Id": StateMaster_Id,
      "Location": City_Id,
      "City_Id": Location,
      "GSTNumber": GSTNumber,
      "MobileNumber": MobileNumber,
      "AadharOrPANNumber": AadharOrPANNumber,
      "AadharOrPANImage": AadharOrPANImage,
      "AadharOrPANImageBase64": aadhar1imageAsBase64
    };
    print("Frenchies body:: $body");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      print("Frenchies Edit profile: ${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Frenchies SignUp ............Rahul
  static FrenchiesSignUpApi(
      var VendorName,
      var CompanyName,
      var EmailId,
      var Password,
      var MobileNumber,
      var Location,
      var StateMaster_Id,
      var City_Id,
      var PinCode,
      var GSTNumber,
      var PanNumber,
      var AadharOrPANNumber,
      var AadharOrPANImage,
      var AadharOrPANImageBase64) async {
    var url = '${baseUrl}api/SignupApi/FranchiseRegistration';
    var body = {
      "VendorName": VendorName,
      "CompanyName": CompanyName,
      "EmailId": EmailId,
      "Password": Password,
      "MobileNumber": MobileNumber,
      "Location": Location,
      "StateMaster_Id": StateMaster_Id,
      "City_Id": City_Id,
      "PinCode": PinCode,
      "GSTNumber": GSTNumber,
      "PanNumber": PanNumber,
      "AadharOrPANNumber": AadharOrPANNumber,
      "AadharOrPANImage": AadharOrPANImage,
      "AadharOrPANImageBase64": AadharOrPANImageBase64, //base64Code
    };
    print("Frenchies Signupbody:: $body");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("Frenchies Signupbody2000:: $body");

      Get.snackbar(
        'Success',
        "${r.body}",
        duration: const Duration(seconds: 2),
      );
      print("Frenchies SignupApi: ${r.body}");
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar(
        'message',
        "${r.body}",
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "Failed",
        "${r.body}",
        duration: const Duration(seconds: 2),
      );
      return r;
    }
  }

  /// todo Frenchies Add Gallery ............Rahul
  static FrenchiesAddGalleryApi(var ImageName, var Images, var base) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("userid").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&wewe:${adminId}');
    print('&&&&&&&&&&&&&&&&&&&&&&usersds:${userid}');
    var url = '${baseUrl}api/FranchisesApi/Add_Gallery';
    var body = {
      "ImageName": "$ImageName",
      "Images": '$Images',
      "Imagesbase64": "$base",
      "Franchise_Id": "$Id"
    };
    print("Frenchies Add Gallery body: $body");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      print("Frenchies Add Gallery : ${r.body}");
      print("Frenchiesid:${userid}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  ///Todo Get Gallery
  static FrenchiesGetGalleryApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Get_Gallery?Id=$Id';
    //http://test.pswellness.in/api/FranchisesApi/Get_Gallery?Id=28
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print('Frenchurl: ${url}');
        final franchiseGetGallery = franchiseGetGalleryFromJson(r.body);
        return franchiseGetGallery;
      }
    } catch (error) {
      print('FrenchiesBannerRRRError: ${error}');
      return;
    }
  }

  /// todo Frenchies Test List .............Rahul
  static FrenchiesTestListApi() async {
    var url = '${baseUrl}api/FranchisesApi/Test_List';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesTestList = frenchiesTestListFromJson(r.body);
        return frenchiesTestList;
      }
    } catch (error) {
      print('Frenchies Test ListError: ${error}');
      return;
    }
  }

  /// todo Frenchies Payout Report .............Rahul
  static FrenchiesPayoutReportApi() async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_PayoutHistory?Id=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesPayoutReportModel =
            frenchiesPayoutReportModelFromJson(r.body);
        return frenchiesPayoutReportModel;
      }
    } catch (error) {
      print("FrenchiesPayoutReportApi : $error");
      return;
    }
  }

  /// todo Frenchies Profile Detail ...........
  static FrenchiesProfileDetailApi() async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_ProfileDetail?Id=${Id}';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("frdetail:$url");
        final frenchiesProfileDetailModel =
            frenchiesProfileDetailModelFromJson(r.body);
        return frenchiesProfileDetailModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo Frenchies Edit Test List ............Rahul....pending
  static FrenchiesEditTestApi(var TestName) async {
    var url = '${baseUrl}api/FranchisesApi/EditTestList';
    var body = {"Id": "643", "TestName": TestName};
    print("Frenchies Edit Test List: $body");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      print("Frenchies Edit Test ListSuccess : ${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Franchise_Complaint ............Rahul....
  static Franchise_ComplaintApi(
      var patsubid, var Others, var Complaints) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/ComplaintApi/Franchise_Complaint';
    var body = {
      "patsubid": patsubid,
      "Others": Others,
      "Complaints": Complaints,
      "Login_Id": "$Id", //"1212"
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      print("Frenchies Complaint : ${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Franchies Update Bank Detail.......Rahul
  static FranchiseUpdateBankApi(var HolderName, var mobile, var Location,
      var AccountNo, var IFSCCode, var BranchName) async {
    //Id = prefs.read("Id").toString();
    var prefs = GetStorage();
    AdminLoginId = prefs.read("AdminLoginId").toString();

    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');
    var url = '${baseUrl}api/SignupApi/Franchises_UpdateBank';
    var body = {
      "HolderName": HolderName,
      "MobileNumber": mobile,
      "BranchAddress": Location,
      "Login_Id": "$adminId",
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("Frenchies Update bank: ${body}");
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      print("Frenchies Update bankSuccess: ${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  ///Department Id Api get........Dropdown...................Rahul
  static Future<List<FranchiseDepartment>> getDepartmentApi() async {
    var url = "${baseUrl}api/FranchisesApi/Fra_DepartmentDropdown";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print("DepartmentDropDownData: ${r.body}");
      if (r.statusCode == 200) {
        final departmentsDwModel = departmentsDwModelFromJson(r.body);
        print("DepartmentDropDownData: ${departmentsDwModel.department}");
        return departmentsDwModel.department;
      } else {
        return [];
      }
    } catch (error) {
      print("DepartmentDropDownDataError: $error");
      return [];
    }
  }

  /// Specialist Id_api.....dropdown...... Rahul
  static Future<List<FranchiseSpecialist>> getSpecialistApi(
      String stateID) async {
    var url =
        "${baseUrl}api/FranchisesApi/Fra_SpecialistDropdown_By_DepID?dep_Id=$stateID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        final specialistDwModel = specialistDwModelFromJson(r.body);
        return specialistDwModel.specialist;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo Dept&Spec post Api ............Rahul
  static addDeptSpecApi(var deptId, var specId) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("userid").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&wewwsadaqewqee:${adminId}');
    print('&&&&&&&&&&&&&&&&&&&&&asdsa&useasdrsds:${userid}');
    AdminLoginId = prefs.read("AdminLoginId").toString();
    print("add DepartSpecApi: ${AdminLoginId}");
    var url = '${baseUrl}api/FranchisesApi/AddDepartment';
    final body = {
      "Dep_Id": "$deptId",
      "Spec_Id": "$specId",
      "AdminLogin_Id": "$adminId"
    };
    print("body12345: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
    }
    if (r.statusCode == 400) {
      Get.snackbar("Failed", "${r.body}");
    }
  }

  /// Specialist Id_api...........
  /// todo Frenchies Dept & Spec List .............Rahul
  static FrenchiesDeptSpecListApi() async {
    var url = '${baseUrl}api/FranchisesApi/DepartmentList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesDepartmentListModel =
            frenchiesDepartmentListModelFromJson(r.body);
        return frenchiesDepartmentListModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo Frenchies Dept & Spec List2 .......Rahul
  static FrenchiesDeptSpecList2Api() async {
    // SharedPreferences p = await SharedPreferences.getInstance();
    //var vvr1=p.getString("key");
    // print("vvr1 : $vvr1");
    //var prefs = GetStorage();
    // AdminLoginId = prefs.read("AdminLoginId").toString();
    // print("Admin:${AdminLoginId}");
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("userid").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&wewwsadaqewqee:${adminId}');
    print('&&&&&&&&&&&&&&&&&&&&&asdsa&useasdrsds:${userid}');

    var url = '${baseUrl}api/FranchisesApi/Dept_spec_List?Id=$adminId';
    // print("urlvvr1: ${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("URL: ${url}");
        // Get.snackbar("Success", " Department Successfully Added",
        //     duration: Duration(seconds: 3));

        final deptSpecListModel = deptSpecListModelFromJson(r.body);
        print("Admin12:${deptSpecListModel.deptspecList?[0].specialistName}");
        return deptSpecListModel;
      } else {
        //Get.snackbar("Message", "Department Already added",
        //duration: Duration(seconds: 3));
      }
    } catch (error) {
      print("error:${error}");
      return;
    }
  }

  /// todo FrenchiesDeleteGallery .........Rahul
  static FrenchiesDeleteGallery(id) async {
    var url = '${baseUrl}api/FranchisesApi/DeleteGallery?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      Get.snackbar("Deleted", "item deleted");
    } else {}
  }

  /// todo FrenchiesDeleteDepartment .........Rahul
  static FrenchiesDeleteDepartment(id) async {
    var url = '${baseUrl}api/FranchisesApi/DeleteDepartment?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      Get.snackbar("Deleted", "item deleted");
    } else {}
  }

  ///todo FrenchiesEditDepartment...........Rahul
  static FrenchiesEditDepartment(id, DepName) async {
    var url = '${baseUrl}api/FranchisesApi/EditDepartment';
    http.Response r = await http.post(Uri.parse(url),
        body: {"Id": "$id", "Departmentname": "$DepName"});
    if (r.statusCode == 200) {
      print("FrenchiesGallery Edited1: ${r.body}");
      Get.snackbar("Success", "${r.body}");
    } else {
      print("FrenchiesGallery Not Edited:");
    }
  }

  ///todo FrenchiesDepartment...........Rahul
  static FrenchiesAddDepartment(String name) async {
    var url = '${baseUrl}api/FranchisesApi/AddDepartment_ByList';
    var body = {"DepartmentName": "$name"};
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
      Get.to(DeptAndSpecialistView());
    } else {}
  }

  /// todo FrenchiesDeleteTestList......Rahul
  static FrenchiesDeleteTestList(id) async {
    print("rfrenchiesDeleteGallery&&&&&&&: ${id}");
    var url = '${baseUrl}api/FranchisesApi/DeleteTestList?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      print("FrenchiesGallery Deleted:");
      Get.snackbar("Deleted", "item deleted");
    } else {
      print("FrenchiesGallery Not Deleted:");
    }
  }

  /// todo FrenchiesEditTestList..........Rahul
  static FrenchiesEditTestList(id, TestName) async {
    var body = {"Id": "$id", "TestName": "$TestName"};
    var url = '${baseUrl}api/FranchisesApi/EditTestList';
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
    } else {}
  }

  /// todo Frenchies Edit Profile .........Rahul
  static FrenchiesEditProfile(CompanyName, MobileNumber, StateId, CityId,
      Location, PinCode, VendorName, EmailId) async {
    Id = prefs.read("Id").toString();
    var body = {
      "Id": "$Id",
      "CompanyName": CompanyName,
      "MobileNumber": MobileNumber,
      "StateMaster_Id": StateId,
      "City_Id": CityId,
      "Location": Location,
      "PinCode": PinCode,
      "VendorName": "$VendorName",
      "EmailId": "$EmailId"
    };
    var url = '${baseUrl}api/FranchisesApi/Fra_EditProfile';
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("FrenchiesEditProfile##: ${body}");
      Get.snackbar("Success", "${r.body}");
    } else {}
  }

  /// todo Frenchies Edit Chemist Detail Api ..........Rahul
  static FrenchiesEditChemistDetail(
      var id,
      var ChemistName,
      var ShopName,
      var MobileNumber,
      var EmailId,
      var Location,
      var GSTNumber,
      var LicenceNumber) async {
    final body = {
      "Id": "$id",
      "ChemistName": "$ChemistName",
      "ShopName": "$ShopName",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "Location": "$Location",
      "GSTNumber": "$GSTNumber",
      "LicenceNumber": "$LicenceNumber"
    };
    var url = '${baseUrl}api/FranchisesApi/Fra_EditChemRegDetail';
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("FrenchiesEditChemistDetail: ${body}");
    if (r.statusCode == 200) {
      print("###########333333333#########33#${r.body}");
      Get.snackbar("Success", "Item Edited");
    }
  }

  /// todo Frenchies Delete Chemist Registration Detail..........Rahul
  static FrenchiesDeleteChemistDetail(id) async {
    var url = '${baseUrl}api/FranchisesApi/Fra_DeleteChemistRegDetail?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      print("Chemist Detail Deleted:");
      Get.snackbar("Deleted", "Item Deleted");
    } else {}
  }

  ///todo Frenchies Delete NurseDetailApi ...........
  static FrenchiesDeleteNurseDetailApi(id) async {
    var url = '${baseUrl}api/FranchisesApi/Fra_DeleteNurseRegDetail?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      Get.snackbar("Deleted", "Item Deleted");
    } else {}
  }

  ///todo FrenchiesDeleteLabDetailApi .....
  static FrenchiesDeleteLabDetailApi(id) async {
    var url = '${baseUrl}api/FranchisesApi/Fra_DeleteLabRegDetail?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      Get.snackbar("Deleted", "Item Deleted");
    } else {}
  }

  /// todo  FrenchiesRWADetailApi ........
  static FrenchiesRWADetailApi() async {
    var url = '${baseUrl}api/FranchisesApi/Fra_RWARegistrationDetail';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesRwaDetailModel = frenchiesRwaDetailModelFromJson(r.body);
        return frenchiesRwaDetailModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo Frenchies RWA Detail Api ..............Rahul
  static FrenchiesDeleteRWADetailApi(id) async {
    var url = '${baseUrl}api/FranchisesApi/Fra_DeleteRWARegDetail?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      Get.snackbar("Deleted", "Item Deleted");
    } else {}
  }

  /// todo Frenchies Payment Report Api .......prince...
  static FrenchiesPaymentReportApi(String p) async {
    Id = prefs.read("Id").toString();

    var url =
        '${baseUrl}api/FranchisesApi/PaymentHistories_ByRole?Role=$p&VendorId=$Id';
    print("FrenchiesPaymentReportUrl:${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesPaymentReportModel =
            frenchiesPaymentReportModelFromJson(r.body);
        print(
            "FrenchiesPaymentReport: ${frenchiesPaymentReportModel.paymentHistory}");
        return frenchiesPaymentReportModel;
      }
    } catch (error) {}
  }

  /// todo Frenchies Role DropDown .........Rahul
  static Future<List<Role>> FrenchiesPaymentRole() async {
    var url = "${baseUrl}api/FranchisesApi/GetRole";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesRoleModel = frenchiesRoleModelFromJson(r.body);
        return frenchiesRoleModel.role;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo Frenchies Edit Nurse Detail Api ..........Rahul
  static FrenchiesEditNurseDetail(var id, var name, var MobileNumber,
      var EmailId, var Location, var CNumber) async {
    final body = {
      "Id": "$id",
      "NurseName": "$name",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "Location": "$Location",
      "CertificateNumber": "$CNumber"
    };
    var url = '${baseUrl}api/FranchisesApi/Fra_EditNurseRegDetail';
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("FrenchiesEditNurseDetail: ${body}");
    if (r.statusCode == 200) {
      print("###########333333333#########33#${r.body}");
      Get.snackbar("Success", "Item Edited");
    }
  }

  /// todo Frenchies Edit RWA Detail Api ..........Rahul
  static FrenchiesEditRWADetail(var id, var name, var Phone, var MobileNumber,
      var EmailId, var Location, var CNumber) async {
    final body = {
      "Id": "$id",
      "AuthorityName": "$name",
      "PhoneNumber": "$Phone",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "Location": "$Location",
      "CertificateNo": "$CNumber"
    };
    print("FrenchiesEditRWADetail: ${body}");
    var url = '${baseUrl}api/FranchisesApi/Fra_EditRWARegDetail';
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "Item Edited");
    }
  }

  /// todo Frenchies Edit Lab Detail Api ..........Rahul
  static FrenchiesEditLabDetail(var id, var name, var Phone, var MobileNumber,
      var EmailId, var Location, var GST, var Licence, var Aadhar) async {
    final body = {
      "Id": "$id",
      "LabName": "$name",
      "PhoneNumber": "$Phone",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "Location": "$Location",
      "GSTNumber": "$GST",
      "LicenceNumber": "$Licence",
      "AadharNumber": "$Aadhar"
    };
    var url = '${baseUrl}api/FranchisesApi/Fra_EditLabRegDetail';
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "Item Edited");
    }
  }

  /// todo Frenchies Vehicle Category DropDown ....... Rahul
  static Future<List<VehicleCatDropdown>> getVehicleCategoryApi() async {
    var url = '${baseUrl}api/FranchisesApi/Fra_vehicleCat_dropdown';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesVehicleCategoryModel =
            frenchiesVehicleCategoryModelFromJson(r.body);
        return frenchiesVehicleCategoryModel.vehicleCatDropdown;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo get_VehicleType_api..........
  static Future<List<VehicleTypeName>> getVehicleTypeApi(String catID) async {
    var url = "${baseUrl}api/FranchisesApi/Fra_VehicleType_By_cat?Id=$catID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        final frenchiesVehicleTypeModel =
            frenchiesVehicleTypeModelFromJson(r.body);
        return frenchiesVehicleTypeModel.vehicleTypeName;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo Registration, Register Vehicle.............prince,.....
  static FrenchiesRegisterVehicle(
      var PAN,
      var name,
      var number,
      var accountNo,
      //var DriverCharges,
      var holderName,
      var VcatId,
      var VtypeId,
      var ifsc,
      var VehicleOwnerName
      //  var img,
      //String imageAsBase64
      ) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_VehicleRegistration';
    final body = {
      "PAN": "$PAN",
      "VehicleName": "$name",
      "VehicleNumber": "$number",
      "AccountNo": "$accountNo",
      // "DriverCharges": "$DriverCharges",
      "AccountHolderName": "$holderName",
      "VehicleCat_Id": "$VcatId",
      "VehicleType_Id": "$VtypeId",
      "IFSCCode": "$ifsc",
      // "CancelCheque": "$img",
      //"CancelChequeBase64": "$imageAsBase64",
      "Vendor_Id": "$Id",
      "VehicleOwnerName": "$VehicleOwnerName"
    };
    print("FrenchiesVehicleRegister: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Successs", "${r.body}");
    }
  }

  ///todo  Register Driver..............Rahul
  static FrenchiesRegisterDriver(
    var PAN,
    var name,
    var EmailId,
    var password,
    var confirmPassword,
    var mobileNumber,
    var location,
    var DlNumber,
    var DlValidity,
    var stateId,
    var cityId,
    var DlImage1,
    var DlImage1Base64,
    var DlImage2,
    var DlImage2Base64,
    var AadharImage,
    var AadharImageBase64Image,
    var AadharImage2,
    var AadharImage2base64Image,
    var PinCode,
    var DriverImage,
    var DriverImageBase64,
  ) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_DriverRegistration';
    final body = {
      "PAN": "$PAN",
      "DriverName": "$name",
      "Password": "$mobileNumber",
      //password
      "ConfirmPassword": "$EmailId",
      //confirmPassword
      "MobileNumber": "$password",
      //mobileNumber
      "Location": "$location",
      "DlNumber": "$DlNumber",
      "StateMaster_Id": "$stateId",
      "CityMaster_Id": "$cityId",
      "DlImage1": "$DlImage1",
      "DlImage1Base64": "$DlImage1Base64",
      "DlImage2": "$DlImage2",
      "DlImage2Base64": "$DlImage2Base64",
      "AadharImage": "$AadharImage",
      "AadharImageBase64Image": "$AadharImageBase64Image",
      "AadharImage2": "$AadharImage2",
      "AadharImage64Image1": "$AadharImage2base64Image",
      "Vendor_Id": "$Id",
      "DriverImage": "$DriverImage",
      //"$DriverImage",
      "DriverImageBase64": "$DriverImageBase64",
      "PinCode": "$PinCode",
      "EmailId": "$confirmPassword",
      //EmailId
      "DlValidity": "$DlValidity"
      //var DriverImage,
      //       var DriverImageBase64,
    };
    print("FrenchiesDoctorRegister: ${body}");
    print("PinCode: ${PinCode}");
    print("DlImage1: ${DlImage1}");
    print("DlImage2: ${DlImage2}");
    print("AadharImage: ${AadharImage}");
    print("AadharImage2: ${AadharImage2}");
    print("PAN: ${PAN}");
    print("DriverName: ${name}");
    print("Password: ${password}");
    print("mobileNumber: ${mobileNumber}");
    print("DlNumber: ${DlNumber}");
    print("EmailId: ${EmailId}");
    print("DlValidity: ${DlValidity}");

    print("FrenchiesDoctorRegisterree1: ${Id}");
    print("DriverImageBase64: $DriverImageBase64");
    print("AadharImageBase64Image: $AadharImageBase64Image");
    print("DlImage2Base64: ${DlImage2Base64}");
    print("DlImage1Base64: ${DlImage1Base64}");
    print("FrenchiesDoctorRegisterree0: ${PinCode}");
    print("FrenchiesDoctorRegisterree2: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("PinCode: ${PinCode}");
      print("DlImage1: ${DlImage1}");
      print("DlImage2: ${DlImage2}");
      print("AadharImage: ${AadharImage}");
      print("AadharImage2: ${AadharImage2}");
      print("PAN: ${PAN}");
      print("DriverName: ${name}");
      print("Password: ${password}");
      print("mobileNumber: ${mobileNumber}");
      print("DlNumber: ${DlNumber}");
      print("FrenchiesDoctorRegisterree1: ${Id}");
      print("DriverImageBase64: $DriverImageBase64");
      print("AadharImageBase64Image: $AadharImageBase64Image");
      print("DlImage2Base64: ${DlImage2Base64}");
      print("DlImage1Base64: ${DlImage1Base64}");
      print("FrenchiesDoctorRegisterree0: ${PinCode}");
      print("FrenchiesDoctorRegisterree2: ${body}");
      Get.snackbar("Successs", "${r.body}");
    }
  }

  ///todo Register Doctor..................26_august....
  static FrenchiesRegisterDoctor(
    var PAN,
    var DoctorName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var PhoneNumber,
    var ClinicName,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var LicenceImage,
    var LicenceBase64,
    var LicenceNumber,
    var LicenseValidity,
    var PinCode,
    var PanImage,
    var PanImageBase64,
    var SlotTime,
    TimeOfDay? startTime,
    TimeOfDay? EndTime,
    var SlotTime2,
    TimeOfDay? StartTime2,
    TimeOfDay? EndTime2,
    var Experience,
    var Department_Id,
    var Specialist_Id,
    var Fee,
    var Qualification,
    var RegistrationNumber,
    var SignaturePic,
    var SignaturePicBase64,
    var Day_Id,
    var VirtualFee,
    var About,
  ) async {
    Id = prefs.read("Id").toString();
    final url = '${baseUrl}api/FranchisesApi/fra_DoctorRegistration';
    String formattedTime =
        '${startTime?.hour.toString().padLeft(2, '0')}:${startTime?.minute.toString().padLeft(2, '0')}:00.0000000';
    print('Frenchies122: ${formattedTime}');

    String formattedTime1 =
        '${EndTime?.hour.toString().padLeft(2, '0')}:${EndTime?.minute.toString().padLeft(2, '0')}:00.0000000';
    print('Frenc1: ${formattedTime1}');

    String formattedTime2 =
        '${StartTime2?.hour.toString().padLeft(2, '0')}:${StartTime2?.minute.toString().padLeft(2, '0')}:00.0000000';
    print('Frenchies122: ${formattedTime2}');

    String formattedTime3 =
        '${EndTime2?.hour.toString().padLeft(2, '0')}:${EndTime2?.minute.toString().padLeft(2, '0')}:00.0000000';
    print('Frenchies122: ${formattedTime3}');
    final body = {
      "PAN": "$PAN",
      "DoctorName": "$DoctorName",
      "EmailId": "$EmailId",
      "Password": "$Password",
      "ConfirmPassword": "$ConfirmPassword",
      "MobileNumber": "$MobileNumber",
      "PhoneNumber": "$PhoneNumber",
      "ClinicName": "$ClinicName",
      "StateMaster_Id": "$StateMaster_Id",
      "CityMaster_Id": "$CityMaster_Id",
      "Location": "$Location",
      "LicenceImage": "$LicenceImage",
      "LicenceBase64": "$LicenceBase64",
      "LicenceNumber": "$LicenceNumber",
      "LicenseValidity": "$LicenseValidity",
      "PinCode": "$PinCode",
      "PanImage": "$PanImage",
      "PanImageBase64": "$PanImageBase64",
      "SlotTime": "$SlotTime",
      "StartTime": formattedTime,
      //"01:50:00.0000000",
      "EndTime": formattedTime1,
      //"14:27:00.0000000",
      "SlotTime2": "$SlotTime2",
      "StartTime2": formattedTime2,
      //"14:27:00.0000000",
      "EndTime2": formattedTime3,
      //"18:24:00.0000000",
      "Vendor_Id": "$Id",
      "Experience": "$Experience",
      "Department_Id": "$Department_Id",
      "Specialist_Id": "$Specialist_Id",
      "Fee": "$Fee",
      "Qualification": "$Qualification",
      "RegistrationNumber": "$RegistrationNumber",
      "SignaturePic": "$SignaturePic",
      "SignaturePicBase64": "$SignaturePicBase64",
      "Day_Id": "$Day_Id",
      "VirtualFee": "$VirtualFee",
      "About": "$About"
    };

    print('FrenchiesRegisterDoctor1212: ${body}');

    print('FrenchiesRetimeqw: $formattedTime');
    print('FrenchiesRetimeqw1: $formattedTime1');
    print('FrenchiesRetimeqw2: $formattedTime2');
    print('FrenchiesRetimeqw3: $formattedTime3');

    print("ttf:${body}");

    final http.Response r = await http.post(Uri.parse(url), body: body);

    if (r.statusCode == 200) {
      print("ttftft66:${EndTime2}");
      print("ttftft662323:${Experience}");
      print("ttftftime1:${SlotTime}");
      print("ttftftime2:${SlotTime2}");
      print('FrenchiesRetimeqw22: $formattedTime');
      print('FrenchiesRetimeqw221: $formattedTime1');
      print('FrenchiesRetimeqw222: $formattedTime2');
      print('FrenchiesRetimeqw223: $formattedTime3');
      Get.snackbar("Successs", "${r.body}");
      Get.offAll(FranchiesHomePage());
    }
  }

  /// todo Register patient.................Rahul
  static FrenchiesRegisterPatient(
      var PatientName,
      var MobileNumber,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var Location,
      var stateId,
      var cityId,
      var DOB,
      var Gender,
      var pinCode) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_PatientRegistration';
    final body = {
      "PatientName": "$PatientName",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "Password": "$Password",
      "ConfirmPassword": "$ConfirmPassword",
      "Location": "$Location",
      "StateMaster_Id": "$stateId",
      "CityMaster_Id": "$cityId",
      "PinCode": "$pinCode",
      "vendorId": "$Id",
      "DOB": "$DOB",
      "Gender": "$Gender",
    };

    http.Response r = await http.post(Uri.parse(url), body: body);
    print("ttfpatient:${body}");
    if (r.statusCode == 200) {
      print("ttfpatient200:${body}");

      Get.snackbar("Success", "${r.body}");
    }
  }

  /// todo Frenchies Register Chemist
  static FrenchiesRegisterChemist(
      var PAN,
      var ChemistName,
      var ShopName,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var MobileNumber,
      var Location,
      var stateId,
      var cityId,
      var Certificateimg,
      var certificateBase64,
      var licenceNumber,
      var LicenseValidity,
      var PinCode) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_ChemistReg';
    final body = {
      "PAN": "$PAN",
      "ChemistName": "$ChemistName",
      "ShopName": "$ShopName",
      "EmailId": "$EmailId",
      "Password": "$Password",
      "ConfirmPassword": "$ConfirmPassword",
      "MobileNumber": "$MobileNumber",
      "Location": "$Location",
      "StateMaster_Id": "$stateId",
      "CityMaster_Id": "$cityId",
      "Certificateimg": "$Certificateimg",
      "Certificateimgbase64": "$certificateBase64",
      "LicenceNumber": "$licenceNumber",
      "LicenseValidity": "$LicenseValidity",
      "PinCode": "$PinCode",
      "Vendor_Id": "$Id",
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("FrenchiesRegisterChemist: ${body}");
    print("FrenchiesRegisterChemistvalidity: ${LicenseValidity}");
    print("FrenchiesRegisterChemistbunbbr: ${licenceNumber}");

    if (r.statusCode == 200) {
      print("Frenchies232323RegisterChemist: ${body}");
      print("FrenchiesRegisterChemistvalidity1: ${LicenseValidity}");
      print("FrenchiesRegisterChemistbunbbr2: ${licenceNumber}");
      Get.snackbar("Success", "${r.body}");
    }
  }

  /// todo Frenchies Register Nurse....................Rahul
  static FrenchiesRegisterNurse(
    var PAN,
    var NurseName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var Location,
    var stateId,
    var cityId,
    var Certificateimg,
    var certificateBase64,
    var CertificateNumber,
    var PinCode,
    var NurseType_Id,
    var fee,
    //var Location_id,
    var experience,
  ) async {
    print("NurseType : ${NurseType_Id}");
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_NurseRegistration';
    final body = {
      "PAN": "$PAN",
      "NurseName": "$NurseName",
      "EmailId": "$EmailId",
      "Password": "$Password",
      "ConfirmPassword": "$ConfirmPassword",
      "MobileNumber": "$MobileNumber",
      "Location": "$Location",
      "StateMaster_Id": "$stateId",
      "CityMaster_Id": "$cityId",
      "CertificateImage": "$Certificateimg",
      "CertificateBase64Image": "$certificateBase64",
      "CertificateNumber": "$CertificateNumber",
      "PinCode": "$PinCode",
      "NurseType_Id": "$NurseType_Id",
      "Fee": "$fee",
      "Location_id": "67",
      "Vendor_Id": "$Id",
      "experience": "$experience",
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("FrenchiesRegisterNurse: ${body}");
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}", duration: Duration(seconds: 3));
    } else {
      Get.snackbar("Failed", "${r.body}", duration: Duration(seconds: 3));
    }
  }

  /// todo Frenchies Register Lab....................Rahul
  static FrenchiesRegisterLab(
      var PAN,
      var LabName,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var MobileNumber,
      var Location,
      var stateId,
      var cityId,
      var PinCode,
      var LicenceNumber,
      var LicenceImage,
      var LicenceImageBase64,
      var PanImage,
      var PanImageBase64,
      var GSTNumber,
      var AadharNumber,
      var StartTime,
      var EndTime) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_LabRegistration';
    final body = {
      "PAN": "$PAN",
      "LabName": "$LabName",
      "EmailId": "$EmailId",
      "Password": "$Password",
      "ConfirmPassword": "$ConfirmPassword",
      "PhoneNumber": "$MobileNumber",
      "Location": "$Location",
      "StateMaster_Id": "$stateId",
      "CityMaster_Id": "$cityId",
      "PinCode": "$PinCode",
      "LicenceNumber": "$LicenceNumber",
      "LicenceImage": "$LicenceImage",
      "LicenceImageBase64": "$LicenceImageBase64",
      "PanImage": "$PanImage",
      "PanImageBase64": "$PanImageBase64",
      "GSTNumber": "$GSTNumber",
      "AadharNumber": "$AadharNumber",
      "StartTime": "14:27:00.0000000",
      //"$StartTime",
      "EndTime": "14:27:00.0000000",
      //"$EndTime",
      "Vendor_Id": "$Id"
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("FrenchiesRegisterLab: ${body}");
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}", duration: Duration(seconds: 3));
      //isLoading(false);
    } else {
      Get.snackbar("Failed", "${r.body}", duration: Duration(seconds: 3));
    }
  }

  static FrenchiesRegisterRWA(
      var PAN,
      var AuthorityName,
      var MobileNumber,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var CertificateImage,
      var CertificateImagebase64,
      var stateId,
      var cityId,
      var Location,
      var LandlineNumber,
      var Pincode) async {
    Id = prefs.read("Id").toString();
    var url = '${baseUrl}api/FranchisesApi/Fra_RWARegistration';
    final body = {
      "PAN": "$PAN",
      "AuthorityName": "$AuthorityName",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "Password": "$Password",
      "ConfirmPassword": "$ConfirmPassword",
      "CertificateImage": "$CertificateImage",
      "CertificateImagebase64": "$CertificateImagebase64",
      "StateMaster_Id": "$stateId",
      "CityMaster_Id": "$cityId",
      "Location": "$Location",
      "LandlineNumber": "$LandlineNumber",
      "Pincode": "$Pincode",
      "Vendor_Id": "$Id"
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    print("FrenchiesRegisterRWA: ${body}");
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}", duration: Duration(seconds: 4));
    }
  }

  /// todo Frenchies YMWDDoctorReportApi
  static FrenchiesYMWDDoctorReportApi(String role) async {
    Id = prefs.read("Id").toString();

    var url =
        '${baseUrl}api/FranchisesApi/GetDoctorReport_By_YMWD?Timeperiod=${role}&VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("okurldd${url}");
        final frenchiesYmdwDoctorModel =
            frenchiesYmdwDoctorModelFromJson(r.body);
        return frenchiesYmdwDoctorModel;
      }
    } catch (error) {}
  }

  /// todo Frenchies YMWDVehicleReportApi
  static FrenchiesYMWDVehicleReportApi(String role) async {
    Id = prefs.read("Id").toString();

    var url =
        '${baseUrl}api/FranchisesApi/GetVehicleReport_By_YMWD?Timeperiod=${role}&VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("okurlvehicle${url}");

        final frenchiesYmdwVehicleModel =
            frenchiesYmdwVehicleModelFromJson(r.body);
        return frenchiesYmdwVehicleModel;
      }
    } catch (error) {
      print("FrenchiesYMWDVehicleReportApi: ${error}");
    }
  }

  /// todo Frenchies YMWDLabReportApi
  static FrenchiesYMWDLabReportApi(String role) async {
    Id = prefs.read("Id").toString();

    var url =
        '${baseUrl}api/FranchisesApi/GetLabReport_By_YMWD?Timeperiod=${role}&VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("okurllab${url}");

        final frenchiesYmdwLabModel = frenchiesYmdwLabModelFromJson(r.body);
        return frenchiesYmdwLabModel;
      }
    } catch (error) {}
  }

  /// todo Frenchies YMWDNurseReportApi
  static FrenchiesYMWDNurseReportApi(String role) async {
    Id = prefs.read("Id").toString();

    var url =
        '${baseUrl}api/FranchisesApi/GetNurseReport_By_YMWD?Timeperiod=${role}&VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("okurnrs${url}");

        final frenchiesYmdwNurseModel = frenchiesYmdwNurseModelFromJson(r.body);
        return frenchiesYmdwNurseModel;
      }
    } catch (error) {}
  }

  /// todo Frenchies YMWDChemistReportApi
  static FrenchiesYMWDChemistReportApi(String role) async {
    Id = prefs.read("Id").toString();

    var url =
        '${baseUrl}api/FranchisesApi/GetChemistReport_By_YMWD?Timeperiod=${role}&VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("okurlchem${url}");

        final frenchiesYmdwChemistModel =
            frenchiesYmdwChemistModelFromJson(r.body);
        return frenchiesYmdwChemistModel;
      }
    } catch (error) {}
  }

  /// todo Add Vehicle type Post Api........
  static FrenchiesVehicleType(var CategoryId, var VehicleTypeId) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("userid").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&wewwsadaqewqee:${adminId}');
    print('&&&&&&&&&&&&&&&&&&&&&asdsa&useasdrsds:${userid}');

    AdminLoginId = prefs.read("AdminLoginId").toString();
    final body = {
      "Category_Id": "${CategoryId}",
      "VehicleType_Id": "${VehicleTypeId}",
      "AdminLogin_Id": "$adminId"
    };
    print("FrenchiesVehicleType: ${body}");
    var url = '${baseUrl}api/FranchisesApi/AddVehicle_type';
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("###########333333333#########33#${r.body}");
      Get.snackbar("Success", "${r.body}", duration: Duration(seconds: 2));
    } else {
      Get.snackbar("Success", "${r.body}", duration: Duration(seconds: 2));
    }
  }

  /// todo Frenchies YMWDChemistReportApi
  static FrenchiesAddVehicleListApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("userid").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&wewwewqee:${adminId}');
    print('&&&&&&&&&&&&&&&&&&&&&&useasdrsds:${userid}');
    print("$AdminLoginId");
    //AdminLoginId =  prefs.read("AdminLoginId");
    //  print("FrenchiesAddVehicleListApi:${AdminLoginId}");
    var url =
        '${baseUrl}api/FranchisesApi/AddedVehicleList?AdminLoginId=$adminId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesAddVehicleListModel =
            frenchiesAddVehicleListModelFromJson(r.body);
        print(
            "&&&&&&&&&&&&&&&&&&&&yuyy:${frenchiesAddVehicleListModel.vehicleList?[0].categoryName}");
        return frenchiesAddVehicleListModel;
      }
    } catch (error) {
      print("&&&&&&&&&&&&&&&&&&&&yuyy1:${error}");
    }
  }

  ///todo Frenchies Get Old Driver Update ...........
  static FrenchiesOldDriverUpdateApi(id, var vehicleNo, var driverName) async {
    var url = '${baseUrl}api/FranchisesApi/UpdateOldDriver';
    final body = {
      "Id": "$id",
      "VehicleNumber": "$driverName",
      "DriverName": "$vehicleNo"
    };
    print("FrenchiesOldDriverUpdateApi: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
    }
  }

  ///todo Frenchies Get New Driver Update .............
  static FrenchiesNewDriverUpdateApi(var driverName, id) async {
    var url = '${baseUrl}api/FranchisesApi/UpdateNewDriver';
    final body = {"DriverName": "$driverName", "Id": "$id"};
    print("qwertyui: ${body}");
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}");
    }
  }

  ///todo Frenchies delete Old Driver...............Rahul
  static FrenchiesDeleteOldDriverApi(id) async {
    var url = '${baseUrl}api/FranchisesApi/DeleteOldDriver?Id=$id';
    http.Response r = await http.post(Uri.parse(url));
    if (r.statusCode == 200) {
      Get.snackbar("Deleted", "Item Deleted");
    } else {}
  }

  /// add new vehicle.......franchise...

  static AddnewVehicleApi(
    var VehicleTypeName,
    var CategoryName,
  ) async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&labusdoctorr:${userid}');
    //nursebooking_Id = prefs.read("nursebooking_Id").toString();

    var url = '${baseUrl}api/FranchisesApi/AddVehCat_Type';
    var body = {
      "VehicleTypeName": "$VehicleTypeName",
      "CategoryName": "$CategoryName"
    };
    print('&&&&&&qwqw&:${body}');

    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('Success', r.body);

      print('&&&&&&&&&&:${r.body}');

      ///todo:nursebookingid.........5  june 2023....
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      print('qwstate:${r.statusCode}');

      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: update new driver.......franchise...20 march 2024....

  static UpdatenewDriverApi(
    var VehicleTypeId,
    var VehicleNumberId,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DrivernewListId = preferences.getString("DrivernewListId");
    print("DrivernewListId: ${DrivernewListId}");
    // var prefs = GetStorage();
    // userid = prefs.read("Id").toString();
    // print('&&&&&&frrrorr:${userid}');
    //DrivernewListId
    //nursebooking_Id = prefs.read("nursebooking_Id").toString();

    var url = '${baseUrl}api/FranchisesApi/VehicleAllotment';
    var body = {
      "DriverId": "$DrivernewListId",
      "VehicleTypeId": "$VehicleTypeId",
      "VehicleNumberId": "$VehicleNumberId"
    };
    print('&&fr&:${body}');

    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('Success', r.body);

      print('&&&&&&&&&&:${r.body}');

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      print('qwstate:${r.statusCode}');

      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: update old driver.......franchise...21 march 2024....

  static UpdateoldDriverApi(
    var DriverId,
    //var Id,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DriveroldListId = preferences.getString("DriveroldListId");
    print("DriveroldListId: ${DriveroldListId}");
    // var prefs = GetStorage();
    // userid = prefs.read("Id").toString();
    // print('&&&&&&frrrorr:${userid}');
    //DrivernewListId
    //nursebooking_Id = prefs.read("nursebooking_Id").toString();

    var url = '${baseUrl}api/FranchisesApi/SwapDriver';
    var body = {
      "DriverId": "$DriverId",
      "Id": "$DriveroldListId",
    };
    print('&&sdsdfr&:${body}');

    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('Success', r.body);

      print('&&&&&&&&&&:${r.body}');

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      print('qwstate:${r.statusCode}');

      Get.snackbar('Error', r.body);
      return r;
    }
  }

  /// todo update new driver Vehicle Id DropDown .......20 mar 2024....
  static Future<List<NewVehicleType>> getnewdriverVehicletypeApi() async {
    var url = '${baseUrl}api/CommonApi/GetVehicleType';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesVehicleCategoryModel = vehicleTypeIdddFromJson(r.body);
        return frenchiesVehicleCategoryModel.vehicleType;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo update new driver Vehicle number DropDown .......20 mar 2024....
  static Future<List<VehicleNumberListElement>> getVehicfornewdriverApi(
      String typeID) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&useffrrrrr:${Id}');
    //http://pswellness.in/api/CommonApi/GetVehicleNumberListByVehicleType?VehicleType_Id=1136&Vendor_Id=11
    var url =
        "${baseUrl}api/CommonApi/GetVehicleNumberListByVehicleType?VehicleType_Id=$typeID&Vendor_Id=$Id";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        final frenchiesVehicleNumberModel = vehicleNumberListFromJson(r.body);
        return frenchiesVehicleNumberModel.vehicleNumberList;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo update old driver Vehicle Id DropDown .......21 mar 2024....
  static Future<List<VehicleNumberListdrop>>
      getolddriverVehicletypeApi() async {
    var url = '${baseUrl}api/CommonApi/GetVehicleNumberListByVehicleType';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesVehicleCategoryModel =
            vehicleNumberListdropdownFromJson(r.body);
        return frenchiesVehicleCategoryModel.vehicleNumberList;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo update old driver Vehicle number DropDown .......21 mar 2024....
  static Future<List<VehicleNumberdetail>> getVehicforolddriverApi(
      String typeID) async {
    var url =
        "${baseUrl}api/FranchisesApi/GetDriverVehicleId?VehicleNumberId=$typeID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        final frenchiesVehicleNumberModel2 =
            vehicletypebyVehicleNoIdFromJson(r.body);
        return frenchiesVehicleNumberModel2.vehicleNumberdetail;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: fr doctor detail....3 apr 2024...PRINCE

  static FrenchiesDoctorDetailApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&wewwsadaqewqee:${adminId}');
    print('&&&&&&&&&&&&&&&&&&&&&asdsa&useasdrsds:${Id}');
    var url =
        '${baseUrl}api/FranchisesApi/Fra_DoctorRegistrationDetail?VendorId=$Id';
    //'10';
    //'api/FranchisesApi/Fra_DoctorRegistrationDetail';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesDoctorDetailModel =
            frenchiesDoctorDetailModelFromJson(r.body);
        print(
            "FrenchiesDoctorDetailApi0: ${frenchiesDoctorDetailModel.doctorRegDetail?[0].vendorName}");
        return frenchiesDoctorDetailModel;
      }
    } catch (error) {
      print("FrenchiesDoctorDetailApi1: ${error}");
      return;
    }
  }

  /// todo Frenchies Vehicle Detail .....3..apr.......Prince
  //http://pswellness.in/api/FranchisesApi/Fra_VehicleRegistrationDetail?VendorId=10

  static FrenchiesVehicleDetail() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&&&&&&sdrsds:${Id}');
    var url =
        '${baseUrl}api/FranchisesApi/Fra_VehicleRegistrationDetail?VendorId=$Id';
    //'api/FranchisesApi/Fra_VehicleRegistrationDetail';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesVehicleDetailModel =
            frenchiesVehicleDetailModelFromJson(r.body);
        return frenchiesVehicleDetailModel;
      }
    } catch (error) {
      print('FrenchiesVehicleDetail: ${error}');
      return;
    }
  }

  /// todo: FrenchiesNurseDetailApi ......prince....3..apr_2024
  static FrenchiesNurseDetailApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&nrss:${Id}');
    //http://pswellness.in/api/FranchisesApi/Fra_NurseRegistrationDetail?VendorId=10
    var url =
        '${baseUrl}api/FranchisesApi/Fra_NurseRegistrationDetail?VendorId=$Id';
    //'api/FranchisesApi/Fra_NurseRegistrationDetail';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesNurseDetailModel =
            frenchiesNurseDetailModelFromJson(r.body);
        return frenchiesNurseDetailModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: driver detail franchise........3 apr 2024......

  static FrenchiesDriverDetailApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&driver:${Id}');
    //http://pswellness.in/api/FranchisesApi/Fra_DriverRegistrationDetail?VendorId=10
    var url =
        '${baseUrl}api/FranchisesApi/Fra_DriverRegistrationDetail?VendorId=$Id';
    //'api/FranchisesApi/Fra_DriverRegistrationDetail';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesDriverDetailModel =
            frenchiesDriverDetailModelFromJson(r.body);
        return frenchiesDriverDetailModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo Frenchies PatientDetail..........prince...3apr 2024..
  static FrenchiesPatientDetailApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&user:${Id}');
    //http://pswellness.in/api/FranchisesApi/Fra_PatientRegistrationDetail?VendorId=10
    var url =
        '${baseUrl}api/FranchisesApi/Fra_PatientRegistrationDetail?VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesPatientDetailModel =
            frenchiesPatientDetailModelFromJson(r.body);
        return frenchiesPatientDetailModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo FrenchiesChemistDetailApi....Prince....4..apr...2024...
  static FrenchiesChemistDetailApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&chemist:${Id}');
    //http://pswellness.in/api/FranchisesApi/Fra_ChemistRegistrationDetail?VendorId=10
    var url =
        '${baseUrl}api/FranchisesApi/Fra_ChemistRegistrationDetail?VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesChemistDetailModel =
            frenchiesChemistDetailModelFromJson(r.body);
        print(
            "FrenchiesChemistDetailApi8: ${frenchiesChemistDetailModel.chemistRegDetail?[0].chemistName}");
        return frenchiesChemistDetailModel;
      }
    } catch (error) {
      print("FrenchiesChemistDetailApi: ${error}");
      return;
    }
  }

  ///todo FrenchiesLabDetailApi ...........5 april 2024...
  static FrenchiesLabDetailApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&chemist:${Id}');
    //http://pswellness.in/api/FranchisesApi/Fra_LabRegistrationDetail?VendorId=10
    var url =
        '${baseUrl}api/FranchisesApi/Fra_LabRegistrationDetail?VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesLabDetailModel = frenchiesLabDetailModelFromJson(r.body);
        return frenchiesLabDetailModel;
      }
    } catch (error) {}
  }

  /// todo Frenchies Commission Report .............4april....prince
  static FrenchiesCommissionReportApi(var role, var fDate, var tDate) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&user:${Id}');
    // var url = '${baseUrl}api/FranchisesApi/CommissionReports_ByRole?Role=${p}';
    //http://pswellness.in/api/FranchisesApi/CommissionReports_ByRole?Role=Doctor
    var fromDate = fDate;
    var toDate = tDate;
    print("Role: ${role}");
    print("FromDate: ${fDate}");
    print("toDate : ${toDate}");
    var url =
        '${baseUrl}api/FranchisesApi/GetCommissionData_ByToDateFromDate?Role=$role&FromDate=$fromDate&ToDate=$toDate&VendorId=$Id';
    print("Commission Url: ${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesCommissionReportModel =
            frenchiesCommissionReportModelFromJson(r.body);
        return frenchiesCommissionReportModel;
      }
    } catch (error) {
      print("Commission: ${error}");
    }
  }

  /// todo total commission amount .....4 april....Prince
  static FrenchiesTotalCommissionAmountApi(var p, var fDate, var tDate) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&user:${Id}');
    var url =
        '${baseUrl}api/FranchisesApi/TotalCommissionAmount_ByFromTodate?Role=$p&FromDate=$fDate&ToDate=$tDate&VendorId=$Id';
    print("FrenchiesTotalCommissionAmountApi: ${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesTotalCommissionModel =
            frenchiesTotalCommissionModelFromJson(r.body);
        return frenchiesTotalCommissionModel;
      }
    } catch (error) {}
  }

  /// todo Frenchies Commission Report .............4april....prince
  static FranchiesCommissionByRoleOnly(var role) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    //adminId = prefs.read("AdminLogin_Id").toString();
    //print('&&&&&&&&&&&&&&ee:${adminId}');
    print('&&&&&user:${Id}');
    // var url = '${baseUrl}api/FranchisesApi/CommissionReports_ByRole?Role=${p}';
    print("Rolerfff: $role");
    var url =
        '${baseUrl}api/FranchisesApi/CommissionReports_ByRole?Role=$role&VendorId=$Id';
    //http://pswellness.in/api/FranchisesApi/CommissionReports_ByRole?Role=Doctor
    //'api/FranchisesApi/GetCommissionData_ByToDateFromDate?Role=$role&FromDate=$fromDate&ToDate=$toDate';
    print("Commission Url by role: ${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesCommissionReportModelrole =
            frenchieCommisionReportModelbyRoleFromJson(r.body);
        return frenchiesCommissionReportModelrole;
      }
    } catch (error) {
      print("Commissionrole: ${error}");
    }
  }

  /// todo Frenchies TDS Report ...........6 apr 2024...prince
  static FrenchiesTDSReportByIdApi(var role) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&user:${Id}');
    print("Rolefrr: $role");
    //http://pswellness.in/api/FranchisesApi/TDSReports_ByRole?Role=Doctor&VendorId=12
    var url =
        '${baseUrl}api/FranchisesApi/TDSReports_ByRole?Role=$role&VendorId=$Id';
    //'api/FranchisesApi/TDSReports_ByRole?Role=${p}';
    print("FrenchiesTDsReportUrl:${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesTdsReportModel = frenchiesTdsReportModelFromJson(r.body);
        print(
            "FrenchiesTDSReporteerr: ${frenchiesTdsReportModel.tdsReport?[0].paidFees}");
        return frenchiesTdsReportModel;
      }
    } catch (error) {}
  }

  ///todo frenchies total TDS Amount................6 april 2024.......prince...
  static FrenchiesTotalTDSAmountApi(var p, var fDate, var tDate) async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&user:${Id}');
    print("Rolefrrsacsa: $p");
    http: //pswellness.in/api/FranchisesApi/TotalTDSAmount_ByFromTodate?Role=Doctor&FromDate=2024-01-01&ToDate=2024-05-02&VendorId=12
    var url =
        '${baseUrl}api/FranchisesApi/TotalTDSAmount_ByFromTodate?Role=$p&FromDate=$fDate&ToDate=$tDate&VendorId=$Id';
    print("Urtdsl:${url}");

    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesTotalTdsModel = frenchiesTotalTdsModelFromJson(r.body);
        return frenchiesTotalTdsModel;
      }
    } catch (error) {}
  }

  ///todo frenchies TDS List by date
  static FrenchiesTDSListByDateApi(var p, var fromDate, var toDate) async {
    var tDate = toDate;
    print("qwertyufrom: ${fromDate}");
    print("sdfgh:${tDate}");
    print("ppppppp:${p}");
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&user:${Id}');
    //http://pswellness.in/api/FranchisesApi/GetTDSData_ByToDateFromDate?Role=Doctor&FromDate=2024-01-01&ToDate=2024-04-02&VendorId=12
    var url =
        '${baseUrl}api/FranchisesApi/GetTDSData_ByToDateFromDate?Role=$p&FromDate=$fromDate&ToDate=$tDate&VendorId=$Id';
    print("Urlllllllllllllllll:${url}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final tdsByDateModel = tdsByDateModelFromJson(r.body);
        return tdsByDateModel;
      }
    } catch (error) {
      print("FrenchiesTdsListBydateError: ${error}");
    }
  }

  /// todo Frenchies TDS report DropDown .........apr 6 2024...
  static Future<List<CommissionDropdown>>
      FrenchiesCommissionReportRole() async {
    var url = "${baseUrl}api/FranchisesApi/GetCommissionDropdown";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesCommissionReportDdModel =
            frenchiesCommissionReportDdModelFromJson(r.body);
        return frenchiesCommissionReportDdModel.commissionDropdown;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  /// todo Frenchies TDS report DropDown .........prince...apr6 2024
  static Future<List<TdsDropdown>> FrenchiesTdsReportRole() async {
    var url = "${baseUrl}api/FranchisesApi/GetTDSDropdown";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesTdsReportDdModel =
            frenchiesTdsReportDdModelFromJson(r.body);
        return frenchiesTdsReportDdModel.tdsDropdown;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo Frenchies Get Old Driver List ......10 april 2024
  static FrenchiesOldDriverListApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&user:${Id}');

    ///http://pswellness.in/api/FranchisesApi/GetOldDriverList?VendorId=10
    var url = '${baseUrl}api/FranchisesApi/GetOldDriverList?VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesOldDriverListModel =
            frenchiesOldDriverListModelFromJson(r.body);
        return frenchiesOldDriverListModel;
      }
    } catch (error) {
      print("&&&&&&&&&&&&&&&&&&&&yuyy:${error}");
    }
  }

  ///todo Frenchies Get New Driver List pending....create controller
  static FrenchiesNewDriverListApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&user:${Id}');
    //http://pswellness.in/api/FranchisesApi/GetNewDriverList?VendorId=10
    var url = '${baseUrl}api/FranchisesApi/GetNewDriverList?VendorId=$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final frenchiesNewDriverListModel =
            frenchiesNewDriverListModelFromJson(r.body);
        return frenchiesNewDriverListModel;
      }
    } catch (error) {
      print("&&&&&&&&&&&&&&&&&&&&yuyy:${error}");
    }
  }

  /// todo update old driver DropDown .......10 april... 2024....prince
  static Future<List<Driver>> getUpdatedolddriverListApi() async {
    //http://pswellness.in/api/FranchisesApi/GetOldDriverList?VendorId=10
    //http://pswellness.in/api/FranchisesApi/GetDriverForUpdate?VendorId=10
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&user:${Id}');
    var url = "${baseUrl}api/FranchisesApi/GetDriverForUpdate?VendorId=$Id";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        final frenchiesupdatedriver = driverListUpdatedModelFromJson(r.body);
        return frenchiesupdatedriver.drivers;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
