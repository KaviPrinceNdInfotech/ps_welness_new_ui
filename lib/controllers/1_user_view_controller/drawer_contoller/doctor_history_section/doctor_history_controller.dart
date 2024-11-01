import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/doctor_history/doctor_history_user.dart';

import '../../../../model/1_user_model/doctor_appointment_history_model/doctor_onlinebooking_history/online_booking_history.dart';
import '../../../../model/1_user_model/doctor_appointment_history_model/user_doctor_apointment_history.dart';
import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class DoctorHistoryController extends GetxController {
  final GlobalKey<FormState> DoctorHistoryformkey = GlobalKey<FormState>();

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  //RxBool isLoading = false.obs;

  RxBool isLoading = true.obs;
  OnlineDrHistory? getonlinedr;

  UserDoctorAppointmentHistory? getdoctorhospitalmodele;

  Future<void> doctorListHospitalApi() async {
    // isLoading(false);
    getdoctorhospitalmodele = await ApiProvider.userdoctorApi();
    //getListOfDoctorApi();
    print('Prince lab list');
    print(getdoctorhospitalmodele);
    if (getdoctorhospitalmodele?.appointment != null) {
      //Get.to(() => TotalPrice());
      isLoading(true);
      foundDoctor.value = getdoctorhospitalmodele!.appointment!;
      //Get.to(()=>Container());
    }
  }

  ///online_dr_booking...12sep...2023..
  Future<void> doctorbookingOnlineApi() async {
    // isLoading(false);
    getonlinedr = await ApiProvider.userdoctorOnlineApi();
    //getListOfDoctorApi();
    print('Prince lab list');
    print(getonlinedr);
    if (getonlinedr?.appointment2 != null) {
      //Get.to(() => TotalPrice());
      isLoading(true);
      foundDoctor2.value = getonlinedr!.appointment2!;
      //Get.to(()=>Container());
    }
  }

  //doctorSkillDeleteApi
  void deletedoctorhistoryApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.doctorHisdeleteApi();
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();
      await doctorListHospitalApi();
      await doctorbookingOnlineApi();
      await Get.to(
        () => DoctorHistoryUser(
            //id: "12345689",
            ), //next page class
        duration: Duration(
            milliseconds: 600), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );
      CallLoader.hideLoader();

      //Get.back();
      //Get.offAll(() => AddSkilsScreen());

    }
  }

  late TextEditingController appointmentController1;
  late TextEditingController appointmentController2;

  var appointment = ''.obs;

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  var selectedServicee = ''.obs;
  var selectedplan = ''.obs;

  var selectedhours = ''.obs;

  var selectedshift = ''.obs;

  //radio.........

  // onChangeServicee(String servicee) {
  //   selectedServicee.value = servicee;
  // }
  //
  // onChangeHours(String servicee) {
  //   selectedhours.value = servicee;
  // }
  //
  // onChangeShifts(String servicee) {
  //   selectedshift.value = servicee;
  // }
  //
  // var selectedService = ''.obs;
  //
  // onChangePlan(String plan) {
  //   selectedService.value = plan;
  // }

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    doctorbookingOnlineApi();
    //doctorbookingOnlineApi();

    //appointmentController1 = TextEditingController();
    // appointmentController1.text = "DD-MM-YYYY";

    //appointmentController2 = TextEditingController();
    // appointmentController2.text = "DD-MM-YYYY";
    doctorListHospitalApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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
      // selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      appointmentController1
        ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
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
      appointmentController2
        ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
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

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 4))) &&
        day.isBefore(DateTime.now().add(Duration(days: 30))))) {
      return true;
    }
    return false;
  }

  void checkUser1() {
    final isValid = DoctorHistoryformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    DoctorHistoryformkey.currentState!.save();
    //Get.to(() => HomePage());
  }

  RxList<Appointment> foundDoctor = RxList<Appointment>([]);
  void filterDoctor(String searcdoctorName) {
    List<Appointment>? finalResult = [];
    if (searcdoctorName.isEmpty) {
      finalResult = getdoctorhospitalmodele!.appointment;
    } else {
      finalResult = getdoctorhospitalmodele!.appointment!
          .where((element) => element.doctorName
              .toString()
              .toLowerCase()
              .contains(searcdoctorName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundDoctor.value = finalResult;
  }

  ///online.......
  RxList<Appointmentonline> foundDoctor2 = RxList<Appointmentonline>([]);
  void filterDoctor2(String searcdoctorName) {
    List<Appointmentonline>? finalResult = [];
    if (searcdoctorName.isEmpty) {
      finalResult = getonlinedr!.appointment2;
    } else {
      finalResult = getonlinedr!.appointment2!
          .where((element) => element.doctorName
              .toString()
              .toLowerCase()
              .contains(searcdoctorName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundDoctor2.value = finalResult;
  }
}
