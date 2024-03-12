import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:ps_welness/model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
//import 'package:ps_welness/model/1_user_model/nurse_location_model/nurse_location_models.dart';
//import 'package:ps_welness/model/1_user_model/nurse_type_model/nurse_type_model.dart';
//import 'package:ps_welness/model/1_user_model/test_name_model/test_name_modells.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/nursess/appointment_history_nurse/nurse_history_appointment.dart';
//import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/nurse_list_user_list_controller/nurse_list_user_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';

import '../../../model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
import '../../../model/1_user_model/nurse_location_model/nurse_location_models.dart';
import '../../../model/1_user_model/nurse_type_model/nurse_type_model.dart';
import '../../../modules_view/1_user_section_views/nursess/nurse_appointment_section/nurse_lists/nurse_list_appointment.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

//import '../../../modules_view/1_user_section_views/nursess/nurse_type_model/nurse_type_model.dart';

class NurseBooking1Controller extends GetxController {
  NurseUserListController _nurseUserListController =
      Get.put(NurseUserListController());
  final GlobalKey<FormState> NurseBookingformkey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;

  //final today = DateTime.now().obs;
  var lastdate = DateTime.now().add(Duration(days: 1)).obs;

  //var jiffy = DateTime.now().add(months: 5, years: 1);

  //date1 = date1.add(Duration(days: 1, hours: 23));
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  //RxBool isLoading = false.obs;

  late TextEditingController appointmentController1;
  late TextEditingController appointmentController2;

  var appointment = ''.obs;

  ///this is for State....................................
  // Rx<String?> selectedCity = (null as String?).obs;
  final selectednurse = "".obs;
  // RxList<String> cities = <String>[].obs;
  ///

  ///this is for state.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  ///this is for city....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  ///
  //this is for nurse type.................................
  Rx<NurseModels?> selectedNurse = (null as NurseModels?).obs;
  List<NurseModels> nurse = <NurseModels>[].obs;

  //this is for nurse type.................................
  Rx<NurseLocationModel?> selectedNurseLocation =
      (null as NurseLocationModel?).obs;
  List<NurseLocationModel> locations = <NurseLocationModel>[].obs;

  var selectedServicee = ''.obs;
  var selectedplan = ''.obs;

  var selectedhours = ''.obs;

  var selectedshift = ''.obs;

  //radio.........

  onChangeServicee(String servicee) {
    selectedServicee.value = servicee;
  }

  onChangeHours(String servicee) {
    selectedhours.value = servicee;
  }

  onChangeShifts(String servicee) {
    selectedshift.value = servicee;
  }

  var selectedService = ''.obs;

  onChangePlan(String plan) {
    selectedService.value = plan;
  }

  //this is for City.................................
  //Rx<String?> selectedState = (null as String?).obs;
  // RxList<String> states = <String>[].obs;

  NurseList? nurseListUser;

  void labListApi() async {
    isLoading(true);
    nurseListUser = await ApiProvider.NurseTypeApi();
    print('Prince lab list');
    print(nurseListUser);
    if (nurseListUser != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  void getStateNurseeApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  ///get cities api...........
  void getCityByStateIDNursee(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  ///nurse type api class.................
  void getNurseTypeApi() async {
    nurse = await ApiProvider.getnursetypeApi();
    print('Prince lab test  list');
    print(nurse);
  }

  ///nurse location api class.................
  void getNurseLocationApi() async {
    locations = await ApiProvider.getnurselocationtApi();
    print('Prince lab test  list');
    print(locations);
  }

  /// nurse form booking api..................

  var Id = '';

  ///todo: nurse booking..............27 april 2023..
  void nurseBooking1Api() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.Nursesebooking1Api(
      selectedNurse.value?.id.toString(),
      //selectedhours.value,
      selectedshift.value,
      appointmentController1.text,
      appointmentController2.text,
      mobileNumberController.text,
      locationcontroller.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      _nurseUserListController.update();
      _nurseUserListController.nurselistsuserApi();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(NurseListUser());
      //Get.to(NurseDetailsSchedulePage());

      /// we can navigate to user page.....................................
      //Get.to(NurseAppointmentHistory());
    }
  }

  // void nurseBookingFormApi() async {
  //   CallLoader.loader();
  //   http.Response r = await ApiProvider.NurseselectionformApi(
  //     serviceTypeController.value,
  //     serviceTimeController.value,
  //     nurseTypeIdController.value,
  //     patientIdController.text,
  //     mobileController.text,
  //     ServiceDateController.text,
  //     StartDateController.value,
  //     EndDateController.value,
  //     LocationIdController.text,
  //
  //     //selectedState.value?.id.toString(),
  //    // selectedCity.value?.id.toString(),
  //   );
  //
  //   if (r.statusCode == 200) {
  //     var data = jsonDecode(r.body);
  //
  //     CallLoader.hideLoader();
  //     Get.to(NurseListUser());
  //
  //     /// we can navigate to user page.....................................
  //     //Get.to(NurseAppointmentHistory());
  //
  //   }
  // }

  late TextEditingController patientIdController,
      //selectedNurse.value?.id.toString(),
      serviceTypeController,
      serviceTimeController,
      startDateController,
      endDateController,
      locationcontroller,
      mobileNumberController;

  ///todo new user nurse booking 1.....

  var Patient_Id = '';
  var NurseTypeId = '';
  var ServiceType = '';
  var ServiceTime = '';
  var StartDate = '';
  var EndDate = '';
  var MobileNumber = '';
  var Location = '';

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    labListApi();
    getNurseTypeApi();
    getNurseLocationApi();

    serviceTypeController = TextEditingController();
    serviceTimeController = TextEditingController();
    patientIdController = TextEditingController();
    serviceTypeController = TextEditingController();
    serviceTimeController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    mobileNumberController = TextEditingController();
    locationcontroller = TextEditingController();

    appointmentController1 = TextEditingController();
    appointmentController1.text = "YYYY-MM-DD";
    //YYYY-MM-DD

    appointmentController2 = TextEditingController();
    appointmentController2.text = "YYYY-MM-DD";
    //YYYY-MM-DD
    getStateNurseeApi();
    //getdepartmentApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDNursee("${p0.id}");
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    serviceTypeController.dispose();
    serviceTimeController.dispose();
    patientIdController.dispose();
  }

  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      //initialDate: DateTime.now(),

      initialDate: selectedDate.value,
      //firstDate: DateTime.now().add(Duration(days: 2)),
      //initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      // firstDate: DateTime(2018),
      lastDate: DateTime(2027),

      ///initialEntryMode: DatePickerEntryMode.input,
      ///initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',

      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      appointmentController1
        ..text = DateFormat('yyyy-MM-dd').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: appointmentController1.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  chooseDate2() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: lastdate.value,
      firstDate: DateTime.now().add(Duration(days: 1)),
      // DateTime.now()
      //     //.toIso8601String()
      //     .subtract(Duration(days: 1)),
      //firstDate: DateTime(2018),
      lastDate: DateTime(2027),
      //initialEntryMode: DatePickerEntryMode.input,
      //initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',

      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      lastdate.value = newpickedDate;
      appointmentController2
        ..text = DateFormat('yyyy-MM-dd').format(lastdate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: appointmentController2.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  //bool disableDate(DateTime day) {
  //   if ((day.isAfter(DateTime.now().subtract(Duration(days: 4))) &&
  //       day.isBefore(DateTime.now().add(Duration(days: 30))))) {
  //     return true;
  //   }
  //   return false;
  // }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  String? validlocation(String value) {
    if (value.length < 2) {
      return "              Provide Address";
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

  // String? validPassword(String value) {
  //   confirmpassword = value;
  //
  //   if (value.isEmpty) {
  //     return "              Please Enter New Password";
  //   } else if (value.length < 8) {
  //     return "              Password must be atleast 8 characters long";
  //   } else {
  //     return null;
  //   }
  // }
  ///.......................

  // String? validConfirmPassword(String value) {
  //   if (value.isEmpty) {
  //     return "              Please Re-Enter New Password";
  //   } else if (value.length < 8) {
  //     return "              Password must be atleast 8 characters long";
  //   } else if (value != confirmpassword) {
  //     return "              Password must be same as above";
  //   } else {
  //     return null;
  //   }
  // }

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

  // void checkUser1() {
  //   final isValid = NurseBookingformkey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   NurseBookingformkey.currentState!.save();
  //   //Get.to(() => HomePage());
  // }
  void checkNurse1() {
    if (NurseBookingformkey.currentState!.validate()) {
      //nurseBookingFormApi();
      nurseBooking1Api();
    }
    NurseBookingformkey.currentState!.save();
  }
}
