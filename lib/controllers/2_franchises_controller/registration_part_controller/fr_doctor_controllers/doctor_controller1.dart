import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FrDoctor_1_Controller extends GetxController {
  final GlobalKey<FormState> frdoctor1formkey = GlobalKey<FormState>();
    RxBool isLoading = false.obs;
   TextEditingController? doctorNameController, emailController, passwordController, confirmPasswordController,
       mobileNumberController, phoneController,
   clinicNameController, stateIdController, cityIdController, locationController, licenceImageController,
       licenceBase64Controller, licenceNumberController,
   licenceValidityController, pinController, panImageController, panImageBase64Controller,
       SlotTimeController, startTimeController, endTimeController, SlotTime2Controller, StartTime2Controller,
       EndTime2Controller;

  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var phone = '';
  var clinic_name = '';
  var aadhar = '';
  var address = '';
  var certificateno = '';
  var certificatevelidity = '';

  var selectedLicenceImagepath = ''.obs;
  var selectedPanImagepath = ''.obs;
  var selectedTime = TimeOfDay.now().obs;
  var selectedTime2 = TimeOfDay.now().obs;
  var selectedTime3 = TimeOfDay.now().obs;
  var selectedTime4 = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;

  void getLicenceImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedLicenceImagepath.value = pickedFile.path;
    } else {
    }
  }
  void getPanImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPanImagepath.value = pickedFile.path;
    } else {
    }
  }
  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  ///this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;
  //slot timing
  Rx<String?> selectedSlot = (null as String?).obs;
  RxList<String> slots = <String>[].obs;
  Rx<String?> selectedSlot1 = (null as String?).obs;
  RxList<String> slots1 = <String>[].obs;
  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
  }
  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }


  void FrenchiesDoctorRegistration()async{
    isLoading(true);
    final licenceimageAsBase64 = base64Encode(await File(selectedLicenceImagepath.value).readAsBytes());
    final PanImageAsBase64 = base64Encode(await File(selectedPanImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesRegisterDoctor(
        doctorNameController?.text,
        emailController?.text,
        passwordController?.text,
        confirmPasswordController?.text,
        mobileNumberController?.text,
        phoneController?.text,
        clinicNameController?.text,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        locationController?.text,
        selectedLicenceImagepath.value.split('/').last,
        licenceimageAsBase64,
        licenceNumberController?.text,
        licenceValidityController?.text,
        pinController?.text,
        selectedPanImagepath.value.split('/').last,
        PanImageAsBase64,
        SlotTimeController?.text,
        startTimeController?.text,
        endTimeController?.text,
        SlotTime2Controller?.text,
        StartTime2Controller?.text,
        EndTime2Controller?.text
    );
    if(r.statusCode == 200){
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getStateLabApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    }
    );
    doctorNameController = TextEditingController(text: '');
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    confirmPasswordController = TextEditingController(text: '');
    mobileNumberController = TextEditingController(text: '');
    phoneController = TextEditingController(text: '');
    clinicNameController = TextEditingController(text: '');
    stateIdController = TextEditingController(text: '');
    cityIdController = TextEditingController(text: '');
    locationController = TextEditingController(text: '');
    licenceImageController = TextEditingController(text: '');
    licenceBase64Controller = TextEditingController(text: '');
    licenceNumberController = TextEditingController(text: '');
    licenceValidityController = TextEditingController(text: '');
    licenceValidityController?.text = "DD-MM-YYYY";
    pinController = TextEditingController(text: '');
    panImageController = TextEditingController(text: '');
    panImageBase64Controller = TextEditingController(text: '');
    SlotTimeController = TextEditingController(text: '');
    startTimeController = TextEditingController(text: '');
    endTimeController = TextEditingController(text: '');
    SlotTime2Controller = TextEditingController(text: '');
    StartTime2Controller = TextEditingController(text: '');
    EndTime2Controller = TextEditingController(text: '');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
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
  String? validaadhar(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (value.length != 16) {
    //   return '              A valid aadhaar should be of 16 digits';
    // }
    return null;
  }
  String? validAddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validcertificate(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validcertificatevalidity(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
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
  ///time3
  chooseTime3() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime3.value,
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
    if (pickedTime != null && pickedTime != selectedTime3.value) {
      selectedTime3.value = pickedTime;
    }
  }
  ///time4
  chooseTime4() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime4.value,
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
    if (pickedTime != null && pickedTime != selectedTime4.value) {
      selectedTime4.value = pickedTime;
    }
  }
  // date
  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      licenceValidityController
        ?..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: licenceValidityController!.text.length,
            affinity: TextAffinity.upstream));
    }
  }
  String? validClinicname(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }

    return null;
  }


  void checkDoctor1() {
    final isValid = frdoctor1formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    frdoctor1formkey.currentState!.save();
  }
}
