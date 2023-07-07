import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class Doctor_1_Controller extends GetxController {
  final GlobalKey<FormState> doctor11formkey = GlobalKey<FormState>();

  ///TODO: image picker.................
  ///
  var selectedImagepath = ''.obs;
  var selectedStartTime = TimeOfDay.now().obs;
  var selectedEndTime = TimeOfDay.now().obs;
  var selectedSlotTime = TimeOfDay.now().obs;

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
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
  }

  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void doctorSignupApi() async {
    CallLoader.loader();
    final licenceImageAsBase64 =
        base64Encode(await File(selectedImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.signDoctorUpApi(
        doctorNameController?.text,
        emailIdController?.text,
        passwordController?.text,
        confirmPasswordController?.text,
        mobileNumberController?.text,
        feeController?.text,
        phoneNumberController?.text,
        selectedStartTime.value.toString(),
        selectedSlotTime.value.hour,
        departmentIdController?.text,
        specialistIdController?.text,
        licenceNumberController?.text,
        selectedImagepath.value.split('/').last,
        pinCodeController?.text,
        clinicNameController?.text,
        locationController?.text,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        selectedEndTime.value.hour,
        licenceImageAsBase64);
    if (r.statusCode == 200) {
      Get.to(SignInScreen());
      CallLoader.hideLoader();
    } else {
      CallLoader.hideLoader();
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

  chooseEndTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedEndTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');

    if (pickedTime != null && pickedTime != selectedEndTime.value) {
      selectedEndTime.value = pickedTime;
    }
  }

  chooseStartTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedStartTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');

    if (pickedTime != null && pickedTime != selectedStartTime.value) {
      selectedStartTime.value = pickedTime;
    }
  }

  chooseSlotTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedSlotTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');

    if (pickedTime != null && pickedTime != selectedSlotTime.value) {
      selectedSlotTime.value = pickedTime;
    }
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
