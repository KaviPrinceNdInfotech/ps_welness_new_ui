import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/5_RWA_controller_RRR/rwa_payment_report_model.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/RWA/rwa_payment_report_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class RwapaymentController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  late TextEditingController appointmentController;
  RwaPaymentReportModel? getRwaPaymentReport;
  var appointment = ''.obs;
 void RwaPaymentReportApi()async{
    getRwaPaymentReport=ApiProvider.RWAPaymentReportApi();
    if(getRwaPaymentReport?.rwaPaymentReport != null){
    }

 }

  @override
  void onInit() {
    super.onInit();
    RwaPaymentReportApi();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
  }
  @override
  void onReady() {
    super.onReady();
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
}
