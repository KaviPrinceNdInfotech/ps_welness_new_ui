import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../model/1_user_model/states_model/state_modells.dart';
import '../../../servicess_api/api_services_all_api.dart';

class Lab_1_Controller extends GetxController {
  final GlobalKey<FormState> lab1formkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[];

  var selectedImagepath = ''.obs;

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  TextEditingController? nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
      phoneController,
      locationController,
      pinController,
      StateMaster_IdController,
      CityMaster_IdController,
      LicenceNumberController,
      LicenceImageController,
      LicenceImageBase64Controller,
      PanImageController,
      PanImageBase64Controller,
      StartTimeController,
      EndTimeController,
      GSTNumberController,
      AadharNumberController;

  void labSignupApi() async {
    http.Response r = await ApiProvider.LabSignupApi(
      nameController?.text,
      emailController?.text,
      passwordController?.text,
      confirmpasswordController?.text,
      mobileController?.text,
      phoneController?.text,
      locationController?.text,
      pinController?.text,
      StateMaster_IdController?.text,
      CityMaster_IdController?.text,
      LicenceNumberController?.text,
      LicenceImageController?.text,
      LicenceImageBase64Controller?.text,
      PanImageController?.text,
      PanImageBase64Controller?.text,
      StartTimeController?.text,
      LicenceImageController?.text,
      EndTimeController?.text,
      GSTNumberController?.text,
      //AadharNumberController?.text,
    );
    if (r.statusCode == 200) {
    } else {}
  }

  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var address = '';
  var pin = '';

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
    phoneController = TextEditingController();
    locationController = TextEditingController();
    pinController = TextEditingController();
    StateMaster_IdController = TextEditingController();
    CityMaster_IdController = TextEditingController();
    LicenceNumberController = TextEditingController();

    LicenceImageController = TextEditingController();
    LicenceImageBase64Controller = TextEditingController();
    PanImageController = TextEditingController();
    PanImageBase64Controller = TextEditingController();
    StartTimeController = TextEditingController();
    EndTimeController = TextEditingController();
    GSTNumberController = TextEditingController();
    AadharNumberController = TextEditingController();
    //nameController = TextEditingController()
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // nameController.dispose();
    //emailController.dispose();
    //passwordController.dispose();
    //confirmpasswordController.dispose();
    ///mobileController.dispose();
    ///addressController.dispose();
    ///pinController.dispose();
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
    } else if (value.length < 8) {
      return "              Password must be atleast 8 characters long";
    } else {
      return null;
    }
  }

  String? validConfirmPassword(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter New Password";
    } else if (value.length < 8) {
      return "              Password must be atleast 8 characters long";
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

  void checkUser1() {
    final isValid = lab1formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    lab1formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
