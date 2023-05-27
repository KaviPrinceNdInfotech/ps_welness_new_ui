import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//import 'package:ps_welness_new_ui/model/chemist_model/chemist_payoutModel.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_payoutModel.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:intl/intl.dart';

class ChemistPayoutController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  late TextEditingController appointmentController;
  var appointment = ''.obs;
  ChemistPayoutModel? getChemistPayoutModel;
  void chemistPayoutHistoryApi() async {
    getChemistPayoutModel = await ApiProvider.chemistPayoutHistoryApi();
    if (getChemistPayoutModel?.payout != null) {
      isLoading(false);
      foundPayout.value = getChemistPayoutModel!.payout!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    chemistPayoutHistoryApi();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
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
      appointmentController
        ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: appointmentController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  RxList<Payout> foundPayout = RxList<Payout>([]);
  void filterPayoutChemist(String searchpayoutName) {
    List<Payout>? finalResult = [];
    if (searchpayoutName.isEmpty) {
      finalResult = getChemistPayoutModel!.payout!;
    } else {
      finalResult = getChemistPayoutModel!.payout!
          .where((element) => element.chemistName
              .toString()
              .toLowerCase()
              .contains(searchpayoutName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundPayout.value = finalResult!;
  }
}
