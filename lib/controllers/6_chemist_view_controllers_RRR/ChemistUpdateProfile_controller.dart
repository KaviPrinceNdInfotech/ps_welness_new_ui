import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../../../servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';

import '../../modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class ChemistUpdateProfileController extends GetxController {
  final GlobalKey<FormState> nurseprofileformkey = GlobalKey<FormState>();

  /////////do here......................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[];

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  TextEditingController?
      //idController,
      nameController,
      mobileController,
      locationController,
      pinController,
      //adminLoginIdController,
      accountnoController,
      ifscController,
      branchNameController;

  void chemistUpdateProfileApi() async {
    http.Response r = await ApiProvider.ChemistUpdateProfileApi(
        // idController?.text,
        nameController?.text,
        mobileController?.text,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        locationController?.text,
        pinController?.text,
        //adminLoginIdController?.text,
        accountnoController?.text,
        ifscController?.text,
        branchNameController?.text);
    if (r.statusCode == 200) {
      Get.to(ChemistHomePage());
    } else {}
  }

  @override
  void onInit() {
    // states.refresh();
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    //idController = TextEditingController(text: '');
    nameController = TextEditingController(text: '');
    mobileController = TextEditingController(text: '');
    locationController = TextEditingController(text: '');
    pinController = TextEditingController(text: '');
    //adminLoginIdController = TextEditingController(text: '');
    accountnoController = TextEditingController(text: '');
    ifscController = TextEditingController(text: '');
    branchNameController = TextEditingController(text: '');
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

  void checkUpdateProfile() {
    chemistUpdateProfileApi();
  }
}