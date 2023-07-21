import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/driver_payout_history_model.dart';

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/driver/driver_payout_history_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverPayoutHistoryController extends GetxController {
  RxBool isLoading = true.obs;

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  var appointment = ''.obs;
  late TextEditingController doctoridController,
      //selectedNurse.value?.id.toString(),
      appointmentController;

  ///
  List<DriverPayoutHistoryModel>? getDriverPayoutHistory;
  void driverPayoutHistoryApi() async {
    isLoading(true);
    getDriverPayoutHistory = await ApiProvider.DriverPayoutHistoryApi();
    if (getDriverPayoutHistory != null) {
      isLoading(false);
      foundpayoutdriver.value = getDriverPayoutHistory!;
    }
  }

  @override
  void onInit() {
    driverPayoutHistoryApi();
    super.onInit();
    doctoridController = TextEditingController();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
  }

  @override
  void onClose() {
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
  //

  RxList<DriverPayoutHistoryModel> foundpayoutdriver =
      RxList<DriverPayoutHistoryModel>([]);
  void filterpayouthistory(String searchpayoutdriver) {
    List<DriverPayoutHistoryModel>? finalResult = [];
    if (searchpayoutdriver.isEmpty) {
      finalResult = getDriverPayoutHistory!;
    } else {
      finalResult = getDriverPayoutHistory!
          .where((element) => element.paymentDate
              .toString()
              .toLowerCase()
              .contains(searchpayoutdriver.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundpayoutdriver.value = finalResult!;
  }
}
