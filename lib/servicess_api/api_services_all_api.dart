import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/test_name_model/test_name_modells.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_appointment_details_list.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/patient_list.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';
import 'package:ps_welness_new_ui/model/franchies_models/franchies_specialist.dart';
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

import '../model/1_user_model/city_model/city_modelss.dart';
import '../model/1_user_model/doctor_list_byhospitalid/doctor_list_through_api.dart';
import '../model/1_user_model/get_department_list_model/department_model.dart';
import '../model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import '../model/1_user_model/health_checkup_list/health_checkup_list.dart';
import '../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
import '../model/1_user_model/lab_list_models.dart';
import '../model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
import '../model/1_user_model/medicine_list_model/medicine_list_models.dart';
import '../model/1_user_model/nurse_location_model/nurse_location_models.dart';
import '../model/1_user_model/nurse_type_model/nurse_type_model.dart';
import '../model/1_user_model/states_model/state_modells.dart';
import '../model/9_doctors_model/doctor_payment_history.dart';
import '../model/9_doctors_model/doctor_profile_model.dart';
import '../model/9_doctors_model/get_all_skils_model/get_all_skils_model.dart';
import '../model/9_doctors_model/view_patient_report_model.dart';
import '../modules_view/circular_loader/circular_loaders.dart';

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
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

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

  static ChangePasswordApi(
      var ID,
      var Password,
      var ConfirmPassword
      ) async {
    var url = baseUrl + 'api/SignupApi/ChangePassword';
    var prefs = GetStorage();
    //saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['data']['Id']);
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

    var body = {
      "ID":Id.toString(),
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
        "http://test.pswellness.in/api/NurseAppointmentAPI/NurseAppointmentList?NurseId=56";
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
    var url = "http://test.pswellness.in/api/DoctorApi/ViewPatientList?DoctorId=151";
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
  static Addtocartmedicineapi( MedicineId,Quantity) async {
    var url = baseUrl + 'api/PatientMedicine/AddMedicineToCart';
    var prefs = GetStorage();
    //saved id..........
    final PatientId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');
    // token = prefs.read("token").toString();

    var body = {
      "PatientId": PatientId,
      "MedicineId": MedicineId,
      "Quantity":Quantity,
    };
   // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r =
    await http.post(Uri.parse(url), body: body,);
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
    var url =
        "http://test.pswellness.in/api/PatientMedicine/GetMedicines";
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
        GetskillsModel? viewSkilsReport =
        getskillsModelFromJson(r.body);
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
    }else if (r.statusCode == 500) {
      Get.snackbar('message', r.body);
    }
    else {
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




  // static ViewLabApi() async {
  //    var url = "http://pswellness.in/api/LabApi/LabsList?CityId=786";
  //    try {
  //      http.Response r = await http.get(Uri.parse(url));
  //      print(r.body.toString());
  //      if (r.statusCode == 200) {
  //        var LabListUser = labListUserFromJson(r.body);
  //        return LabListUser;
  //      }
  //    }
  //       catch (error) {
  //      return;
  //
  //       }
  //    }
}

///Todo: from here we can do dynamic id in the url............
// static Future<List<SpecialistModel>> getSpeaclistbyIdApi(String depId) async {
// var url =
// "http://test.pswellness.in/api/CommonApi/GetSpecialist?depId=$depId";
// //"http://test.pswellness.in/api/CommonApi/GetCitiesByState?stateId=$stateID";
// try {
// http.Response r = await http.get(Uri.parse(url));
// print(r.body.toString());
// if (r.statusCode == 200) {
// var speclistData = getspecialistdeptbyIdFromJson(r.body);
// return speclistData.specialist;
// } else {
// return [];
// }
// } catch (error) {
// return [];
// }
// }