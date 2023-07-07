import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../model/1_user_model/states_model/state_modells.dart';
import '../../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

class LabProfileUpdateController extends GetxController {
  final GlobalKey<FormState> labprofileupdateformkey = GlobalKey<FormState>();

  ///this is for state.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  ///this is for city....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  ///todo:state get drop down...api..
  ///get state api.........

  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
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
  void labupdateApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.Labprofileupdate(
      idController.text,
      labNameController.text,
      MobileNumberController.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      LocationController.text,
      PinCodeController.text,
      adminLogin_idController.text,
      AccountNoController.text,
      IFSCCodeController.text,
      BranchNameController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(LabHomePage());
    }
  }

  ///

  late TextEditingController idController,
      labNameController,
      //emailController,
      MobileNumberController,
      LocationController,
      PinCodeController,
      adminLogin_idController,
      AccountNoController,
      IFSCCodeController,
      BranchNameController;

// var id = '';
  //var adminLogin_id = '';
  var labName = '';
  // var email = '';
  var MobileNumber = '';
  var Location = '';
  var PinCode = '';
  var pin = '';
  var AccountNo = '';
  var IFSCCode = '';
  var BranchName = '';

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    idController = TextEditingController();
    labNameController = TextEditingController(text: 'Mrs Ak Singh');
    //emailController = TextEditingController();
    MobileNumberController = TextEditingController(text: '9888776655');
    LocationController = TextEditingController(text: 'Palam');
    //feesController = TextEditingController(text: '2000');
    PinCodeController = TextEditingController(text: '119999');
    AccountNoController = TextEditingController(text: '4898666666');
    IFSCCodeController = TextEditingController(text: '149ONSBI');
    BranchNameController = TextEditingController(text: 'IDBI');
    adminLogin_idController = TextEditingController();

    getStateLabApi();

    //states.refresh();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    labNameController.dispose();
    //emailController.dispose();
    MobileNumberController.dispose();
    LocationController.dispose();
    // feesController.dispose();
    PinCodeController.dispose();
    AccountNoController.dispose();
    IFSCCodeController.dispose();
    BranchNameController.dispose();
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

  void checkLAbProfilee() {
    if (labprofileupdateformkey.currentState!.validate()) {
      labupdateApi();
    }
    labprofileupdateformkey.currentState!.save();
  }
}
