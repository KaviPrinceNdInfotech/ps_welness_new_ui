import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_department_list_model/department_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctor_1_Controller extends GetxController {
  final GlobalKey<FormState> doctor11formkey = GlobalKey<FormState>();

  LoginpasswordController _loginpasswordControllerr =
      Get.put(LoginpasswordController());

  ///TODO: image picker.................
  ///
  var selectedImagepath = ''.obs;
  var selectedImagepath2 = ''.obs;

  var selectedStartTime = TimeOfDay.now().obs;
  var selectedEndTime = TimeOfDay.now().obs;
  var selectedSlotTime = TimeOfDay.now().obs;

  ///this is for department.................................
  Rx<DepartmentModel?> selectedDepartment = (null as DepartmentModel?).obs;
  List<DepartmentModel> department = <DepartmentModel>[].obs;

  ///this is for department.................................
  Rx<SpecialistModel?> selectedSpecialist = (null as SpecialistModel?).obs;
  List<SpecialistModel> specialist = <SpecialistModel>[].obs;

  ///get department api.........

  void getdepartmentApi() async {
    department = await ApiProvider.getDortorDepartmentApi();
    print('Prince departmrntttss  list');
    print(department);
  }

  ///get specialist api...........
  void getspecialistByDeptID(String depId) async {
    specialist.clear();
    final localList = await ApiProvider.getSpeaclistbyIdApi(depId);
    specialist.addAll(localList);
    print("Prince cities of $depId");
    print(specialist);
  }

  TextEditingController? panController,
      idController,
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
      licenceBase64Controller,
      experienceController,
      qualificationController,
      registrationController,
      signaturepicController,
      signaturepicbase64Controller;

  var pan = '';
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
  var experience = '';

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  void getImage2(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath2.value = pickedFile.path;
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
    final licenceImage2AsBase64 =
        base64Encode(await File(selectedImagepath2.value).readAsBytes());
    http.Response r = await ApiProvider.signDoctorUpApi(
      panController?.text,
      doctorNameController?.text,
      emailIdController?.text,
      passwordController?.text,
      confirmPasswordController?.text,
      mobileNumberController?.text,
      feeController?.text,
      phoneNumberController?.text,
      selectedStartTime.value.toString(),
      selectedSlotTime.value.hour,
      selectedDepartment.value?.id.toString(),
      selectedSpecialist.value?.id.toString(),
      licenceNumberController?.text,
      selectedImagepath.value.split('/').last,
      pinCodeController?.text,
      clinicNameController?.text,
      locationController?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      selectedEndTime.value.hour,
      licenceImageAsBase64,
      experienceController?.text,
      qualificationController?.text,
      registrationController?.text,
      selectedImagepath2.value.split('/').last,
      licenceImage2AsBase64,
    );
    if (r.statusCode == 200) {
      Get.snackbar(
        'Success',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
      //Get.snackbar('message', "${r.body}");
      /// we can navigate to user page.....................................
      // Get.to(SignInScreen());
      _loginpasswordControllerr.onInit();
      //CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      //CallLoader.hideLoader();
      await SharedPreferences.getInstance()
          .then((value) => Get.offAll(() => SignInScreen()));
    } else {
      Get.snackbar(
        'Error',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStateLabApi();
    getdepartmentApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    selectedDepartment.listen((p0) {
      if (p0 != null) {
        getspecialistByDeptID("${p0.id}");
      }
    });
    panController = TextEditingController();
    idController = TextEditingController(text: '143');
    doctorNameController = TextEditingController();
    emailIdController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    mobileNumberController = TextEditingController();
    feeController = TextEditingController();
    phoneNumberController = TextEditingController();
    startTimeController = TextEditingController(text: '01:50:00.0000000');
    slotTimingController = TextEditingController(text: '5');
    departmentIdController = TextEditingController();
    specialistIdController = TextEditingController();
    licenceNumberController = TextEditingController();
    licenceImageController = TextEditingController();
    licenceImageNameController = TextEditingController();
    pinCodeController = TextEditingController();
    clinicNameController = TextEditingController();
    locationController = TextEditingController();
    stateMaster_IdController = TextEditingController();
    cityMaster_IdController = TextEditingController();
    endTimeController = TextEditingController(text: '14:27:00.0000000');
    licenceBase64Controller = TextEditingController();
    experienceController = TextEditingController();

    qualificationController = TextEditingController();
    registrationController = TextEditingController();
    signaturepicController = TextEditingController();
    signaturepicbase64Controller = TextEditingController();
    //signaturepicController,
    //   signaturepicbase64Controller;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    experienceController?.dispose();
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

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid Pan number should be of 10 digits';
    }
    return null;
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid value";
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

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin should be of 6 digits';
    }
    return null;
  }

  String? validexperince(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (value.length < 1) {
    //   return '              A valid pin should be of 6 digits';
    // }
    //return null;
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
