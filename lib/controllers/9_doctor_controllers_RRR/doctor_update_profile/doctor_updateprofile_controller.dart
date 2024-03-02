import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_profile_model.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class DoctorUpdateProfileController extends GetxController {
  ///this is for State....................................
  RxBool isLoading = false.obs;

  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  final GlobalKey<FormState> profiledoctorformkey = GlobalKey<FormState>();

  DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());

  DoctorProfile? doctorProfile;

  TextEditingController?
      //idEditText,
      doctorNameEditText,
      mobileNumberEditText,
      stateIdEditText,
      cityIdEditText,
      locationEditText,
      pinCodeEditText,
      clinicNameEditText,
      feeEditText;
  // adminLogin_id
  // accountnoEditText,
  // ifscCodeEditText,
  // branchNameEditText;
  /////////dropdown dependent state city
  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void clearSelectedState() {
    selectedState.value = null;
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void doctorUpdateProfileApi() async {
    http.Response r = await ApiProvider.DoctorUpdateProfile(
        // idEditText?.text,
        doctorNameEditText?.text,
        mobileNumberEditText?.text,
        selectedState.value?.id.toString() ??
            _doctorProfileControllers.doctorProfile?.stateMasterId,
        selectedCity.value?.id.toString() ??
            _doctorProfileControllers.doctorProfile?.cityMasterId,
        locationEditText?.text,
        pinCodeEditText?.text,
        clinicNameEditText?.text,
        feeEditText?.text
        //adminLogin_id?.text,
        //accountnoEditText?.text,
        //ifscCodeEditText?.text,
        //branchNameEditText?.text
        );

    if (r.statusCode == 200) {
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(DoctorHomePage());
      await Future.delayed(Duration(milliseconds: 900));
      await _doctorProfileControllers.doctorprofileApi();
    } else {}
  }

  @override
  void onInit() {
    ///super.onInit();
    getStateApi();
    //states.refresh();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    //idEditText = TextEditingController(text: '143');
    //        text: "${_userprofile.userProfile?.patientName.toString() ?? 0}");
    doctorNameEditText = TextEditingController(
        text:
            "${_doctorProfileControllers.doctorProfile?.doctorName.toString() ?? 0}");
    mobileNumberEditText = TextEditingController(
        text:
            "${_doctorProfileControllers.doctorProfile?.mobileNumber.toString() ?? 0}");
    stateIdEditText = TextEditingController(text: '');
    cityIdEditText = TextEditingController(text: '');
    locationEditText = TextEditingController(
        text:
            "${_doctorProfileControllers.doctorProfile?.location.toString() ?? 0}");
    pinCodeEditText = TextEditingController(text: '');
    clinicNameEditText = TextEditingController(
        text:
            "${_doctorProfileControllers.doctorProfile?.clinicName.toString() ?? 0}");
    feeEditText = TextEditingController(text: '');

    super.onInit();

    //adminLogin_id = TextEditingController(text: '1024');
    //accountnoEditText = TextEditingController(text: '12345674567');
    //ifscCodeEditText = TextEditingController(text: 'UCBO005654');
    //branchNameEditText = TextEditingController(text: 'UCO');
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (!value.contains('@')) {
      return "              A valid email should contain '@'";
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return "              Please enter a valid email";
    }
    return null;
  }

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
    }
    return null;
  }

  String? validLocation(String value) {
    if (value.length < 2) {
      return "              Provide valid location";
    }
    return null;
  }

  String? validFees(String value) {
    if (value.length < 2) {
      return "              Provide valid Fees";
    }
    return null;
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin should be of 6 digits';
    }
    return null;
  }

  String? validAccount(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 9) {
      return '              Provide valid account no.';
    }
    return null;
  }

  String? validIfsc(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 4) {
      return '              Provide valid IFSC code.';
    }
    return null;
  }

  String? validBranch(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  void checkDoctorUpdateProfile() {
    if (profiledoctorformkey.currentState!.validate()) {
      doctorUpdateProfileApi();
    }
    profiledoctorformkey.currentState!.save();
  }
}
//
//   void checkDoctorUpdateProfile() {
//     doctorUpdateProfileApi();
//   }
// }
