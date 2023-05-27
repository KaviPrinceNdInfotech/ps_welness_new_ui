import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_order_historyModel.dart';
import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_order_historyModel.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/chemist_model/chemist_order_historyModel.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class ChemistOrderController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;
  late TextEditingController appointmentController;
  var appointment = ''.obs;
  ChemistOrderHistoryModel? getChemistOrderHistory;

  void chemistOrderHistorysApi() async {
    isLoading(true);
    getChemistOrderHistory = await ApiProvider.chemistOrderHistoryApi();
    if (getChemistOrderHistory?.chmi1 != null) {
      isLoading(false);
      foundOrder.value = getChemistOrderHistory!.chmi1!;
    }
  }

  @override
  void onInit() {
    chemistOrderHistorysApi();
    super.onInit();
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

  RxList<Chmi1> foundOrder = RxList<Chmi1>([]);
  void filterOrderChemist(String searchorderName) {
    List<Chmi1>? finalResult = [];
    if (searchorderName.isEmpty) {
      finalResult = getChemistOrderHistory!.chmi1!;
    } else {
      finalResult = getChemistOrderHistory!.chmi1!
          .where((element) => element.chemistName
              .toString()
              .toLowerCase()
              .contains(searchorderName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundOrder.value = finalResult!;
  }
}
