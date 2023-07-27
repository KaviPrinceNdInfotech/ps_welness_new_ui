import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';

import '../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../model/1_user_model/states_model/state_modells.dart';
import '../../../servicess_api/api_services_all_api.dart';

class Lab_1_Controller extends GetxController {
  final GlobalKey<FormState> lab1formkey = GlobalKey<FormState>();

  var selectedTime = TimeOfDay.now().obs;
  var selectedTime2 = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[];

  var selectedImagepath = ''.obs;
  var selectedPath = ''.obs;
  RxInt selectedimg1 = 0.obs;
  var selectedPath1 = ''.obs;

  RxInt selectedimg2 = 0.obs;
  var selectedPath2 = ''.obs;

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
      selectedPath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  var selectedImagepath1 = ''.obs;

  void getImage1(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPath1.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime.value,
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

    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  ///time 2...................

  chooseTime2() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime2.value,
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
    if (pickedTime != null && pickedTime != selectedTime2.value) {
      selectedTime2.value = pickedTime;
    }
  }

  TextEditingController? nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
      phoneController,
      locationController,
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
      AadharNumberController,
      pinController;

  ///lab_signup Api....15 may 2023...

  void labSignupApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644113221:${imageAsBase64}");
    final imageAsBase641 =
        base64Encode(await File(selectedPath1.value).readAsBytes());
    print("imagebaseeee64411122:${imageAsBase641}");

    http.Response r = await ApiProvider.LabSignupApi(
        nameController?.text,
        emailController?.text,
        passwordController?.text,
        confirmpasswordController?.text,
        mobileController?.text,
        phoneController?.text,
        locationController?.text,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        LicenceNumberController?.text,
        selectedPath.value.split('/').last,
        imageAsBase64,
        selectedPath1.value.split('/').last,
        imageAsBase641,
        StartTimeController?.text,
        EndTimeController?.text,
        GSTNumberController?.text,
        AadharNumberController?.text,
        pinController?.text

        ///
        );
    if (r.statusCode == 200) {
      ///todo: from here we have new thing to provide the main ....
      //Get.to(LabHomePage());
      Get.snackbar('message', "${r.body}");
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(SignInScreen());
    } else {}
  }

  var labName = '';
  var emailId = '';
  var password = '';
  var confirmPassword = '';
  var mobileNumber = '';
  var phoneNumber = '';
  var location = '';
  var stateMaster_Id = '';
  var cityMaster_Id = '';
  var licenceNumber = '';
  var licenceImage = '';
  var licenceImageBase64 = '';
  var panImage = '';
  var panImageBase64 = '';
  var startTime = '';
  var endTime = '';
  var gSTNumber = '';
  var aadharNumber = '';
  var pinCode = '';

  @override
  void onInit() {
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    //states.refresh();
    super.onInit();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
    phoneController = TextEditingController();
    locationController = TextEditingController();
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
    pinController = TextEditingController();
    super.onInit();

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
    confirmPassword = value;

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
    } else if (value != confirmPassword) {
      return "              Password must be same as above";
    } else {
      return null;
    }
  }

  String? validMobile(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid mobile number should be of 10 digits';
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

  String? validaadhar(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 12) {
      return '              A valid aadhaar should be of 12 digits';
    }
    return null;
  }

  String? validcertificate(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  void checklab1() {
    if (lab1formkey.currentState!.validate()) {
      labSignupApi();
    }
    lab1formkey.currentState!.save();
  }
}
