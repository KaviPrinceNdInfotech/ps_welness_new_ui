import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
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
import 'package:ps_welness_new_ui/model/1_user_model/test_name_model/test_name_modells.dart';
import 'package:ps_welness_new_ui/model/1_user_model/time_slots_common_model/time_slots_common.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/complain_nurse_model.dart';
//import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_appointment_details_list.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmentdetail_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmenthistory_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_banner_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/patient_list.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';
import 'package:ps_welness_new_ui/model/franchies_models/franchies_specialist.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
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
import '../../model/9_doctors_model_RRR/doctor_payment_history.dart';
import '../../model/9_doctors_model_RRR/doctor_profile_model.dart';
import '../../model/9_doctors_model_RRR/get_all_skils_model/get_all_skils_model.dart';
import '../../model/9_doctors_model_RRR/view_patient_report_model.dart';

var base64Code = "base64";
//base64Encode( File(selectedPath.value).readAsBytes());
///

class ApiProvider {
  static var baseUrl = 'http://test.pswellness.in/';

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
    var url = baseUrl + 'api/PatientApi/PatientRegistration';

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
    var url = baseUrl + 'api/SignupApi/Login';

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
    var url = baseUrl + 'api/SignupApi/ChangePassword';
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
    var url = baseUrl + 'api/ApiTest/BookAppointment';

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
    var url = baseUrl + 'api/ComplaintApi/PatientComplaint';
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
    var url = "http://test.pswellness.in/api/CommonApi/TestList";
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
    var url = baseUrl + 'api/CommonApi/GetSpecialist?depId=87';
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
  static NurseappointmentApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistId: ${NurseuserListId}");

    var url =
        //"http://test.pswellness.in/api/NurseAPI/NurseDetails?id=56";
        //"http://test.pswellness.in/api/NurseAPI/NurseDetails?id=$NurseuserListId";
        "http://test.pswellness.in/api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseAppointmentDetail nurseAppointmentDetail =
            nurseAppointmentDetailFromJson(r.body);
        print("rtrrtrtrtrrahukllllklrrrr:${r.body}");
        print("nurseLisruseIdUrlrrr: ${url}");

        return nurseAppointmentDetail;
      }
    } catch (error) {
      print("rtrrtrtrtrrahukllllkuuuuulrrrr:${error}");
      return;
    }
  }

  //from_here nurse type.........................

  //doctor profile  api 2..........................
  static NurseTypeApi() async {
    var url = baseUrl + 'api/CommonApi/NurseList';
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

  ///Todo: from here doctor 9 section.................
  ///
  //sign up  Api doctor Api 1........................................................
  static signDoctorUpApi(
    var Id,
    var DoctorName,
    var EmailId,
    var Password,
    var ConfirmPassword,
    var MobileNumber,
    var Fee,
    var PhoneNumber,
    var StartTime,
    var SlotTiming,
    var Department_Id,
    var Specialist_Id,
    var LicenceNumber,
    var LicenceImage,
    var LicenceImageName,
    var PinCode,
    var ClinicName,
    var Location,
    var StateMaster_Id,
    var CityMaster_Id,
    var EndTime,
    var LicenceBase64,
  ) async {
    try {
      var url = '${baseUrl}api/SignupApi/DoctorRegistration';
      var body = {
        "Id": "$Id",
        "DoctorName": "$DoctorName",
        "EmailId": "$EmailId",
        "Password": "$Password",
        "ConfirmPassword": "$ConfirmPassword",
        "MobileNumber": "$MobileNumber",
        "Fee": "$Fee",
        "PhoneNumber": "$PhoneNumber",
        "StartTime": "$StartTime",
        "SlotTiming": "$SlotTiming",
        "Department_Id": "$Department_Id",
        "Specialist_Id": "$Specialist_Id",
        "LicenceNumber": "$LicenceNumber",
        "LicenceImage": "$LicenceImage",
        "LicenceImageName": "$LicenceImageName",
        "PinCode": "$PinCode",
        "ClinicName": "$ClinicName",
        "Location": "$Location",
        "StateMaster_Id": "$StateMaster_Id",
        "CityMaster_Id": "$CityMaster_Id",
        "EndTime": "$EndTime",
        "LicenceBase64": base64Code
      };
      print("Body%%%%%%%%%%%%%%%%%%%%%%%%%%%: ${body}");
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
      );
      if (r.statusCode == 200) {
        print("Success123: ${r.body}");
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
  static DoctorProfileApi() async {
    var url = baseUrl + 'api/DoctorApi/DoctorProfile?DoctorId=150';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        DoctorProfile? doctorProfile = doctorProfileFromJson(r.body);
        return doctorProfile;
      }
    } catch (error) {
      return;
    }
  }

  /// todo doctor complain_register ................Rahul
  static doctorComplainApi(
    var Subjects,
    var Complaints,
    var Others,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/DoctorComplaint';
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

  /// todo driver complain register............Rahul
  static driverComplainApi(var Subjects, var Complaints) async {
    var url = baseUrl + 'api/ComplaintApi/DriverComplaints';
    var body = {"Subjects": Subjects, "Complaints": Complaints};
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
    var url = baseUrl + 'api/ComplaintApi/NurseComplaints';
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
        baseUrl + 'api/DoctorApi/PatientReports?DoctorId=151&PatientId=77';
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
  static DoctorPaymentHistoryApi() async {
    var url =
        'http://test.pswellness.in/api/DoctorApi/DoctorpaymentHistory?Id=145';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print("DoctorPaymentHistory Response: ${r.toString()}");
      if (r.statusCode == 200) {
        List<DoctorPaymentHistoryModel> doctorpaymenthistorymodel =
            doctorPaymentHistoryFromJson(r.body);
        print("DoctorPaymentHistory: ${doctorpaymenthistorymodel[0].amount}");
        return doctorpaymenthistorymodel;
      }
    } catch (error) {
      print("DoctorPaymentHistoryError: ${error}");
      return;
    }
  }

  //patient_list_api..........................
  static ViewPatientsListApi() async {
    var url =
        "http://test.pswellness.in/api/DoctorApi/ViewPatientList?DoctorId=151";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var PatientList = patientListFromJson(r.body);
        return PatientList;
      }
    } catch (error) {
      return;
    }
  }

  ///todo:from here 1_user................................
//lab_list_api..........................
  static ViewLabListApi() async {
    var url = "http://test.pswellness.in/api/LabApi/LabsList?CityId=786";
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
    var url = baseUrl + 'api/PatientMedicine/AddMedicineToCart';
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
    var url =
        "http://test.pswellness.in/api/PatientMedicine/MedicineCart?patientId=$PatientId";
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
    var url = "http://test.pswellness.in/api/PatientMedicine/GetMedicines";
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
    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/ViewMore?HealthId=18";
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
    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/H_CheckUpList?cityId=67";
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
    var url = "http://test.pswellness.in/api/CommonApi/GetStates";
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
    var url =
        "http://test.pswellness.in/api/CommonApi/GetCitiesByState?stateId=$stateID";
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

  ///doctor department Api get..dropdownapi user.........................
  static Future<List<DepartmentModel>> getDortorDepartmentApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/GetDepartments";
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
    var url =
        "http://test.pswellness.in/api/CommonApi/GetSpecialist?depId=$depId";
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
    var url =
        'http://test.pswellness.in/api/DoctorApi/GetDoctorSkills?doctorId=111';
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
    var url = baseUrl + "api/CommonApi/NurseList";
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
    var url = "http://pswellness.in/api/CommonApi/GetLocation";
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
    var url = baseUrl + 'api/DoctorApi/AddSkill';

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
    var url =
        'http://test.pswellness.in/api/HospitalAPI/DoctorList?hospitalId=209';
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
    var url = baseUrl + 'api/SignupApi/DoctorRegistration';
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
    var url = baseUrl + 'api/SignupApi/getBanner/?id=1';
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
    var url = baseUrl + 'api/SignupApi/getBanner/?id=4';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DoctorBannerModel doctorBannerModel = doctorBannerFromJson(r.body);
        print("Doctorbanner: ${doctorBannerModel.bannerImageList?[0].id}");
        return doctorBannerModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo doctor appoinment detail......Rahul
  static DoctorAppoinmentDetail() async {
    var url = '${baseUrl}api/DoctorApi/GetAppointmentDetail?Id=142';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        List<DoctorAppoinmentDetailModel> doctorAppoinmentDetail =
            doctorAppoinmentDetailFromJson(r.body);
        print(
            "doctorAppoinmentDetail: ${doctorAppoinmentDetail[0].doctorName}");
        return doctorAppoinmentDetail;
      }
    } catch (error) {
      print(":::::::::${error}");
      return;
    }
  }

//todo Doctor Appoinment History ........Rahul
  static DoctorAppoinmentHistory() async {
    var url = '${baseUrl}api/DoctorApi/DoctorPatientList?id=145';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DoctorAppoinmentHistoryModel doctorAppoinmentHistoryModel =
            doctorAppoinmentHistoryFromJson(r.body);
        return doctorAppoinmentHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo doctor update profile.............Rahul
  static DoctorUpdateProfile(
      var ID,
      var DoctorName,
      var MobileNumber,
      var StateMaster_Id,
      var CityMaster_Id,
      var Location,
      var PinCode,
      var ClinicName,
      var Fee,
      var adminLogin_id,
      var accountnoEditText,
      var ifscCodeEditText,
      var branchNameEditText) async {
    var url = baseUrl + 'api/DoctorApi/UpdateProfile';
    var body = {
      "ID": ID,
      "DoctorName": DoctorName,
      "MobileNumber": MobileNumber,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "PinCode": PinCode,
      "ClinicName": ClinicName,
      "Fee": Fee,
      "adminLogin_id": adminLogin_id,
      "AccountNo": accountnoEditText,
      "IFSCCode": ifscCodeEditText,
      "BranchName": branchNameEditText
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      Get.snackbar("Success", r.body);
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo driver update profile..............Rahul
  static DriverUpdateProfile(
      var Id,
      var DriverName,
      var Phone,
      var VehicleName,
      var StateMaster_Id,
      var CityMaster_Id,
      var Location,
      var DlNumber,
      var DlImage,
      var DlImageName,
      var DlBase64Image,
      var adminLogin_idEditTxt,
      var AccountNoEditTxt,
      var IFSCCodeEditTxt,
      var BranchName) async {
    var url = '${baseUrl}api/DriverApi/UpdateProfile';
    var body = {
      "Id": Id.toString(),
      "DriverName": DriverName.toString(),
      "MobileNumber": Phone.toString(),
      "VehicleName": VehicleName.toString(),
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location.toString(),
      "DlNumber": DlNumber.toString(),
      "DlImage": DlImage.toString(),
      "DlImageName": DlImageName.toString(),
      "DlBase64Image": base64Code,
      "adminLogin_id": adminLogin_idEditTxt,
      "AccountNo": AccountNoEditTxt,
      "IFSCCode": IFSCCodeEditTxt,
      "BranchName": BranchName
    };
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
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

  /// todo driver appointment details............Rahul
  static DriverAppointmentDetails() async {
    var url = '${baseUrl}api/DriverApi/getAppointmentDetail/?Id=88';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        List<DriverAppoinmentDetailModel> driverAppoinmentDetail =
            driverAppoinmentDetailFromJson(r.body);
        return driverAppoinmentDetail;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driverPaymentHistory...................Rahul
  static DriverPaymentHistory() async {
    var url = '${baseUrl}api/DriverApi/PaymentHistory?Id=176';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        List<DriverPaymentHistoryModel> driverPaymentHistoryModel =
            driverPaymentHistoryFromJson(r.body);
        return driverPaymentHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driver Booking History............Rahul
  static DriverBookingHistory() async {
    var url = '${baseUrl}api/DriverApi/BookingHistory?Id=170';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        List<DriverBookingHistoryModel> driverBookingHistory =
            driverBookingHistoryFromJson(r.body);

        return driverBookingHistory;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driver payout history.............Rahul
  static DriverPayoutHistoryApi() async {
    var url = '${baseUrl}api/DriverApi/PayoutHistory?id=169';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        List<DriverPayoutHistoryModel> driverPayoutHistory =
            driverPayoutHistoryFromJson(r.body);
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
    var url = baseUrl + 'api/SignupApi/DoctorRegistration';
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
    var url = '${baseUrl}api/DriverApi/GetDriverProfile?Id=168';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        DriverProfileDetailModel driverProfileDetail =
            driverProfileDetailFromJson(r.body);
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

    var url =
        "http://test.pswellness.in/api/NurseAPI/PaymentHistory?NurseID=$userid";
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
    var url = "http://test.pswellness.in/api/CommonApi/PatientSubjects";
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
    var url = "http://test.pswellness.in/api/CommonApi/PatientSubjects";
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
      var clinicNameController,
      var feeController,

      ///var adminLoginIdController,
      var accountnoController,
      var ifscController,
      var branchNameController) async {
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var url = baseUrl + 'api/NurseAPI/UpdateNurseProfile';
    var body = {
      "ID": userid,
      "NurseName": nameController,
      "MobileNumber": mobileController,
      "StateMaster_Id": selectedStatee,
      "CityMaster_Id": selectedCityy,
      "Location": locationController,
      "PinCode": pinController,
      "ClinicName": clinicNameController,
      "Fee": feeController,
      "adminLogin_id": adminId,
      "AccountNo": accountnoController,
      "IFSCCode": ifscController,
      "BranchName": branchNameController
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
    var url = baseUrl + 'api/NurseAPI/GetNurseProfile?Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        NurseProfileModel nurseProfileModel = nurseProfileModelFromJson(r.body);
        return nurseProfileModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo Nurse Signup api..........rahul .............
  static NurseSignupApi(
      var NurseType_IdController,
      var CertificateNumberController,
      var CityNameController,
      var PinCodeController,
      var NurseNameController,
      var PhoneNumberController,
      var MobileNumberController,
      var EmailIdController,
      var StateMaster_IdController,
      var CityMaster_IdController,
      var LocationController,
      var FeeController,
      var PasswordController,
      var ConfirmPasswordController,
      var PanImageFileController,
      var LicenceImageController,
      var CertificateBase64ImageController,
      var CertificateImageNameController,
      var VerificationDocController,
      var CertificateImageController) async {
    var url = baseUrl + 'api/SignupApi/NurseRegistration';
    var body = {
      "NurseType_Id": NurseType_IdController,
      "CertificateNumber": CertificateNumberController,
      "CityName": CityNameController,
      "PinCode": PinCodeController,
      "NurseName": NurseNameController,
      "PhoneNumber": PhoneNumberController,
      "MobileNumber": MobileNumberController,
      "EmailId": EmailIdController,
      "StateMaster_Id": StateMaster_IdController,
      "CityMaster_Id": CityMaster_IdController,
      "Location": LocationController,
      "Fee": FeeController,
      "Password": PasswordController,
      "ConfirmPassword": ConfirmPasswordController,
      "PanImageFile": PanImageFileController,
      "LicenceImage": LicenceImageController,
      "CertificateImageName": CertificateImageNameController,
      "VerificationDoc": VerificationDocController,
      "CertificateImage": CertificateImageController,
      "CertificateBase64Image": base64Code
    };

    http.Response r = await http.post(Uri.parse(url), body: body);
    print("Nurse Signup Api: ${body}");
    if (r.statusCode == 200) {
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
    var url =
        'http://test.pswellness.in/api/PatientApi/GetPatientList?RWA_Id=$userid';
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
    var url =
        'http://test.pswellness.in/api/PatientApi/GetRWA_PayoutList?RWA_Id=$userid';
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
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var url =
        'http://test.pswellness.in/api/PatientApi/GetRWA_ProfileDetails?RWA_Id=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final rwaProfileDetailModel = rwaProfileDetailModelFromJson(r.body);
        print("RWAPayoutReportbody: ${r.body}");
        print(
            "RWAPayoutReport: ${rwaProfileDetailModel.rwaProfileDetails?[0].authorityName}");
        return rwaProfileDetailModel;
      }
    } catch (error) {
      print("RWAPayoutReport: ${error}");
      return;
    }
  }

  /// todo RWA Add Patient............Rahul
  static RWAAddPatientApi(var PatientName, var EmailId, var MobileNumber,
      var Password, var ConfirmPassword, var Location, var PinCode) async {
    var prefs = GetStorage();
    //savid..........
    // prefs.write("AdminLogin_Id".toString(),
    //     json.decode(r.body)['data']['AdminLogin_Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');
    var url = '${baseUrl}api/PatientApi/AddPatient';
    var body = {
      "AdminLogin_Id": adminId,
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

  /// todo RWA Update Bank Detail............Rahul
  static RWAUpdateBankDetailApi(
    var AccountNo,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    var MobileNumber,
  ) async {
    var url = '${baseUrl}api/SignupApi/UpdateBank';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');
    var body = {
      "Id": userid,
      "Login_Id": adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName,
      "BranchAddress": BranchAddress,
      "HolderName": HolderName,
      "MobileNumber": MobileNumber,
    };
    print('AddPatientBody: ${body}');
    http.Response r = await http.post(Uri.parse(url), body: body);
    if (r.statusCode == 200) {
      print("BankDetailSuccesss: ${r.body}");
      Get.snackbar("Success", "${r.body}");
      return r;
    } else {
      Get.snackbar("Failed", r.body);
      return r;
    }
  }

  /// todo Rwa Payment Report.........Rahul
  static RWAPaymentReportApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${Id}');
    var url =
        'http://test.pswellness.in/api/PatientApi/GetRWA_PaymentReport?RWA_Id=$userid';
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

  /// todo RWA Complain ............Rahul
  static RWAProfileApi(
    var AuthorityName,
    var LandlineNumber,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var CertificateImage,
    var CertificateImagebase64,
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
      "CertificateImage": "$CertificateImage",
      "CertificateImagebase64": "$CertificateImagebase64"
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
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=7";
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
  ///todo: nurse booking 2 api........27 april 2023...
//
  static Nursesebooking2Api(
    var NurseId,
    var ServiceDate,
    var Slotid,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var NurseuserListId = preferences.getString("NurseuserListId");
    print("nurseuserlistId: ${NurseuserListId}");
    var url = baseUrl + 'api/NurseServices/NurseBookings';

    var body = {
      "Nurse_Id": "${NurseuserListId}",
      "ServiceDate": ServiceDate,
      "Slotid": Slotid,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      print("nurseeeaa:${body}");
      // var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&nursebookingId:${Id}');
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

  ///todo nurse list detail...18april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static NursListApi() async {
    var url = "http://test.pswellness.in/api/NurseAPI/getNurseList?cityid=67";
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
    var url =
        "http://test.pswellness.in/api/NurseAPI/NurseDetails?id=$NurseuserListId";
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
    var url = "http://test.pswellness.in/api/CommonApi/TimeSlot";
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

  ///
//todo Chemist///////////..
  /// todo Chemist Order History
  static chemistOrderHistoryApi() async {
    var url = '${baseUrl}api/ChemistApi/chemisthistory';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        final chemistOrderHistory = chemistOrderHistoryFromJson(r.body);
        print('ChemistOrderHistor: ${r.body}');
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
    var url = '${baseUrl}api/ChemistApi/paymenthistory';
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
    var url = '${baseUrl}api/ChemistApi/payouthistory';
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

  /// todo Chemist Update Profile ............Rahul
  static ChemistUpdateProfileApi(
      // var id,
      var ShopName,
      var MobileNumber,
      var StateMaster_Id,
      var CityMaster_Id,
      var Location,
      //var AdminLogin_Id,
      var PinCode,
      var AccountNo,
      var IFSCCode,
      var BranchName) async {
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
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "BranchName": BranchName
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

  /// todo Chemist SignUp............Rahul
  static ChemistSignupApi(
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
    //var Patient_Id,
  ) async {
    var body = {
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
    };
    try {
      var url = 'http://test.pswellness.in/api/SignupApi/SignUpRWA';
      var r = await http.post(Uri.parse(url), body: body);
      print("nlmknmkmk:${r.body}");
      print("###3###3####1rrrererttrrrrr: ${body}");
      if (r.statusCode == 200) {
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
}
