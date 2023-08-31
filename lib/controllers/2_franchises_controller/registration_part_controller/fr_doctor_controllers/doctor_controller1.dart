import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_department_list_model/department_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/model/1_user_model/time_slots_common_model/time_slots_common.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_doctor_views/doctor_signup3/fr_doctor_signup_3.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_doctor_views/doctor_sigup_part2/doctor_signup_part2.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrDoctor_1_Controller extends GetxController {
  final GlobalKey<FormState> frdoctor1formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> frdoctor2formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> frdoctor3formkey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  TextEditingController? doctorNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      mobileNumberController,
      phoneController,
      clinicNameController,
      stateIdController,
      cityIdController,
      locationController,
      licenceImageController,
      licenceBase64Controller,
      licenceNumberController,
      licenceValidityController,
      pinController,
      panImageController,
      panImageBase64Controller,
      SlotTimeController,
      startTimeController,
      endTimeController,
      SlotTime2Controller,
      StartTime2Controller,
      EndTime2Controller,
      ExperienceController,
      FeesController;

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
  var Experience = '';
  var Fees = '';

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
    } else {}
  }

  void getPanImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPanImagepath.value = pickedFile.path;
    } else {}
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

  Rx<TimeSlot?> selectedTimeslot = (null as TimeSlot?).obs;
  List<TimeSlot> timeslot = <TimeSlot>[].obs;

  Rx<TimeSlot?> selectedTimeslot2 = (null as TimeSlot?).obs;
  List<TimeSlot> timeslot2 = <TimeSlot>[].obs;

  ///this is for department.................................
  Rx<DepartmentModel?> selectedDepartment = (null as DepartmentModel?).obs;
  List<DepartmentModel> department = <DepartmentModel>[].obs;

  ///this is for department.................................
  Rx<SpecialistModel?> selectedSpecialist = (null as SpecialistModel?).obs;
  List<SpecialistModel> specialist = <SpecialistModel>[].obs;

  ///get department api.........

  void getdepartmentApi2() async {
    department = await ApiProvider.getDortorDepartmentApi();
    print('Prince departmrntttss  list');
    print(department);
  }

  ///get specialist api...........
  void getspecialistByDeptID2(String depId) async {
    specialist.clear();
    final localList = await ApiProvider.getSpeaclistbyIdApi(depId);
    specialist.addAll(localList);
    print("Prince cities of $depId");
    print(specialist);
  }

  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
  }

  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  ///slot morning1 api class.................
  void timeslotApidr1() async {
    timeslot = (await ApiProvider.gettimeslotApi())!;
    print('Prince time slot  list');
    print(timeslot);
  }

  ///slot morning1 api class.................
  void timeslotApidr2() async {
    timeslot2 = (await ApiProvider.gettimeslotApi())!;
    print('Prince time slot  list');
    print(timeslot2);
  }

  void FrenchiesDoctorRegistration() async {
    isLoading(true);
    final licenceimageAsBase64 =
        base64Encode(await File(selectedLicenceImagepath.value).readAsBytes());
    final PanImageAsBase64 =
        base64Encode(await File(selectedPanImagepath.value).readAsBytes());
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
      selectedTimeslot.value?.slotid.toString(),

      ///todo: this is the main thing to provide time period..
      selectedTime?.value,
      selectedTime2?.value,
      selectedTimeslot2.value?.slotid.toString(),
      selectedTime3?.value,
      selectedTime4?.value,
      ExperienceController?.text,
      selectedDepartment.value?.id.toString(),
      selectedSpecialist.value?.id.toString(),
      FeesController?.text,
    );
    if (r.statusCode == 200) {
      print("ttftft${SlotTimeController?.text}");

      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
      isLoading(false);
    } else {
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
    }
  }

  @override
  void onInit() {
    getStateLabApi();
    timeslotApidr1();
    timeslotApidr2();
    getdepartmentApi2();

    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    selectedDepartment.listen((p0) {
      if (p0 != null) {
        getspecialistByDeptID2("${p0.id}");
      }
    });
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
    ExperienceController = TextEditingController();
    FeesController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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

  String? validfeess(String value) {
    if (value.isEmpty) {
      return '              Fees is required';
    }
    return null;
  }

  ///time 1........................
  chooseTime() async {
    // DateTime now = DateTime.now();
    // int hour = now.hour;
    // int minute = now.minute;
    // int second = now.second;

    ///todo: time format not correct...............
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
      helpText: 'Select Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'validity',
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
    if (isValid) {
      Get.to(FrDoctorSignup2());
      return;
    } else {}
    frdoctor1formkey.currentState!.save();
  }

  void checkDoctor2() {
    final isValid = frdoctor2formkey.currentState!.validate();
    if (isValid) {
      Get.to(FrDocSignup3());
      return;
    } else {}
    frdoctor1formkey.currentState!.save();
  }

  void checkDoctor3() {
    final isValid = frdoctor3formkey.currentState!.validate();
    if (isValid &&
        selectedLicenceImagepath.value != '' &&
        selectedPanImagepath.value != '') {
      FrenchiesDoctorRegistration();
      return;
    } else {
      Get.snackbar("Failed", "Please select all data and image",
          duration: Duration(seconds: 3));
    }
    frdoctor1formkey.currentState!.save();
  }
}
