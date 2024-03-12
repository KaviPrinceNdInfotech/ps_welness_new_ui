import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import '../../modules_view/circular_loader/circular_loaders.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> profileformkey = GlobalKey<FormState>();
  UserProfileControllers _userprofile = Get.put(UserProfileControllers());

  ///this is for state.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  ///this is for city....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for subject type.................................
  // Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient).obs;
  // List<Complaint41Patient> subject = <Complaint41Patient>[].obs;
  //this is for subject type.................................
  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient?).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;

  ///todo: complain subject type.........................25april...2023..

  ///nurse type api class.................
  void getcomplainTypeApi() async {
    subject = await ApiProvider.getsubjecttypeApi();
    print('Prince lab test  list');
    print(subject);
  }

  ///todo:state get drop down...api..
  ///get state api.........

  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  void clearSelectedState() {
    selectedState.value = null;
  }

  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  ///user update profile.......26 april 2023....
  void userupdateApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.Userprofileupdate(
      //idController.text,
      patientNameController.text,
      emailController.text,
      MobileNumberController.text,
      selectedState.value?.id.toString() ??
          _userprofile.userProfile?.stateMasterId,
      selectedCity.value?.id.toString() ??
          _userprofile.userProfile?.cityMasterId,
      LocationController.text,
      PinCodeController.text,
      //adminLogin_idController.text,
      //AccountNoController.text,
      // IFSCCodeController.text,
      //BranchNameController.text,
    );

    if (r.statusCode == 200) {
      // CallLoader.hideLoader();

      var data = jsonDecode(r.body);
      //_userprofile.update();
      //_userprofile.userprofileApi();
      //  _userprofile.onInit();
      ///CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      // CallLoader.hideLoader();
      /// we can navigate to user page.....................................
      Get.offAll(UserHomePage());
      await Future.delayed(Duration(milliseconds: 900));
      await _userprofile.userprofileApi();
      clearSelectedState();
    } else {
      Get.snackbar('Error', "Please fill correctly");
    }
  }

  late TextEditingController idController,
      patientNameController,
      emailController,
      MobileNumberController,
      LocationController,
      PinCodeController,
      adminLogin_idController,
      AccountNoController,
      IFSCCodeController,
      BranchNameController;

  // var id = '';
  //var adminLogin_id = '';
  var patientName = '';
  var email = '';
  var MobileNumber = '';
  var Location = '';
  var PinCode = '';
  var pin = '';
  var AccountNo = '';
  var IFSCCode = '';
  var BranchName = '';

  @override
  void onInit() {
    getStateLabApi();
    //states.refresh();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    patientNameController = TextEditingController(
        text: "${_userprofile.userProfile?.patientName.toString() ?? 0}");
    print("dfdfdfd${_userprofile.userProfile?.patientName.toString()}");
    emailController = TextEditingController(
        text: "${_userprofile.userProfile?.emailId.toString() ?? 0}");
    MobileNumberController = TextEditingController(
        text: "${_userprofile.userProfile?.mobileNumber.toString() ?? 0}");
    LocationController = TextEditingController(
        text: "${_userprofile.userProfile?.location.toString() ?? 0}");
    adminLogin_idController =
        TextEditingController(text: "${_userprofile.userProfile?.id ?? 0}");
    PinCodeController = TextEditingController(
        text: "${_userprofile.userProfile?.pincode.toString() ?? 0}");
    AccountNoController = TextEditingController(text: '9898666666');
    IFSCCodeController = TextEditingController(text: '999ONSBI');
    BranchNameController = TextEditingController(text: 'SBI');
    idController = TextEditingController();

    super.onInit();

    // selectedDepartment.listen((p0) {
    //   if (p0 != null) {
    //     getspecialistByDeptID("${p0.id}");
    //   }
    // }
    //);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // patientNameController.dispose();
    // // emailController.dispose();
    // MobileNumberController.dispose();
    // LocationController.dispose();
    // PinCodeController.dispose();
    // AccountNoController.dispose();
    // IFSCCodeController.dispose();
    // BranchNameController.dispose();
    // adminLogin_idController.dispose();
    // idController.dispose();
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

  void checkProfilee() {
    if (profileformkey.currentState!.validate()) {
      userupdateApi();
    }
    profileformkey.currentState!.save();
  }
}
