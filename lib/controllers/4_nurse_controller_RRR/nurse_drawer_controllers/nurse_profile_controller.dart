import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../../../servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class NurseProfileController extends GetxController {
  final GlobalKey<FormState> nurseprofileformkey = GlobalKey<FormState>();

  ///todo nurse controller working here...........................
  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;
  /////////do here......................
  Rx<City?> selectedCityy = (null as City?).obs;
  RxList<City> citiess = <City>[].obs;
  Rx<StateModel?> selectedStatee = (null as StateModel?).obs;
  List<StateModel> statess = <StateModel>[];

  void getStateApi() async {
    statess = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    citiess.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    citiess.addAll(localList);
  }

  TextEditingController? idController,
      nameController,
      mobileController,
      locationController,
      pinController,
      clinicNameController,
      feeController,
      adminLoginIdController,
      accountnoController,
      ifscController,
      branchNameController;

  void nurseEditProfileApi() async {
    http.Response r = await ApiProvider.NurseEditProfileApi(
        idController?.text,
        nameController?.text,
        mobileController?.text,
        selectedStatee.value?.id.toString(),
        selectedCityy.value?.id.toString(),
        locationController?.text,
        pinController?.text,
        clinicNameController?.text,
        feeController?.text,
        adminLoginIdController?.text,
        accountnoController?.text,
        ifscController?.text,
        branchNameController?.text);
    if (r.statusCode == 200) {
    } else {}
  }

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    getStateApi();
    selectedStatee.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    idController = TextEditingController(text: '64');
    nameController = TextEditingController(text: 'smya');
    mobileController = TextEditingController(text: '6398028236');
    locationController = TextEditingController(text: 'Palam');
    pinController = TextEditingController(text: '119999');
    clinicNameController = TextEditingController(text: 'rahul');
    feeController = TextEditingController(text: '2000');
    adminLoginIdController = TextEditingController(text: '1024');
    accountnoController = TextEditingController(text: '4898666666');
    ifscController = TextEditingController(text: '149ONSBI');
    branchNameController = TextEditingController(text: 'Hdfc');
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

  void checkProfilee() {
    nurseEditProfileApi();
    // final isValid = nurseprofileformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // nurseprofileformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
