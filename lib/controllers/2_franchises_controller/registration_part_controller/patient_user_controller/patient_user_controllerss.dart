import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class Patients_Controller extends GetxController {
  final GlobalKey<FormState> patientformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  ///this is for State....................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  TextEditingController? nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
      addressController,
      pinController;

  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var address = '';
  var pin = '';
  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
  }

  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void frenchiesRegisterPatientApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesRegisterPatient(
      nameController?.text,
      mobileController?.text,
      emailController?.text,
      passwordController?.text,
      confirmpasswordController?.text,
      addressController?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      pinController?.text,
    );
    if (r.statusCode == 200) {
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStateLabApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
    addressController = TextEditingController();
    pinController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    confirmpasswordController?.dispose();
    mobileController?.dispose();
    addressController?.dispose();
    pinController?.dispose();
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

  String? validPassword(String value) {
    confirmpassword = value;

    if (value.isEmpty) {
      return "              Please Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else {
      return null;
    }
  }

  String? validConfirmPassword(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else if (value != confirmpassword) {
      return "              Password must be same as above";
    } else {
      return null;
    }
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

  String? validAddress(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
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

  Future<void> checkpatient() async {
    final isValid = patientformkey.currentState!.validate();
    frenchiesRegisterPatientApi();
    CallLoader.loader();
    await Future.delayed(Duration(milliseconds: 900));
    CallLoader.hideLoader();
    Get.offAll(FranchiesHomePage());
    if (!isValid) {
      return;
    }
    patientformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
