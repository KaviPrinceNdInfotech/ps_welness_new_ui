import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/10_lab_module/lab_model_byId.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/vehicle_type3_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_appointment_history.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_details_api.dart';
import 'package:ps_welness_new_ui/model/1_user_model/medicine_order/medicine_order_history.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_detail_id.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_list_modelby_locationid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/test_name_model/test_name_modells.dart';
import 'package:ps_welness_new_ui/model/1_user_model/user_profile_details/user_profile_details.dart';
import 'package:ps_welness_new_ui/model/1_user_model/wallet_model/wallet_section_model.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_appointment_details_list.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/patient_list.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';
import 'package:ps_welness_new_ui/model/franchies_models/franchies_specialist.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ps_welness/model/1_user_model/health_checkup_list/health_checkup_list.dart';
//import 'package:ps_welness/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
//import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
// import 'package:ps_welness/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
// import 'package:ps_welness/model/1_user_model/medicine_list_model/medicine_list_models.dart';
// import 'package:ps_welness/model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
// import 'package:ps_welness/model/1_user_model/nurse_location_model/nurse_location_models.dart';
// import 'package:ps_welness/model/1_user_model/nurse_type_model/nurse_type_model.dart';
// import 'package:ps_welness/model/1_user_model/states_model/state_modells.dart';
// import 'package:ps_welness/model/1_user_model/test_name_model/test_name_modells.dart';
// import 'package:ps_welness/model/4_nurse_all_models/nurse_appointment_details_list.dart';
// import 'package:ps_welness/model/9_doctors_model/doctor_profile_model.dart';
// import 'package:ps_welness/model/9_doctors_model/view_patient_report_model.dart';
// import 'package:ps_welness/model/franchies_models/franchies_specialist.dart';
// import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/nursess/nurse_type_model/nurse_type_model.dart';

import '../model/10_lab_module/lab_appointment_history/lab_appointment_history.dart';
import '../model/1_user_model/ambulance/ambulance_catagary2_model.dart';
import '../model/1_user_model/city_model/city_modelss.dart';
import '../model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';
import '../model/1_user_model/doctor_appointment_history_model/user_doctor_apointment_history.dart';
//import '../model/1_user_model/doctor_detail_model/doctor_detail_model.dart';
import '../model/1_user_model/doctor_checkout_model/doctor_checkout_modell.dart';
import '../model/1_user_model/doctor_list_byhospitalid/doctor_list_through_api.dart';
import '../model/1_user_model/get_department_list_model/department_model.dart';
import '../model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import '../model/1_user_model/health_checkup_list/health_checkup_list.dart';
import '../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
import '../model/1_user_model/health_chkp_checkout_model/health_chkp_chkout_model.dart';
import '../model/1_user_model/hlthchkp_detail_model/healthchkp_detail_model.dart';
import '../model/1_user_model/lab_details/lab_checkout_modells.dart';
import '../model/1_user_model/lab_list_models.dart';
import '../model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
import '../model/1_user_model/medicine_checkout/medicine_checkout_model.dart';
import '../model/1_user_model/medicine_checkout/medicine_original_chekout.dart';
import '../model/1_user_model/medicine_list_address_dwlivery_api/medicine_list_address_model.dart';
import '../model/1_user_model/medicine_list_model/medicine_list_models.dart';
import '../model/1_user_model/nurse_location_model/nurse_location_models.dart';
import '../model/1_user_model/nurse_type_model/nurse_type_model.dart';
import '../model/1_user_model/states_model/state_modells.dart';
import '../model/1_user_model/time_slots_common_model/time_slots_common.dart';
import '../model/9_doctors_model/doctor_profile_model.dart';
import '../model/9_doctors_model/get_all_skils_model/get_all_skils_model.dart';
//mport '../model/9_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../model/9_doctors_model/view_patient_report_model.dart';
import '../model/9_prince_doctors_model/doctor_payment_history.dart';
import '../model/9_prince_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../modules_view/1_user_section_views/doctorss/doctor_appointments_details/doctor_details_by_id/doctor_detail_by_id_model.dart';
import '../modules_view/1_user_section_views/nursess/nurse_list_userrrr/nurse_list_user_model.dart';
import '../modules_view/circular_loader/circular_loaders.dart';

class ApiProvider {
  static var baseUrl = 'http://test.pswellness.in/';
  static var baseUrl1 = 'https://api.gyros.farm/';
  //'http://pswellness.in/';
  static String token = '';
  static String Token = '';
  //static String catid = '';
  //static String productid = '';
  //static String orderid = '';
  static String Id = '';
  static String MedicineId = ''.toString();
  static String adminId = ''.toString();
  static String userid = ''.toString();

  static String StatemasterId = ''.toString();
  static String CitymasterId = ''.toString();
  static String LabtestId = ''.toString();

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
    //var a= int.parse(State).toString();
    //var b= int.parse(City).toString();
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

    // print(body);

    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///here signup api of user.............24 april 2023...

  static UserSignUpApinew(
    var PatientName,
    var EmailId,
    var MobileNumber,
    var Password,
    var ConfirmPassword,
    var StateMasterId,
    var CityMasterId,
    var Location,
    var Pincode,
  ) async {
    var url = baseUrl + 'api/SignupApi/PatientRegistration';
    var body = {
      "PatientName": PatientName,
      "EmailId": EmailId,
      "MobileNumber": MobileNumber,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "Location": Location,
      "Pincode": Pincode,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///here delivery address api of user.............27 april 2023...

  static deliverymedicineAddressApi(
    var Name,
    var Email,
    var MobileNumber,
    var Password,
    var StateMasterId,
    var CityMasterId,
    var DeliveryAddress,
    var PinCode,
  ) async {
    var url = baseUrl + 'api/PatientApi/MedicineAddress';
    var body = {
      "Name": Name,
      "Email": Email,
      "MobileNumber": MobileNumber,
      "Password": "12345",
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "DeliveryAddress": DeliveryAddress,
      "PinCode": PinCode,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:here lab booking1 api of user.............27 april 2023...

  static labbookingpostApi(
    var StateMasterId,
    var CityMasterId,
    var testId,
  ) async {
    var url = baseUrl + 'api/LabApi/LabBooking';
    var body = {
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "testId": testId,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:here doctor booking1 api of user.............1 may 2023...

  static doctorbooking1postApi(
    var Department_id,
    var Specialist_id,
    var StateMaster_Id,
    var CityMaster_Id,
  ) async {
    var url = baseUrl + 'api/DoctorApi/DoctorChoose';
    var body = {
      "Department_id": Department_id,
      "Specialist_id": Specialist_id,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo nurse list detail...18april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static NursecheckoutApi() async {
    var url =
        "http://test.pswellness.in/api/NurseServices/NurseAptmt?Nurse_Id=83";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseCheckoutModel? nursecheckout = nurseCheckoutModelFromJson(r.body);
        return nursecheckout;
      }
    } catch (error) {
      return;
    }
  }

  ///todo nurse list detail...2 april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static DoctoercheckoutApi() async {
    var url = "http://test.pswellness.in/api/DoctorApi/DoctorApt?Doctor_Id=145";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        DoctorCheckoutModel? doctorcheckout =
            doctorCheckoutModelFromJson(r.body);
        return doctorcheckout;
      }
    } catch (error) {
      return;
    }
  }

  ///todo lab checkout...28april 2023....after api it will change in future it will based on location id...18 april 2023...................
  static LabcheckoutApi() async {
    var url = '${baseUrl}api/LabApi/LabAptmt?Lab_Id=16';
    // "http://test.pswellness.in/api/LabApi/LabAptmt?Lab_Id=16";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&checkout:${r.body}");
        print("&&&&checkouturl:${url}");
        Labcheckoutmodel? labcheckout = labcheckoutmodelFromJson(r.body);
        return labcheckout;
      }
    } catch (error) {
      print("rahulbaba${error}");
      return;
    }
  }

  ///todo health checkout...1_may 2023....after api it will change in future it will based on location id...18 april 2023...................
  static HealthchkupcheckoutApi() async {
    var url = '${baseUrl}api/HealthCheckUpApi/HealthAptmt?Test_Id=1';
    // "http://test.pswellness.in/api/LabApi/LabAptmt?Lab_Id=16";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&thhealcheckout:${r.body}");
        print("&&&&healthcheckouturl:${url}");
        HealthCheckupcheckout? healthCheckupcheckout =
            healthCheckupcheckoutFromJson(r.body);
        return healthCheckupcheckout;
      }
    } catch (error) {
      print("princechkout${error}");
      return;
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

  ///todo nurse list detail...8 may 2023....after api it will change in future it will based on location id...18 april 2023...................
  static NursListUserrApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nurseLocationId = preferences.getString("nurseLocationId");
    print("nurseLocationId: ${nurseLocationId}");
    var url =
        "http://test.pswellness.in/api/NurseAPI/getNurseList?Loc_id=$nurseLocationId";

    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("nurseLocationIdUrl: ${url}");
        NurseListbylocationId? nurseListbylocationId =
            nurseListbylocationIdFromJson(r.body);
        return nurseListbylocationId;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: nurse......details........18 april....

  static NursDetailApi() async {
    var url = "http://test.pswellness.in/api/NurseAPI/NurseDetails?id=56";
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
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&user:${Id}');
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

  ///Change password in user 26 april 2023.....

  static ChangePasswordApi(var id, var Password, var ConfirmPassword) async {
    var url = baseUrl + 'api/SignupApi/ChangePassword';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${adminId}');

    var body = {
      "ID": adminId.toString(),
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
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: google post ambulance api on .......2 may 2023.......,,,,,,.....................

  static GooglebookambulanceApi(
    var start_Lat,
    var start_Long,
    var end_Lat,
    var end_Long,
    var Patient_Id,
    var AmbulanceType_id,
    var VehicleType_id,
  ) async {
    var url = baseUrl + 'api/DriverApi/AddAmbulance';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userid}');

    var body = {
      "start_Lat": start_Lat.toString(),
      "start_Long": start_Long.toString(),
      "end_Long": start_Lat.toString(),
      "end_Lat": start_Long.toString(),
      "Patient_Id": userid,
      "AmbulanceType_id": "1",
      //AmbulanceType_id,
      "VehicleType_id": VehicleType_id
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);
      Get.snackbar("title", '${r.body}');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo:this is the usercomplain api...26 april 2023...............
  static UserComplainnewApi(
    var patsubid,
    var Others,
    var Complaints,
    var LoginId,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/PatientComplaints';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');

    var body = {
      "patsubid": patsubid,
      "Others": Others,
      "Complaints": Complaints,
      "Login_Id": adminId,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:this is the Labcomplain api...11 may 2023...............
  static LabComplainpi(
    var Complaints,
    var Login_Id,
    var Subjects,
    var Others,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/LabComplaint';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercomplain:${adminId}');

    var body = {
      "Complaints": Complaints,
      "Login_Id": adminId,
      "Subjects": Subjects,
      "Others": Others,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///user profile update.........26 april 2023...

  ///here profile api of user.............24 april 2023...

  static Userprofileupdate(
    var Id,
    var patientName,
    var MobileNumber,
    var StateMasterId,
    var CityMasterId,
    var Location,
    var PinCode,
    var adminLoginId,
    var AccountNo,
    var IFSCCode,
    var BranchName,
  ) async {
    //var a= int.parse(State).toString();
    //var b= int.parse(City).toString();
    var url = baseUrl + 'api/PatientApi/UpdateProfilebyPatient';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');

    var body = {
      "Id":
          //137,
          userid,
      "patientName": patientName,
      //"EmailId": EmailId,
      "MobileNumber": MobileNumber,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "StateMaster_Id": StateMasterId,
      "CityMaster_Id": CityMasterId,
      "Location": Location,
      "PinCode": PinCode,
      "adminLogin_id":
          //1222,
          adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "Location": Location,
      "BranchName": BranchName,
    };

    // print(body);

    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId

      print("gvhjbknlokokookupdate${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///lab_update_profile_details...11...may...2023...prince

  static Labprofileupdate(
    var Id,
    var MobileNumber,
    var LabName,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var PinCode,
    var adminLogin_id,
    var AccountNo,
    var IFSCCode,
    var BranchName,
  ) async {
    //var a= int.parse(State).toString();
    //var b= int.parse(City).toString();
    var url = baseUrl + 'api/PatientApi/UpdateProfilebyPatient';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userlabbbb:${userid}');

    var body = {
      "Id":
          //137,
          userid,
      "MobileNumber": MobileNumber,
      "LabName": LabName,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "Location": Location,
      "PinCode": PinCode,
      "adminLogin_id":
          //1222,
          adminId,
      "AccountNo": AccountNo,
      "IFSCCode": IFSCCode,
      "Location": Location,
      "BranchName": BranchName,
    };

    // print(body);

    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId

      print("gvhjbknlokokookupdatedddd${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///lab_paynow.ONLINE.....api..of...user........29 april 2023...........

  static LabpaynowOnlineApi(
      // var Lab_Id,
      // var Patient_Id,
      // var Amount,
      // var IsPaid,
      ) async {
    var url = baseUrl + 'api/LabApi/LabPayNow';
    var prefs = GetStorage();
    // adminId = prefs.read("AdminLogin_Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Lab_Id": "16",
      //Lab_Id,
      "Patient_Id": "83",
      "IsPaid": "true",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknlolabonline:${r.body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error1088', r.body);
      return r;
    }
  }

  ///nurse_paynow.ONLINE.....api..of...user........29 april 2023...........
  static NursepaynowOnlineApi() async {
    var url = baseUrl + 'api/NurseServices/NursePayNow';
    var prefs = GetStorage();
    // adminId = prefs.read("AdminLogin_Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Id": "192",
      //Lab_Id,
      "Nurse_Id": "83",
      "IsPaid": "true",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknnurseonline:${r.body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errornurse', r.body);
      return r;
    }
  }

  ///doctor_paynow.ONLINE.....api..of...user........2 may 2023...........
  static DoctorpaynowOnlineApi() async {
    var url = baseUrl + 'api/DoctorApi/DoctorPayNow';
    var prefs = GetStorage();
    // adminId = prefs.read("AdminLogin_Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userdoctor:${userid}');
    var body = {
      "Doctor_Id": "145",
      //Lab_Id,
      "Patient_Id": "73",
      "IsPaid": "true",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoronline:${r.body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  ///healthchkp_paynow.ONLINE.....api..of...user........2 may 2023...........
  static HealthchkppaynowOnlineApi() async {
    var url = baseUrl + 'api/HealthCheckUpApi/HealthPayNow';
    var prefs = GetStorage();
    // adminId = prefs.read("AdminLogin_Id").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userhealthchkp:${userid}');
    var body = {
      "Test_Id": "1",
      //Lab_Id,
      "Patient_Id": "83",
      "IsPaid": "true",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoronline:${r.body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  ///lab_paynow.OFFLINE.....api..of...user........29 april 2023...........

  static LabpaynowOfflineApi() async {
    var url = baseUrl + 'api/LabApi/LabPayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Lab_Id": "16",
      "Patient_Id": "83",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknlolabonline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///nurse_paynow.OFFLINE.....api..of...user........1 may 2023...........

  static NursepaynowOfflineApi() async {
    var url = baseUrl + 'api/NurseServices/NursePayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Id": "192",
      "Nurse_Id": "83",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbknlolabonline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///doctor_paynow.OFFLINE.....api..of...user........1 may 2023...........

  static DoctorpaynowOfflineApi() async {
    var url = baseUrl + 'api/DoctorApi/DoctorPayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Doctor_Id": "145",
      "Patient_Id": "73",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoroffline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  ///doctor_paynow.OFFLINE.....api..of...user........1 may 2023...........

  static HealthchkppaynowOfflineApi() async {
    var url = baseUrl + 'api/HealthCheckUpApi/HealthPayNow';
    var prefs = GetStorage();
    adminId = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&admin:${adminId}');

    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&user:${userid}');
    var body = {
      "Test_Id": "1",
      "Patient_Id": "83",
      "IsPaid": "false",
    };
    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("gvhjbkdoctoroffline:${body}");

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errordoctor', r.body);
      return r;
    }
  }

  //doctor profile  api 2..........................
  static UserProfileApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        //"http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=137";
        "http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=$userid";
    //http://test.pswellness.in/api/PatientApi/PatientProfiledetail?PatientId=137
    //var url = baseUrl + 'api/PatientApi/PatientProfiledetail?PatientId=$userid';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        Userprofilepersonal? userProfile = userprofilepersonalFromJson(r.body);
        return userProfile;
      }
    } catch (error) {
      return;
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

  ///todo: nurse booking 1 api........27 april 2023...

  static Nursesebooking1Api(
    var PatientId,
    var NurseTypeId,
    var ServiceType,
    var ServiceTime,
    var StartDate,
    var EndDate,
    var MobileNumber,
    var LocationId,
  ) async {
    var url = baseUrl + 'api/NurseServices/NurseServices';

    var body = {
      "Patient_Id": Id,
      "NurseTypeId": NurseTypeId,
      "ServiceType": ServiceType,
      "NurseType_Id": NurseTypeId,
      "ServiceTime": ServiceTime,
      "StartDate": StartDate,
      "EndDate": EndDate,
      "MobileNumber": MobileNumber,
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
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&nursebookingId:${Id}');

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

  ///todo: nurse booking 2 api........27 april 2023...

  static Nursesebooking2Api(
    var NurseId,
    var ServiceDate,
    var Slotid,
  ) async {
    var url = baseUrl + 'api/NurseServices/NurseBookings';

    var body = {
      "Nurse_Id": "55",
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
      var prefs = GetStorage();
      //saved id..........
      //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
      Id = prefs.read("Id").toString();
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

  ///todo: lab booking 2 api........27 april 2023...

  static Labbooking2Api(
    var Lab_Id,
    var TestDate,
    var Slotid,
  ) async {
    var url = baseUrl + 'api/LabApi/Booknow';

    var body = {
      "Lab_Id": "16",
      "TestDate": TestDate,
      "Slotid": Slotid,
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

  ///todo: doctor booking 2 api........27 april 2023...

  static Doctorbooking2Api(
    var Doctor_Id,
    var Slot_id,
    var AppointmentDate,
  ) async {
    var url = baseUrl + 'api/DoctorApi/DoctorBooknow';

    var body = {
      "Doctor_Id": "146",
      "Slot_id": Slot_id,
      "AppointmentDate": AppointmentDate,
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

  ///todo: health chkp booking 2.........gcktcvut,....
  ///todo: lab booking 2 api........27 april 2023...

  static Healthcheckup2Api(
    var Test_Id,
    var TestDate,
    var Slotid,
  ) async {
    var url = baseUrl + 'api/LabApi/Booknow';

    var body = {
      "Test_Id": 1,
      "TestDate": TestDate,
      "Slotid": Slotid,
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

  ///todo health checkup post booking 1 api.....29 april 2023...

  static Healthbooking1Api(
    var StateMaster_Id,
    var CityMaster_Id,
    var testId,
  ) async {
    var url = baseUrl + 'api/HealthCheckUpApi/HealthCheckUpBooking';

    var body = {
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "testId": testId,
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
    var url =
        "http://test.pswellness.in/api/PatientApi/AppoinmentHistory?Id=166";
    // "http://test.pswellness.in/api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56";
    //baseUrl + 'api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        NurseAppointmentDetail? nurseAppointmentDetail =
            nurseAppointmentDetailFromJson(r.body);
        return nurseAppointmentDetail;
      }
    } catch (error) {
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
    var PinCode,
    var Id,
    var DoctorName,
    var PhoneNumber,
    var MobileNumber,
    var EmailId,
    var StateMasterId,
    var CityMasterId,
    var Location,
    var LicenceNumber,
    var ClinicName,
    var DepartmentId,
    var SpecialistId,
    var Fee,
    var Password,
    var ConfirmPassword,
    var LicenceBase64,
    var LicenceImageName,
    var LicenceImage,
    var StartTime,
    var EndTime,
    var SlotTiming,
    var StartTime2,
    var EndTime2,
    var SlotTiming2,
    // var Name,
    // var Mobile_No,
    // var Email_Id,
    // var PassWord,
    // var ConfirmPassWord,
  ) async {
    try {
      var url = baseUrl + 'api/SignupApi/DoctorRegistration';
      var body = {
        "PinCode": PinCode,
        "Id": Id,
        "DoctorName": DoctorName,
        "PhoneNumber": PhoneNumber,
        "MobileNumber": MobileNumber,
        "EmailId": EmailId,
        "StateMaster_Id": StateMasterId,
        "CityMaster_Id": CityMasterId,
        "Location": Location,
        "LicenceNumber": LicenceNumber,
        "ClinicName": ClinicName,
        "Department_Id": DepartmentId,
        "Specialist_Id": SpecialistId,
        "Fee": Fee,
        "Password": Password,
        "ConfirmPassword": ConfirmPassword,
        "LicenceBase64": LicenceBase64,
        "LicenceImageName": LicenceImageName,
        "LicenceImage": LicenceImage,
        "StartTime": StartTime,
        "EndTime": EndTime,
        "SlotTiming": SlotTiming,
        "StartTime2": StartTime2,
        "EndTime2": EndTime2,
        "SlotTiming2": SlotTiming2,

        // "Name": Name,
        // "Mobile_No": Mobile_No,
        // "Email_Id": Email_Id,
        // "PassWord": PassWord,
        // "ConfirmPassWord": ConfirmPassWord,
      };

      print(body);

      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(r.body);

      if (r.statusCode == 200) {
        var prefs = GetStorage();
        //saved id..........
        prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
        Id = prefs.read("Id").toString();
        print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
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

  //complain_register doctor api................

  static doctorComplainApi(
    var LoginId,
    var Subjects,
    var Complaints,
    var IsDeleted,
    var IsResolved,
    var Others,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/DoctorComplaint';

    var body = {
      "Login_Id": LoginId,
      "Subjects": Subjects,
      "Complaints": Complaints,
      "IsDeleted": IsDeleted,
      "IsResolved": IsResolved,
      "Others": Others,
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

  //complain_register doctor api................

  static NurseComplainApi(
    var LoginId,
    var Subjects,
    var Complaints,
    var IsDeleted,
    var IsResolved,
    var Others,
  ) async {
    var url = baseUrl + 'api/ComplaintApi/NurseComplaints';

    var body = {
      "Subjects": Subjects,
      "Complaints": Complaints,
      "IsDeleted": IsDeleted,
      "IsResolved": IsResolved,
      "Others": Others,
      "Login_Id": LoginId,
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
        return viewPatientReport;
      }
    } catch (error) {
      return;
    }
  }

  //view_payment_history.............

  static ViewPaymentHistoryApi() async {
    var url = baseUrl + 'api/DoctorApi/paymentHistory?id=151&Date=2023-01-10';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var viewpaymentreport = paymentHistoryFromJson(r.body);
        return viewpaymentreport;
      }
    } catch (error) {
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
    var url =
        "http://test.pswellness.in/api/LabApi/LabsList?CityId=67&StateId=2&testId=623";
    //var url = "http://test.pswellness.in/api/LabApi/LabsList?CityId=786";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&&&&&:princelablist${r.body.toString()}");
        print("&&&&&&&&&lablisturl:${url.toString()}");
        var LabListUser = labListUserFromJson(r.body);
        return LabListUser;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: lab_list_detail_api..........................18april_--2023
  static ViewLabdetailsApi() async {
    var url = "http://test.pswellness.in/api/LabApi/LabDetails?id=18";
    try {
      http.Response r = await http.get(Uri.parse(url));

      //print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&&&&&:princelabdetail${r.body.toString()}");
        print("&&&&&&&&&lablistssurl:${url.toString()}");

        var Labdetailbyid = labdetailbyidFromJson(r.body);
        return Labdetailbyid;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: doctor_detail_api...................1 may--2023
  static ViewdetailhlthchkpApi() async {
    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/ViewMore?HealthId=1";
    try {
      http.Response r = await http.get(Uri.parse(url));

      //print(r.body.toString());
      if (r.statusCode == 200) {
        print("&&&&&&&&:princehlthchkpdetail${r.body.toString()}");
        print("&&&&&&&&&princehlthchkpdetail:${url.toString()}");

        var healthchkpdetailbyid = healthCheckupcheDetailFromJson(r.body);
        return healthchkpdetailbyid;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: ambulance_type_api..........................23april.....2023.........
  static ViewAmbulanceTypeApi() async {
    var url = "http://test.pswellness.in/api/VehicleTypeApi/AmbulanceTypeList";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var Ambulancetype = ambulancetypeFromJson(r.body);
        return Ambulancetype;
      }
    } catch (error) {
      return;
    }
  }

  //doctor_list_api..........................
  static ViewDoctorListApi() async {
    var url =
        "http://test.pswellness.in/api/DoctorApi/DoctorChooseDep?Department_id=1&Specialist_id=1&StateMaster_Id=33&CityMaster_Id=771";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var GetDoctorListModel = getDoctorListModelFromJson(r.body);
        return GetDoctorListModel;
      }
      print(url);
      print(r.body);
      print(r.statusCode);
    } catch (error) {
      return;
    }
  }

  ///todo: doctor details by Id 17 april 2023.............
  static ViewDoctorDetailApi() async {
    var url = "http://test.pswellness.in/api/DoctorApi/DoctorDetails?id=145";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var GetDoctorDetailbyId = getDoctorDetailbyIdFromJson(r.body);
        return GetDoctorDetailbyId;
      }
      print(url);
      print(r.body);
      print(r.statusCode);
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

  ///todo: add to cart 10 may 2023.....princecart.......
  static AddToCartMedicineApi(
    var MedicineId,
  ) async {
    var url = baseUrl + 'api/PatientMedicine/AddMedicineCart';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercart:${userid}');
    print(userid);
    print(url);

    var body = {
      "PatientId": userid,
      "MedicineId": MedicineId,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      Get.snackbar('Message', 'Already Added');

      ///orignal code
      //Get.snackbar('Error', 'Already Added');
      return r;
    }
  }

  ///todo: add to cart plius 10 may 2023.....princecart.......

  static AddToCartPlusMedicineApi(
    var Id,
  ) async {
    var url = baseUrl + 'api/PatientMedicine/PlusAddToCart';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    print(url);

    var body = {
      "Id": Id,
      "PatientId": userid,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      //Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      //Get.snackbar('Message', 'Already Added');

      ///orignal code
      Get.snackbar('Error', '${r.body}');
      return r;
    }
  }

  ///todo: add to cart minus 10 may 2023.....princecart.......

  static AddToCartMinusMedicineApi(
    var Id,
  ) async {
    var url = baseUrl + 'api/PatientMedicine/minusAddToCart';
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    print(url);

    var body = {
      "Id": Id,
      "PatientId": userid,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      //Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      //Get.snackbar('Message', 'Already Added');

      ///orignal code
      Get.snackbar('Error', '${r.body}');
      return r;
    }
  }

  ///todo: checkout---api---total_cost....prince 10 may...
  ///

  static GetMedicineCheckoutApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        'http://test.pswellness.in/api/PatientMedicine/OrderPlacedDetails?PatientId=139&id=1';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        CheckoutmedicineModel checkoutmrdicineModel =
            checkoutmedicineModelFromJson(r.body);
        print(
            "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR123tttyyt: ${checkoutmrdicineModel.data?.totalPrice}");
        print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR123url: ${url}");
        // prefs.write("totalCostR",
        //     checkoutmrdicineModel.data?.totalPrice); // used in cart_product2
        return checkoutmrdicineModel;
      }
    } catch (error) {
      print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR: ${error}");
      return;
    }
  }

  /// user medicinrcart_list_api.............................................
  static MedicinecartlistApi() async {
    var prefs = GetStorage();
    //saved id..........
    final PatientId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');
    var url =
        "http://test.pswellness.in/api/PatientMedicine/MedicineDetails?PatientId=$PatientId";
    //"http://test.pswellness.in/api/PatientMedicine/MedicineCart?patientId=$PatientId";
    //"http://test.pswellness.in/api/PatientMedicine/MedicineDetails?PatientId=$PatientId";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var MedicineCartListModel = medicineCartListModelFromJson(r.body);
        return MedicineCartListModel;
      }
      print('&&&&&&&&&&&&&&&&&&&&&&okokouuuuucartlist:${r.body}');
    } catch (error) {
      print('&&&&&&&&&&&&&&&&&&&&&&okokouuuuucartlisterror:${error}');

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

  /// user medicine_address_list_api..........................28april..2023.......
  static MedicineaddresslistApi() async {
    var url = "http://test.pswellness.in/api/PatientApi/GetMedicineAddress";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print('&&&&&&&&&&&&&&&&&&&&&&okaddress:${url}');
        print('&&&&&&&&&&&&&&&&&&&&&&okaddress:${r.body}');

        var MedicineAddresslist = medicineAddressModelFromJson(r.body);
        return MedicineAddresslist;
      }
    } catch (error) {
      return;
    }
  }

  /// user medicine_orderhistory_list_api.......................21april2023...
  static MedicineorderhistorylistApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientMedicine/MedicineDetailsByPatient?PatientId=$userid";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var MedicineOrderHistory = medicineOrderHistoryFromJson(r.body);
        return MedicineOrderHistory;
      }
    } catch (error) {
      return;
    }
  }

  ///lab_list_2..................................
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

  ///todo: this is the api of labappointment history by lab id.....

  static LabappointmenthistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userlabhist:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/LabApi/BookedTestHistory?LabId=12";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var LabHistorybyLabId = labHistorybyLabIdFromJson(r.body);
        print(
            '############43322: ${LabHistorybyLabId.testList?[0].patientName}');
        return LabHistorybyLabId;
      }
    } catch (error) {
      print("okokokocr8ytviuobipn:${error}");
      return;
    }
  }

  ///todo: this is the api of labappointment history by userid....21april 2023....

  static LabappointmentshistorybyuserIdApi() async {
    var url =
        "http://test.pswellness.in/api/PatientApi/LabDetailsByPatient?PatientId=80";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var Labappointmentbyuserid = labappointmentbyuseridFromJson(r.body);
        print(
            '############43322: ${Labappointmentbyuserid.labModel?[0].labName}');
        return Labappointmentbyuserid;
      }
    } catch (error) {
      print("okokokocr8ytviuobipn:${error}");
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

  ///checkup_history_3...........................22 april....2023
  static HealthcheckuplistApi() async {
    var url =
        "http://test.pswellness.in/api/HealthCheckUpApi/HCheckUpList?StateId=2&CityId=66&testId=1";
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

  ///ambulance catagary Api get...........................24 april 2023......yuibubu
  // static Future<List<Vehicle>> getambulancecatagaryApi() async {
  //   var url =
  //       "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=1";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var AmbulancecatagaryListss = ambulancecatagarybyIdFromJson(r.body);
  //       return AmbulancecatagaryListss;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }
  static Future<List<Vehicle>?> getambulancecatagaryApi() async {
    var url = "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var ambulanceData = ambulancecatagarybyIdFromJson(r.body);
        return ambulanceData.vehicle;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_vehicle_type_api...........24 april 2023........

  static
      //Future<List<VehicleDetaile>?>
      getvechilebyidApi(String ambulancecatagaryID) async {
    var url =
        "http://test.pswellness.in/api/VehicleTypeApi/VehicleType?id=$ambulancecatagaryID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var vehiceData = vehicletypebycatagaryIdFromJson(r.body);
        return vehiceData.vehicleDetailes;
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

  ///get_skils_api.....................

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
    var url = "http://pswellness.in/api/CommonApi/NurseList";
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

  ///todo:complain_subject..user.of...user...id.....getapidropdown...25apr...2023..
  static Future<List<Complaint41Patient>> getsubjecttypeApi() async {
    var url = "http://test.pswellness.in/api/CommonApi/PatientSubjects";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var subjecttypeData = complainSubjectModelFromJson(r.body);
        //ComplainSubjectModel hggh=complainSubjectModelFromJson(r.body);
        //return subjecttypeData.complaint41Patient;
        return subjecttypeData.complaint41Patient;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
  // static Future<List<StateModel>> getSatesApi() async {
  //   var url = "http://test.pswellness.in/api/CommonApi/GetStates";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var statesData = statesModelFromJson(r.body);
  //       return statesData.states;
  //     } else {
  //       return [];
  //     }
  //   } catch (error) {
  //     return [];
  //   }
  //}

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

  ///book lab api...........6 march 2023

  static BooklabApi(
    var LabId,
    var TestId,
    var PatientId,
    var PatientName,
    var PatientAddress,
    var ContactNumber,
    var TestDate,
    var AvailabelTime1,
    var AvailableTime2,
    var Amount,
    var StateMasterId,
    var CityMasterId,
    var Patient,
  ) async {
    var url = baseUrl + 'api/LabApi/BookLabTest';

    var body = {
      "Lab_Id": "12",
      "Test_Id": "1",
      "Patient_Id": Id,
      "PatientName": PatientName,
      "PatientAddress": PatientAddress,
      "ContactNumber": "6398028236",
      "TestDate": TestDate,
      "AvailabelTime1": AvailabelTime1,
      "AvailableTime2": AvailableTime2,
      "Amount": Amount,
      "StateMaster_id": StateMasterId,
      "CityMaster_id": CityMasterId,
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
      //Get.snackbar("Skills added",r.body);

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

  ///Todo: from here ........

  //login user api ps welness api 1..................................

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
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
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

  ///todo: banner Api for user.1....................

  static getbanneruserApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=1';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        //BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for franchies.2........

  static getbannerfrachiseApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=2';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=2";

    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for healthcheckup.3........

  static getbannerhealthcheckupApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=3';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=3";
    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url.toString());
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for doctor..4.......

  static getbannerdoctorApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    var url = baseUrl + 'api/SignupApi/getBanner/?id=4';
    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
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

  ///todo: banner Api for driver..5.......

  static getbannerdriverApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    var url = baseUrl + 'api/SignupApi/getBanner/?id=5';
    //var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=1";
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

  ///todo: banner Api for nurse..6.......

  static getbannernurseApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    // var url = baseUrl + 'api/SignupApi/getBanner/?id=6';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=6";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for rwa..7.......

  static getbannerrawApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    // var url = baseUrl + 'api/SignupApi/getBanner/?id=7';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=7";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner Api for chemist.8........

  static getbannerchemistApi() async {
    //var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
    //var url = baseUrl + 'api/SignupApi/getBanner/?id=8';
    var url = "http://test.pswellness.in/api/SignupApi/getBanner/?id=8";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        BannerListModel bannerListModel = bannerListModelFromJson(r.body);
        return bannerListModel;
      }
    } catch (error) {
      return;
    }
  }

  ///get wallet ammount section..................................from gyros........
  static walletAmountApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince:${Id}');
    //var url = baseUrl + 'api/AdminApi/ListWalletMoney/27';
    //var url = baseUrl1 + 'api/AdminApi/ListWalletMoney/$Id';
    var url = baseUrl + 'api/Wallet/ListWalletMoney/$Id';

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        WalletModel? walletlist = walletModelFromJson(r.body);
        return walletlist;
      }
    } catch (error) {
      print('Error5');

      return;
    }
  }
  //

  ///wallet post api..........................................wallet......section.....
  static WalletPostApi(var UserId, var walletAmount) async {
    //var url = baseUrl1 + 'api/AdminApi/AddWalletMoney';
    var url = baseUrl + 'api/Wallet/AddWalletMoney';
    var prefs = GetStorage();
    // saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['Id']);
    Id = prefs.read("Id").toString();
    print('kjkjkljjkl:${Id}');
    //
    // token = prefs.read("token").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');

    var body = {
      // "UserId": UserId,
      "UserId": Id,
      "walletAmount": walletAmount,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      //  var prefs = GetStorage();
      // // saved id..........
      //  prefs.write("Id".toString(), json.decode(r.body)['Id']);
      //  Id = prefs.read("Id").toString();
      //  print('kjkjkljjkl:${Id}');
      // Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///wallet post update api..........................................11...april..2023....gyros..
  static WalletPostUpdateApi(var UserId, var walletAmount) async {
    var url = baseUrl + 'api/Wallet/UpdateWalletMoney';
    var prefs = GetStorage();
    // saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['Id']);
    Id = prefs.read("Id").toString();
    print('kjkjkljjkl:${Id}');
    //
    // token = prefs.read("token").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');

    var body = {
      // "UserId": UserId,
      "UserId": Id,
      "walletAmount": walletAmount,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///.............end of the wallet section...............from gyros...........

  ///list of doctor appointment history user section......
  static userdoctorApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usercartplus:${userid}');
    print(userid);
    var url =
        "http://test.pswellness.in/api/PatientApi/DoctorAptP?PatientId=$userid";
    // var url = "http://test.pswellness.in/api/PatientApi/ShowAppointMent?PatientId=137";
    //var url = baseUrl + "api/PatientApi/ShowAppointMent?PatientId=137";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print("doctoruserrr: ${url}");
      if (r.statusCode == 200) {
        UserDoctorAppointmentHistory? userdoctorappointment =
            userDoctorAppointmentHistoryFromJson(r.body);
        return userdoctorappointment;
      }
    } catch (error) {
      print("some errror ");
      return;
    }
  }

  ///todo: lab payment history..........by lab Id.......11 may 2023...prince..

  static LabpaymenthistoryApi() async {
    var prefs = GetStorage();
    userid = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&LabId:${userid}');
    print(userid);
    var url = "http://test.pswellness.in/api/LabApi/LabPayHis?Id=16";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print("labbbbbokokok:${r.body.toString()}");
      if (r.statusCode == 200) {
        var LabpaymentModel = labpaymentModelFromJson(r.body);
        return LabpaymentModel;
      }
    } catch (error) {
      print("errorlabbb:${error.toString()}");
      return;
    }
  }
}
