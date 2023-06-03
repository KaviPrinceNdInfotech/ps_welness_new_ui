import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

import '../../../model/4_nurse_all_models_RRR/nurse_appointment_details_list.dart';
// import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
//
// import '../../../model/4_nurse_all_models/nurse_appointment_details_list.dart';
//import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/4_nurse_all_models/nurse_appointment_details_list.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class NurseAppointmentNurseDetailController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  late TextEditingController appointmentController;

  var appointment = ''.obs;

  NurseAppointmentDetail? nurseappointmentdetail;

  //all catagary list .........

  void nurseappointmentApi() async {
    isLoading(true);
    nurseappointmentdetail = await ApiProvider.NurseappointmentApi();
    if (
        //nurseappointmentdetail?.result != null
        nurseappointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundAppointmentnurse.value = nurseappointmentdetail!.result!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    nurseappointmentApi();
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
  }

  RxList<Result> foundAppointmentnurse = RxList<Result>([]);

  void filterAppointNurse(String searchAppointNurse) {
    List<Result>? finalResult = [];
    if (searchAppointNurse.isEmpty) {
      finalResult = nurseappointmentdetail!.result;
    } else {
      finalResult = nurseappointmentdetail!.result
          ?.where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchAppointNurse.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundAppointmentnurse.value = finalResult!;
  }
}
