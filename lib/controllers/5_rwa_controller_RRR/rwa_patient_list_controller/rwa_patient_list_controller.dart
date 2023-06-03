import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/5_RWA_controller_RRR/rwa_patient_list_model.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/RWA/rwa_patient_list_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class RwaPatientListController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  late TextEditingController appointmentController;

  var appointment = ''.obs;
  RwaPatientListModel? getRwaPatientList;
  void RWAPatientListApi() async {
    isLoading(true);
    getRwaPatientList = await ApiProvider.RWAPatientListApi();
    if (getRwaPatientList != null) {
      isLoading(false);
      foundPatient.value = getRwaPatientList!.patient!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    RWAPatientListApi();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TextEditingController.dispose();
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
        ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
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

  RxList<Patient> foundPatient = RxList<Patient>([]);
  void filterpatientrwa(String searchpatientname) {
    List<Patient>? finalResult = [];
    if (searchpatientname.isEmpty) {
      finalResult = getRwaPatientList?.patient;
    } else {
      finalResult = getRwaPatientList?.patient!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchpatientname.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundPatient.value = finalResult!;
  }
}
