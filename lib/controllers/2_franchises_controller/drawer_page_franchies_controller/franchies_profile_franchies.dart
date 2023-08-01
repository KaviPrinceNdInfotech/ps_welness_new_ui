import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class DraweerFranchiesProfileController extends GetxController {
  final GlobalKey<FormState> drawerfranchiesprofileformkey =
      GlobalKey<FormState>();
  late TextEditingController CompanyName,
      MobileNumber,
      StateId,
      CityId,
      Location,
      PinCode;

  ///this is for State....................................
  Rx<City?> selectedCityy = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel>? states = <StateModel>[].obs;

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void frenchiesEditProfileApi() async {
    http.Response r = await ApiProvider.FrenchiesEditProfile(
        CompanyName.text,
        MobileNumber.text,
        selectedState.value?.id.toString(),
        selectedCityy.value?.id.toString(),
        Location.text,
        PinCode.text);
    if (r.statusCode == 200) {}
  }

  var name = '';
  var email = '';
  var mobile = '';
  var location = '';
  var fees = '';
  var pin = '';
  var account = '';
  var ifsc = '';
  var branch = '';

  @override
  void onInit() {
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    CompanyName = TextEditingController();
    MobileNumber = TextEditingController();
    Location = TextEditingController();
    PinCode = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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

  void checkFrenchiesEditProfilee() {
    final isValid = drawerfranchiesprofileformkey.currentState!.validate();
    frenchiesEditProfileApi();
    if (!isValid) {
      return;
    }
    drawerfranchiesprofileformkey.currentState!.save();
  }
}
