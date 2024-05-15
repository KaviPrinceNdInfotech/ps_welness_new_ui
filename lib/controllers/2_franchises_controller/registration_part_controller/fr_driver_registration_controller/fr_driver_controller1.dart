import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class Fr_Driver_1_Controller extends GetxController {
  final GlobalKey<FormState> frdriver1formkey = GlobalKey<FormState>();
  var selectedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  TextEditingController? panController,
      nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
      pinController,
      addressController,
      dlvaliditycontroller,
      dlNumber;

  var pan = '';
  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var DlValidity = '';

  var selectedDLImage1path = ''.obs;
  var selectedDLImage2path = ''.obs;
  var selectedAadharImage1path = ''.obs;
  var selectedAadharImage2path = ''.obs;
  var selectedprofileImagepath = ''.obs;

  void getDLImage1(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedDLImage1path.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  void getDLImage2(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedDLImage2path.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  void getAadharImage1(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedAadharImage1path.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  void getAadharImage2(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedAadharImage2path.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///todo: driver Profile prince 16 apr 2024..
  void getProfileImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedprofileImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  ///this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  ///
  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
  }

  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void FrenchiesDriverRegistration() async {
    isLoading(true);
    final Dl1imageAsBase64 =
        base64Encode(await File(selectedDLImage1path.value).readAsBytes());
    final Dl2imageAsBase64 =
        base64Encode(await File(selectedDLImage2path.value).readAsBytes());
    final Aadhar1imageAsBase64 =
        base64Encode(await File(selectedAadharImage1path.value).readAsBytes());
    final Aadhar2imageAsBase64 =
        base64Encode(await File(selectedAadharImage2path.value).readAsBytes());
    final ProfileimageAsBase64 =
        base64Encode(await File(selectedprofileImagepath.value).readAsBytes());
    //selectedprofileImagepath
    http.Response r = await ApiProvider.FrenchiesRegisterDriver(
      panController?.text,
      nameController?.text,
      passwordController?.text,
      mobileController?.text,
      emailController?.text,
      confirmpasswordController?.text,
      addressController?.text,
      dlNumber?.text,
      dlvaliditycontroller?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      selectedDLImage1path.value.split('/').last,
      Dl1imageAsBase64,
      selectedDLImage2path.value.split('/').last,
      Dl2imageAsBase64,
      selectedAadharImage1path.value.split('/').last,
      Aadhar1imageAsBase64,
      selectedAadharImage2path.value.split('/').last,
      Aadhar2imageAsBase64,
      pinController?.text,
      selectedprofileImagepath.value.split('/').last,
      ProfileimageAsBase64,
    );
    if (r.statusCode == 200) {
      Get.snackbar("Message", "${r.body}");

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
    panController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
    pinController = TextEditingController();
    addressController = TextEditingController();
    dlNumber = TextEditingController();
    dlvaliditycontroller = TextEditingController();
    dlvaliditycontroller?.text = "DL Validity";
  }

  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2060),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DL Validity',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Select date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      dlvaliditycontroller
        ?..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dlvaliditycontroller!.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
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

  String? validAddress(String value) {
    if (value.length < 2) {
      return "              This field is required";
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

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid pan number should be of 10 digits';
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

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length == 7) {
      return '              A valid pin number should be of 6 digits';
    }
    return null;
  }

  Future<void> checkDriver1() async {
    final isValid = frdriver1formkey.currentState!.validate();
    if (!isValid) {
      return;
    } else if (selectedState.value == '') {
      Get.snackbar("title", "Please Select State");
    } else if (selectedCity.value == '') {
      Get.snackbar("title", "Please Select City");
    } else if (selectedDLImage1path.value == '' ||
        selectedDLImage2path.value == '') {
      Get.snackbar("title", "Please Add DL image");
    } else if (selectedAadharImage1path.value == '' ||
        selectedAadharImage2path.value == '') {
      Get.snackbar("title", "Please Add Aadhar image");
    } else {
      FrenchiesDriverRegistration();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
      Get.snackbar("Message", "Registration successfull");
    }
    frdriver1formkey.currentState!.save();
  }
}
