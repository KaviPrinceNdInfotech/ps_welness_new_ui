import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/4_nurse_all_models/nurse_appointment_details_list.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/4_nurse_all_models/nurse_appointment_details_list.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class NurseBookingHistoryController extends GetxController {
  final GlobalKey<FormState> NurseHistoryformkey = GlobalKey<FormState>();
  var appointment = ''.obs;
  RxBool isLoading = true.obs;

  NurseAppointmentDetail? nurseappointmentdetail;

  //all catagary list .........

  void nursebookinghistoryApi() async {
    isLoading(true);
    nurseappointmentdetail = await ApiProvider.NurseappointmentApi();
    if (
    nurseappointmentdetail?.nurseAppointments != null
    //appointmentdetail != null
    //getcatagartlist!.result!.isNotEmpty
    ) {
      isLoading(false);
    }
  }

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  //RxBool isLoading = false.obs;

  late TextEditingController appointmentController1;



  ///this is for State....................................


  //radio.........



  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    nursebookinghistoryApi();

    appointmentController1 = TextEditingController();
    appointmentController1.text = "DD-MM-YYYY";

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

  void checkUser1() {
    final isValid = NurseHistoryformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    NurseHistoryformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
