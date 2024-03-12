import 'dart:convert';
import 'dart:io';

///import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_department_list_model/department_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/slot_duration_common_model/slot_duration_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/franchise_model_comman/franchise_model_id.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/week_day_off/week_day_off_model.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctor_1_Controller extends GetxController {
  final GlobalKey<FormState> doctor11formkey = GlobalKey<FormState>();

  LoginpasswordController _loginpasswordControllerr =
      Get.put(LoginpasswordController());

  //getfranchiseDurationsApi

  ///TODO: image picker.................
  ///
  // var selectedImagepath = ''.obs;
  //
  // ///var selectedImagepath2 = ''.obs;
  //
  // var selectedStartTime = TimeOfDay.now().obs;
  // var selectedEndTime = TimeOfDay.now().obs;
  // var selectedSlotTime = TimeOfDay.now().obs;

  // Rx<TimeSlot?> selectedTimeslot = (null as TimeSlot?).obs;
  // List<TimeSlot> timeslot = <TimeSlot>[].obs;

  //TimeDurationSlot

  ///this is slot duration...
  Rx<DurationSlot?> selectedtimeslotDurations = (null as DurationSlot?).obs;
  List<DurationSlot> timeduration = <DurationSlot>[].obs;

  ///this is slot duration...2
  Rx<DurationSlot?> selectedtimeslotDurations2 = (null as DurationSlot?).obs;
  List<DurationSlot> timeduration2 = <DurationSlot>[].obs;

  ///this is for department.................................
  Rx<DepartmentModel?> selectedDepartment = (null as DepartmentModel?).obs;
  List<DepartmentModel> department = <DepartmentModel>[].obs;

  ///this is for franchise id.................................
  Rx<Vendor?> selectedFranchiseId = (null as Vendor?).obs;
  List<Vendor> franchiseid = <Vendor>[].obs;

  ///this is for day id.................................
  Rx<Day?> selectedweekdayId = (null as Day?).obs;
  List<Day> weekdayid = <Day>[].obs;

  ///this is for department.................................
  Rx<SpecialistModel?> selectedSpecialist = (null as SpecialistModel?).obs;
  List<SpecialistModel> specialist = <SpecialistModel>[].obs;

  // Rx<TimeSlot?> selectedTimeslot2 = (null as TimeSlot?).obs;
  // List<TimeSlot> timeslot2 = <TimeSlot>[].obs;

  ///get department api.........

  void getdepartmentApi() async {
    department = await ApiProvider.getDortorDepartmentApi();
    print('Prince departmrntttss  list');
    print(department);
  }

  ///slot duration..1.
  // void getdurationApi() async {
  //   List<Durationss>? durationsList =
  //       await ApiProvider.gettimeslotDurationsApi();
  //   if (durationsList != null && durationsList.isNotEmpty) {
  //     // Assuming you want to assign the first element of the list
  //     timeslotDurations.value = durationsList.first;
  //     // Or if you want to assign the whole list
  //     // timeduration = durationsList;
  //     print('Prince timeslot durations list');
  //     print(timeslotDurations.value);
  //   } else {
  //     print('No durations received from API');
  //   }
  // }

  ///slot duration..2.
  // void getdurationApi2() async {
  //   List<Durationss>? durationsList =
  //       await ApiProvider.gettimeslotDurationsApi();
  //   if (durationsList != null && durationsList.isNotEmpty) {
  //     // Assuming you want to assign the first element of the list
  //     timeslotDurations2.value = durationsList.first;
  //     // Or if you want to assign the whole list
  //     // timeduration = durationsList;
  //     print('Prince timeslot durations list');
  //     print(timeslotDurations2.value);
  //   } else {
  //     print('No durations received from API');
  //   }
  // }

  ///slot morning1 duration api class........45  1.........
  Future<void> timeslotApidr11() async {
    timeduration = (await ApiProvider.gettimeslotDurationsApi())!;
    print('Prince time slot  list');
    print(timeduration);
  }

  ///slot evening duration api class........45  1.........
  Future<void> timeslotApidr22() async {
    timeduration2 = (await ApiProvider.gettimeslotDurationsApi())!;
    print('Prince time slot  list');
    print(timeduration2);
  }

  ///franchise id api class........45  1.........
  Future<void> franchiseIdApi() async {
    franchiseid = (await ApiProvider.getfranchiseDurationsApi())!;
    print('Prince  franchise  list');
    print(franchiseid);
  }
  //getweekoffApi

  ///franchise id api class........45  1.........
  Future<void> weekoffIdApi() async {
    weekdayid = (await ApiProvider.getweekoffApi())!;
    print('Prince day  list');
    print(weekdayid);
  }

  ///slot morning1 api class.................
  // void timeslotApidr22() async {
  //   timeslot2 = (await ApiProvider.gettimeslotApi())!;
  //   print('Prince time slot  list');
  //   print(timeslot2);
  // }

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
      licenceValidityController,
      licenceImageController,
      licenceImageNameController,
      clinicNameController,
      locationController,
      stateMaster_IdController,
      cityMaster_IdController,
      SlotTimeController,

      ///startTimeController,
      endTimeController,
      SlotTime2Controller,
      StartTime2Controller,
      EndTime2Controller,
      pinCodeController,
      //phoneController,

      ///endTimeController,
      licenceBase64Controller,
      experienceController,
      qualificationController,
      registrationController,
      signaturepicController,
      signaturepicbase64Controller,

      ///
      dayIdController,
      virtualfeesController,
      aboutController,
      vendotidController;

  var day = '';
  var virtualfee = '';
  var about = '';
  var vendorId = '';

  var pan = '';
  var Id = '';
  var DoctorName = '';
  var EmailId = '';
  var Password = '';
  var ConfirmPassword = '';
  var MobileNumber = '';
  var phonenumber = '';
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
  var certificatevelidity = '';

  var selectedLicenceImagepath = ''.obs;
  var selectedPanImagepath = ''.obs;
  var selectedImagepath2 = ''.obs;

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
  //getPanImage

  void getPanImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPanImagepath.value = pickedFile.path;
    } else {}
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
    try {
      final licenceimageAsBase64 = base64Encode(
          await File(selectedLicenceImagepath.value).readAsBytes());
      final PanImageAsBase64 =
          base64Encode(await File(selectedPanImagepath.value).readAsBytes());
      final licenceImage2AsBase64 =
          base64Encode(await File(selectedImagepath2.value).readAsBytes());

      http.Response r = await ApiProvider.signDoctorUpApi(
        panController?.text,
        doctorNameController?.text,
        emailIdController?.text,
        passwordController?.text,
        confirmPasswordController?.text,
        mobileNumberController?.text,
        phoneNumberController?.text,
        clinicNameController?.text,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        locationController?.text,
        selectedLicenceImagepath.value.split('/').last,
        licenceimageAsBase64,
        licenceNumberController?.text,
        licenceValidityController?.text,
        pinCodeController?.text,
        selectedPanImagepath.value.split('/').last,
        PanImageAsBase64,
        selectedtimeslotDurations.value?.durationId.toString(),
        selectedTime.value,
        selectedTime2.value,
        selectedtimeslotDurations2.value?.durationId.toString(),
        selectedTime3.value,
        selectedTime4.value,
        experienceController?.text,
        selectedDepartment.value?.id.toString(),
        selectedSpecialist.value?.id.toString(),
        feeController?.text,
        qualificationController?.text,
        registrationController?.text,
        selectedImagepath2.value.split('/').last,
        licenceImage2AsBase64,

        ///this is dropdown after api
        selectedweekdayId.value?.id.toString(),
        virtualfeesController?.text,
        aboutController?.text,

        ///this is remaining part
        selectedFranchiseId.value?.id.toString(),
      );

      if (r.statusCode == 200) {
        Get.snackbar(
          'Success',
          "${r.body}",
          duration: const Duration(seconds: 1),
        );
        _loginpasswordControllerr.onInit();
        await Future.delayed(Duration(milliseconds: 500));
        await SharedPreferences.getInstance()
            .then((value) => Get.offAll(() => SignInScreen()));
      } else {
        Get.snackbar(
          'Error',
          "${r.body}",
          duration: const Duration(seconds: 1),
        );
      }
    } catch (e) {
      print("Error in doctorSignupApi: $e");
      Get.snackbar(
        'Error',
        "An error occurred while signing up: $e",
        duration: const Duration(seconds: 1),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStateLabApi();
    timeslotApidr11();
    timeslotApidr22();
    franchiseIdApi();
    weekoffIdApi();
    //timeslotApidr11();
    timeslotApidr22();
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
    //idController = TextEditingController(text: '143');
    doctorNameController = TextEditingController();
    emailIdController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    mobileNumberController = TextEditingController();
    feeController = TextEditingController();
    licenceValidityController = TextEditingController();
    licenceValidityController?.text = "DD-MM-YYYY";
    phoneNumberController = TextEditingController();
    startTimeController = TextEditingController();
    slotTimingController = TextEditingController();
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
    endTimeController = TextEditingController(text: '');
    licenceBase64Controller = TextEditingController();
    experienceController = TextEditingController();

    qualificationController = TextEditingController();
    registrationController = TextEditingController();
    signaturepicController = TextEditingController();
    signaturepicbase64Controller = TextEditingController();
    dayIdController = TextEditingController();
    virtualfeesController = TextEditingController();
    aboutController = TextEditingController();

    ///this is remaining part
    vendotidController = TextEditingController();
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

  String? validcertificatevalidity(String value) {
    if (value.isEmpty) {
      return '              This field is required';
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
      return '              A valid  number should be of 10 digits';
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

  ///data...
  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2070),
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

  ///

  // chooseEndTime() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: Get.context!,
  //       initialTime: selectedEndTime.value,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       cancelText: 'Close',
  //       confirmText: 'Confirm',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //
  //   if (pickedTime != null && pickedTime != selectedEndTime.value) {
  //     selectedEndTime.value = pickedTime;
  //   }
  // }
  //
  // chooseStartTime() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: Get.context!,
  //       initialTime: selectedStartTime.value,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       cancelText: 'Close',
  //       confirmText: 'Confirm',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //
  //   if (pickedTime != null && pickedTime != selectedStartTime.value) {
  //     selectedStartTime.value = pickedTime;
  //   }
  // }
  //
  // chooseSlotTime() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //       context: Get.context!,
  //       initialTime: selectedSlotTime.value,
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.dark(), child: child!);
  //       },
  //       initialEntryMode: TimePickerEntryMode.input,
  //       helpText: 'Select Departure Time',
  //       cancelText: 'Close',
  //       confirmText: 'Confirm',
  //       errorInvalidText: 'Provide valid time',
  //       hourLabelText: 'Select Hour',
  //       minuteLabelText: 'Select Minute');
  //
  //   if (pickedTime != null && pickedTime != selectedSlotTime.value) {
  //     selectedSlotTime.value = pickedTime;
  //   }
  // }
  ///

  void checkDoctor1() {
    //  final isValid = doctor11formkey.currentState?.validate();
    // if (!isValid) {
    //   return;
    // }
    // doctor11formkey.currentState!.save();
    /// doctorSignupApi();

    final isValid = doctor11formkey.currentState!.validate();
    if (isValid &&
        selectedLicenceImagepath.value != '' &&
        selectedPanImagepath.value != '' &&
        selectedImagepath2 != '') {
      doctorSignupApi();
      return;
    } else {
      Get.snackbar("Failed", "Please select all data and image",
          duration: Duration(seconds: 3));
    }
    doctor11formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
