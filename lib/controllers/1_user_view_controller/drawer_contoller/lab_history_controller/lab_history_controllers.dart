import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_appointment_history.dart';

import '../../../../model/1_user_model/health_checkup_list/health_checkup_list.dart';
import '../../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/health_checkup_list/health_checkup_list.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class LabHistoryController extends GetxController {
  final GlobalKey<FormState> labHistoryformkey = GlobalKey<FormState>();

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  //RxBool isLoading = false.obs;

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

  RxBool isLoading = true.obs;

  HealthCheckupList? healthCheckupList;

  Labappointmentbyuserid? labappointmentbyuserid;

  void labListApi() async {
    isLoading(true);
    healthCheckupList = await ApiProvider.LabListDrowerApi();
    print('Prince lab list');
    print(healthCheckupList);
    if (healthCheckupList?.viewMoreHealth != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  ///...........................userid.........
  void labHistorybyUserId() async {
    isLoading(true);
    labappointmentbyuserid =
        await ApiProvider.LabappointmentshistorybyuserIdApi();
    print('Prince lab appointment history ');
    print(labappointmentbyuserid);
    if (labappointmentbyuserid?.labModel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundLab.value = labappointmentbyuserid!.labModel!;
      //Get.to(()=>Container());
    }
  }

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
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    labListApi();
    labHistorybyUserId();

    appointmentController1 = TextEditingController();
    appointmentController1.text = "DD-MM-YYYY";

    appointmentController2 = TextEditingController();
    appointmentController2.text = "DD-MM-YYYY";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    healthCheckupList = null;
    super.onClose();
  }

  @override
  void dispose() {
    healthCheckupList = null;
    super.dispose();
  }

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

  //bool disableDate(DateTime day) {
  //   if ((day.isAfter(DateTime.now().subtract(Duration(days: 4))) &&
  //       day.isBefore(DateTime.now().add(Duration(days: 30))))) {
  //     return true;
  //   }
  //   return false;
  // }

  // void checklabhistory1() {
  //   final isValid = labHistoryformkey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   labHistoryformkey.currentState!.save();
  //   //Get.to(() => HomePage());
  // }

  RxList<LabModel> foundLab = RxList<LabModel>([]);
  void filterLab(String searchlabName) {
    List<LabModel>? finalResult = [];
    if (searchlabName.isEmpty) {
      finalResult = labappointmentbyuserid!.labModel;
    } else {
      finalResult = labappointmentbyuserid!.labModel!
          .where((element) => element.labName
              .toString()
              .toLowerCase()
              .contains(searchlabName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundLab.value = finalResult!;
  }
}
