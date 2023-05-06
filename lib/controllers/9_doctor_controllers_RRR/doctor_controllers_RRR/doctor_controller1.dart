import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import '../../modules_view/circular_loader/circular_loaders.dart';
//import '../../servicess_api/api_services_all_api.dart';

class Doctor_1_Controller extends GetxController {
  final GlobalKey<FormState> doctor11formkey = GlobalKey<FormState>();

  ///TODO: image picker.................
  ///
  var selectedImagepath = ''.obs;

  TextEditingController? idController,
      doctorNameController,
      emailIdController,
      passwordController,
      confirmPasswordController,
      mobileNumberController,
      feeController,
      phoneNumberController,
      startTimeController,
      slotTimingController,
      departmentIdController,
      specialistIdController,
      licenceNumberController,
      licenceImageController,
      licenceImageNameController,
      pinCodeController,
      clinicNameController,
      locationController,
      stateMaster_IdController,
      cityMaster_IdController,
      endTimeController,
      licenceBase64Controller;

  var Id = '';
  var DoctorName = '';
  var EmailId = '';
  var Password = '';
  var ConfirmPassword = '';
  var MobileNumber = '';
  var Fee = '';
  var PhoneNumber = '';
  var StartTime = '';
  var SlotTiming = '';
  var Department_Id = '';
  var Specialist_Id = '';
  var LicenceNumber = '';
  var LicenceImage = '';
  var LicenceImageName = '';
  var PinCode = '';
  var ClinicName = '';
  var Location = '';
  var StateMaster_Id = '';
  var CityMaster_Id = '';
  var EndTime = '';
  var LicenceBase64 = '';

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
  void doctorSignupApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.signDoctorUpApi(
        //22
        idController?.text,
        doctorNameController?.text,
        emailIdController?.text,
        passwordController?.text,
        confirmPasswordController?.text,
        mobileNumberController?.text,
        feeController?.text,
        phoneNumberController?.text,
        startTimeController?.text,
        slotTimingController?.text,
        departmentIdController?.text,
        specialistIdController?.text,
        licenceNumberController?.text,
        licenceImageController?.text,
        licenceImageNameController?.text,
        pinCodeController?.text,
        clinicNameController?.text,
        locationController?.text,
        stateMaster_IdController?.text,
        cityMaster_IdController?.text,
        endTimeController?.text,
        licenceBase64Controller?.text);
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
    } else {
      CallLoader.hideLoader();
    }
  }

  @override
  void onInit() {
    super.onInit();
    states.refresh();
    //22 textfield
    idController = TextEditingController(text: '143');
    doctorNameController = TextEditingController(text: 'ramkkkkkkkssssingh');
    emailIdController = TextEditingController(text: 'ram@gmail.com');
    passwordController = TextEditingController(text: '12345');
    confirmPasswordController = TextEditingController(text: '12345');
    mobileNumberController = TextEditingController(text: '6853064834');
    feeController = TextEditingController(text: '100');
    phoneNumberController = TextEditingController(text: '6378028261');
    startTimeController = TextEditingController(text: '01:50:00.0000000');
    slotTimingController = TextEditingController(text: '5');
    departmentIdController = TextEditingController(text: '1');
    specialistIdController = TextEditingController(text: '3');
    licenceNumberController = TextEditingController(text: '12345');
    licenceImageController = TextEditingController(text: 'healt.jpeg');
    licenceImageNameController = TextEditingController(text: 'healt.jpeg');
    pinCodeController = TextEditingController(text: '206122');
    clinicNameController = TextEditingController(text: '2545');
    locationController =
        TextEditingController(text: 'Saket, New Delhi, Delhi, India');
    stateMaster_IdController = TextEditingController(text: '3');
    cityMaster_IdController = TextEditingController(text: '4');
    endTimeController = TextEditingController(text: '14:27:00.0000000');
    licenceBase64Controller = TextEditingController(text: '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    idController?.dispose();
    doctorNameController?.dispose();
    emailIdController?.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    mobileNumberController?.dispose();
    feeController?.dispose();
    phoneNumberController?.dispose();
    startTimeController?.dispose();
    slotTimingController?.dispose();
    departmentIdController?.dispose();
    specialistIdController?.dispose();
    licenceNumberController?.dispose();
    licenceImageController?.dispose();
    licenceImageNameController?.dispose();
    pinCodeController?.dispose();
    clinicNameController?.dispose();
    locationController?.dispose();
    stateMaster_IdController?.dispose();
    cityMaster_IdController?.dispose();
    endTimeController?.dispose();
    licenceBase64Controller?.dispose();
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
    //  final isValid = doctor11formkey.currentState?.validate();
    // if (!isValid) {
    //   return;
    // }
    // doctor11formkey.currentState!.save();
    doctorSignupApi();
    //Get.to(() => HomePage());
  }
}
