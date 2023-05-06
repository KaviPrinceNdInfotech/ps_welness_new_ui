import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';

import '../../modules_view/circular_loader/circular_loaders.dart';
import '../../servicess_api/api_services_all_api.dart';

class Doctor_1_Controller extends GetxController {
  final GlobalKey<FormState> doctor1formkey = GlobalKey<FormState>();

  ///TODO: image picker.................
  ///
  var selectedImagepath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  //var Id= '';

  void doctorSignupApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.signDoctorUpApi(
      pinCodeController.text,
      idController.text,
      doctorNameController.text,
      phoneNumberController.text,
      mobileNumberController.text,
      emailIdController.text,
      stateMaster_IdController.text,
      cityMaster_IdController.text,
      locationController.text,
      licenceNumberController.text,
      clinicNameController.text,
      department_IdController.text,
      specialist_IdController.text,
      feeController.text,
      passwordController.text,
      confirmPasswordController.text,
      licenceBase64Controller.text,
      licenceImageNameController,
      licenceImageController.text,
      startTimeController.text,
      endTimeController.text,
      slotTimingController.text,
      startTime2Controller.text,
      endTime2Controller.text,
      slotTiming2Controller.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(DoctorHomePage());
    }
  }

  late TextEditingController pinCodeController,
      idController,
      doctorNameController,
      phoneNumberController,
      mobileNumberController,
      emailIdController,
      stateMaster_IdController,
      cityMaster_IdController,
      locationController,
      licenceNumberController,
      clinicNameController,
      department_IdController,
      specialist_IdController,
      feeController,
      passwordController,
      confirmPasswordController,
      licenceBase64Controller,
      licenceImageNameController,
      licenceImageController,
      startTimeController,
      endTimeController,
      slotTimingController,
      startTime2Controller,
      endTime2Controller,
      slotTiming2Controller;

  // late TextEditingController
  //
  // pinCodeController,
  //     idController,doctorNameController,phoneNumberController,mobileNumberController,emailIdController,
  //     stateMaster_IdController,cityMaster_IdController,locationController,licenceNumberController,
  //     clinicNameController,department_IdController,specialist_IdController,feeController,passwordController,confirmPasswordController,
  //     licenceBase64Controller,licenceImageNameController,licenceImageController,startTimeController,endTimeController,
  //     slotTimingController,startTime2Controller,endTime2Controller,slotTiming2Controller

  ///

  // pinCodeController,
  //     nameController,
  //     emailController,
  //     passwordController,
  //     confirmpasswordController,
  //     mobileController;

  var PinCode = '';
  var Id = '';
  var DoctorName = '';
  var PhoneNumber = '';
  var MobileNumber = '';
  var EmailId = '';
  var StateMaster_Id = '';
  var CityMaster_Id = '';
  var Location = '';
  var LicenceNumber = '';
  var ClinicName = '';
  var Department_Id = '';
  var Specialist_Id = '';
  var Fee = '';
  var Password = '';
  var ConfirmPassword = '';
  var LicenceBase64 = '';
  var LicenceImageName = '';
  var LicenceImage = '';
  var StartTime = '';
  var EndTime = '';
  var SlotTiming = '';
  var StartTime2 = '';
  var EndTime2 = '';
  var SlotTiming2 = '';

  @override
  void onInit() {
    super.onInit();
    states.refresh();

    pinCodeController = TextEditingController();
    idController = TextEditingController();
    doctorNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailIdController = TextEditingController();
    stateMaster_IdController = TextEditingController();
    cityMaster_IdController = TextEditingController();
    locationController = TextEditingController();
    licenceNumberController = TextEditingController();
    clinicNameController = TextEditingController();
    department_IdController = TextEditingController();
    specialist_IdController = TextEditingController();
    feeController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    licenceBase64Controller = TextEditingController();
    licenceImageNameController = TextEditingController();
    licenceImageController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    slotTimingController = TextEditingController();
    startTime2Controller = TextEditingController();
    endTime2Controller = TextEditingController();
    slotTiming2Controller = TextEditingController();

    ///
    // pinCodeController = TextEditingController();
    // nameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // confirmpasswordController = TextEditingController();
    // mobileController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // pinCodeController.dispose();
    // idController.dispose();
    // doctorNameController.dispose();
    // phoneNumberController.dispose();
    // mobileNumberController.dispose();
    // emailIdController.dispose();
    // stateMaster_IdController.dispose();
    // cityMaster_IdController.dispose();
    // locationController.dispose();
    // licenceNumberController.dispose();
    // clinicNameController.dispose();
    // department_IdController.dispose();
    // specialist_IdController.dispose();
    // feeController.dispose();
    // passwordController.dispose();
    // confirmPasswordController.dispose();
    // licenceBase64Controller.dispose();
    // licenceImageNameController.dispose();
    // licenceImageController.dispose();
    // startTimeController.dispose();
    // endTimeController.dispose();
    // slotTimingController.dispose();
    // startTime2Controller.dispose();
    // endTime2Controller.dispose();
    // slotTiming2Controller.dispose();

    ///

    // pinCodeController.dispose();
    // nameController.dispose();
    // emailController.dispose();
    // passwordController.dispose();
    // confirmpasswordController.dispose();
    // mobileController.dispose();
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
    ConfirmPassword = value;

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
    } else if (value != ConfirmPassword) {
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

  void checkDoctor1() {
    final isValid = doctor1formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    doctor1formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
