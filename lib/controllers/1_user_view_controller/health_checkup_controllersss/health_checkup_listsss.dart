import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../model/1_user_model/health_chkp_checkout_model/health_chkp_chkout_model.dart';
import '../../../model/1_user_model/hlthchkp_detail_model/healthchkp_detail_model.dart';
import '../../../model/1_user_model/time_slots_common_model/time_slots_common.dart';
import '../../../modules_view/1_user_section_views/health_checkup/health_checkup_appointment_checkout/health_checkup_appointment_checkout.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';

//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

//import '../../../model/1_user_model/health_checkup_list/health_checkup_list.dart';
//import '../../../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';

class HealthCheckupController extends GetxController {
  final GlobalKey<FormState> chkp2formkey = GlobalKey<FormState>();

  RxBool isLoading = true.obs;

  Rx<TimeSlot?> selectedTimeslot = (null as TimeSlot?).obs;
  List<TimeSlot> timeslot = <TimeSlot>[].obs;

  HealthCheckupListss? healthCheckupListss;
  HealthCheckupcheckout? healthCheckupcheckout;
  HealthCheckupcheDetail? healthCheckupcheDetail;

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;

  void labListApi() async {
    isLoading(true);
    healthCheckupListss = await ApiProvider.LabHistoryApi();
    print('Prince lab list');
    print(healthCheckupListss);
    if (healthCheckupListss?.healthCheckupList != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //foundCheckupcenter.value = healthCheckupListss!.healthCheckupList!;
      //Get.to(()=>Container());
    }
  }

  ///healthchkp_detail_api.....................18april....2023..
  void healthdetailApi() async {
    isLoading(true);
    healthCheckupcheDetail = await ApiProvider.ViewdetailhlthchkpApi();
    print('Prince lab sedule.........');
    print(healthCheckupcheDetail);
    if (healthCheckupcheDetail?.year != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  void healthcheckoutApi() async {
    //isLoading(true);
    healthCheckupcheckout = await ApiProvider.HealthchkupcheckoutApi();
    print('Prince doctor list');
    print(healthCheckupcheckout);
    if (
        //nurseappointmentdetail?.result != null
        healthCheckupcheckout != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  ///time_slot.......
  void timeslotApi() async {
    timeslot = (await ApiProvider.gettimeslotApi())!;
    print('Prince time slot  list');
    print(timeslot);
  }

  ///checkup booking2 api.............
  void healthcheckupBooking2Api() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.Healthcheckup2Api(
      checkupidController.text,
      appointmentController.text,
      selectedTimeslot.value?.slotid.toString(),
      //selectedState.value?.id.toString(),
      // selectedCity.value?.id.toString(),
    );
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();
      //Get.to(NurseListUser());
      // Get.to(NurseDetailsSchedulePage());
      // Get.to(() => LabAppointmentCheckout());

      /// we can navigate to user page.....................................
      Get.to(HealthCheckupAppointmentCheckout());
    }
  }

  late TextEditingController checkupidController,
      //selectedNurse.value?.id.toString(),
      appointmentController;

  void HealthcheckupApi() async {
    isLoading(true);
    healthCheckupListss = await ApiProvider.HealthcheckuplistApi();
    print('Prince lab list');
    print(healthCheckupListss);
    if (healthCheckupListss?.healthCheckupList != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundCheckupcenter.value = healthCheckupListss!.healthCheckupList!;
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    labListApi();
    HealthcheckupApi();
    healthcheckoutApi();
    healthdetailApi();
    timeslotApi();

    checkupidController = TextEditingController();
    appointmentController = TextEditingController();
    appointmentController.text = "YYY-MM-DD";
  }

  @override
  void onClose() {
    healthCheckupListss = null;
    super.onClose();
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
      appointmentController
        ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: appointmentController.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  @override
  void dispose() {
    healthCheckupListss = null;
    super.dispose();
  }

  RxList<HealthCheckupList> foundCheckupcenter = RxList<HealthCheckupList>([]);
  void filterCheckupcenter(String searchlabName) {
    List<HealthCheckupList>? finalResult = [];
    if (searchlabName.isEmpty) {
      finalResult = healthCheckupListss!.healthCheckupList;
    } else {
      finalResult = healthCheckupListss!.healthCheckupList
          ?.where((element) => element.labName
              .toString()
              .toLowerCase()
              .contains(searchlabName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundCheckupcenter.value = foundCheckupcenter;
  }

  void checkuphealth2() {
    if (chkp2formkey.currentState!.validate()) {
      //nurseBookingFormApi();
      healthcheckupBooking2Api();
    }
    chkp2formkey.currentState!.save();
  }
}

///todo from here checkout model value..............
