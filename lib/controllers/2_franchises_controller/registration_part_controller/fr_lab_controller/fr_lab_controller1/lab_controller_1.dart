import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup2/lab_signup_2.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class Fr_Lab_1_Controller extends GetxController {
  final GlobalKey<FormState> frlab1formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> frlab2formkey = GlobalKey<FormState>();
 RxBool isLoading = false.obs;
  var  selectedLicenceImagepath = ''.obs;
  var selectedPanImagepath = ''.obs;
  var selectedTime = TimeOfDay.now().obs;
  var selectedTime2 = TimeOfDay.now().obs;
   TextEditingController? nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
      addressController,
      pinController,
      aadhaarController,
    certificateController,
    gstNoController;


  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var address = '';
  var pin = '';
  var aadhar = '';
  var certificateno = '';

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
  void getLicenceImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedLicenceImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }
  void getPanImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPanImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }
  void frenchiesRegisterLab()async{
    isLoading(true);
    final licenceimageAsBase64 = base64Encode(await File(selectedLicenceImagepath.value).readAsBytes());
    final panimageAsBase64 = base64Encode(await File(selectedPanImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesRegisterLab(
      nameController?.text,
      emailController?.text,
      passwordController?.text,
      confirmpasswordController?.text,
      mobileController?.text,
      addressController?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      pinController?.text,
      certificateController?.text,
      selectedLicenceImagepath.value.split('/').last,
      licenceimageAsBase64,
      selectedPanImagepath.value.split('/').last,
      panimageAsBase64,
      gstNoController?.text,
      aadhaarController?.text,
      selectedTime.value.toString(),
      selectedTime2.value.toString()
    );
    if(r.statusCode == 200){
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
    }
    );
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
    addressController = TextEditingController();
    pinController = TextEditingController();
    aadhaarController = TextEditingController();
    certificateController = TextEditingController();
    gstNoController = TextEditingController();
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
  ///time 1........................
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
  //
  String? validcertificate(String value) {
    if (value.length < 2) {
      return "              Provide valid Licence number";
    }
    return null;
  }
  String? validaadhar(String value) {
    if (value.length < 2) {
      return "              Provide valid Aadhar number";
    }
    return null;
  }

  void checkLab() {
    final isValid = frlab1formkey.currentState!.validate();
    if (isValid) {
      Get.to(FrLabSignup2());
      return;
    }
    frlab1formkey.currentState!.save();
  }
  void checkLab2() {
    final isValid = frlab2formkey.currentState!.validate();
    if (isValid && selectedLicenceImagepath.value != '' && selectedPanImagepath.value != '') {
      frenchiesRegisterLab();
      return;
    }else{
      Get.snackbar("title", "Please fill all data and image");
    }
    frlab1formkey.currentState!.save();
  }
}
