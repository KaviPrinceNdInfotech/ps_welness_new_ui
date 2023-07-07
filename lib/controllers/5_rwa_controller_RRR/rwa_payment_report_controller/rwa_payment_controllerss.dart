import 'package:flutter/material.dart';
//import 'package:get/get_RWA_controller_RRR/rwa_payment_report_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../model/5_RWA_controller_RRR/rwa_payment_report_model.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/RWA/rwa_payment_report_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class RwapaymentController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = true.obs;

  late TextEditingController appointmentController;
  RwaPaymentReportModel? getRwaPaymentReport;
  var appointment = ''.obs;

  void RwaPaymentReportApi() async {
    isLoading(true);
    getRwaPaymentReport = await ApiProvider.RWAPaymentReportApi();
    if (getRwaPaymentReport?.rwaPaymentReport != null) {
      isLoading(false);
      foundPayment.value = getRwaPaymentReport!.rwaPaymentReport!;
    }
  }

  @override
  void onInit() {
    // super.onInit();
    RwaPaymentReportApi();
    appointmentController = TextEditingController();
    appointmentController.text = "";
  }

  @override
  void onReady() {
    //super.onReady();
  }

  // chooseDate() async {
  //   DateTime? newpickedDate = await showDatePicker(
  //     context: Get.context!,
  //     initialDate: selectedDate.value,
  //     firstDate: DateTime(2018),
  //     lastDate: DateTime(2025),
  //     initialEntryMode: DatePickerEntryMode.input,
  //     initialDatePickerMode: DatePickerMode.year,
  //     helpText: 'Select DOB',
  //     cancelText: 'Close',
  //     confirmText: 'Confirm',
  //     errorFormatText: 'Enter valid date',
  //     errorInvalidText: 'Enter valid date range',
  //     fieldLabelText: 'DOB',
  //   );
  //   if (newpickedDate != null) {
  //     selectedDate.value = newpickedDate;
  //     appointmentController
  //       ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
  //       ..selection = TextSelection.fromPosition(TextPosition(
  //           offset: appointmentController.text.length,
  //           affinity: TextAffinity.upstream));
  //   }
  // }

  RxList<RwaPaymentReport> foundPayment = RxList<RwaPaymentReport>([]);
  void filterpaymentrwa(String searchuserpaymentname) {
    List<RwaPaymentReport>? finalResult = [];
    if (searchuserpaymentname.isEmpty) {
      finalResult = getRwaPaymentReport?.rwaPaymentReport;
    } else {
      finalResult = getRwaPaymentReport?.rwaPaymentReport!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchuserpaymentname.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundPayment.value = finalResult!;
  }
}
