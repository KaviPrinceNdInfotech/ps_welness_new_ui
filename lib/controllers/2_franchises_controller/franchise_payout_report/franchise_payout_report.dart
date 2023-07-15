import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/Frenchies_payoutReport_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FranchisePayoutReportController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  var selectedDate2 = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  var newpickedDate2 = DateTime.now().obs;
  RxBool isLoading = false.obs;

  late TextEditingController appointmentController;

  late TextEditingController appointmentController2;

  var appointment = ''.obs;
  var appointment2 = ''.obs;

  // ///this is for State....................................
  // Rx<String?> selectedCity = (null as String?).obs;
  // RxList<String> cities = <String>[].obs;
  //
  // //this is for City.................................
  // Rx<String?> selectedState = (null as String?).obs;
  // RxList<String> states = <String>[].obs;
  FrenchiesPayoutReportModel? getFrenchiesPayoutReportModel;
 void frenchiesPayoutReportApi()async{
   isLoading(true);
   getFrenchiesPayoutReportModel = await ApiProvider.FrenchiesPayoutReportApi();
   if(getFrenchiesPayoutReportModel?.payoutHistory != null){
     isLoading(false);
     ///for search filter
     data.value = getFrenchiesPayoutReportModel!.payoutHistory!;
   }
 }
 ///todo search filter
  RxList<PayoutHistory> data = RxList<PayoutHistory>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<PayoutHistory>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getFrenchiesPayoutReportModel!.payoutHistory!;
    } else {
      finalResult = getFrenchiesPayoutReportModel!.payoutHistory!
          .where((element) => element.vendorName
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }
  @override
  void onInit() {
    super.onInit();
    frenchiesPayoutReportApi();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
    appointmentController2 = TextEditingController();
    appointmentController2.text = "DD-MM-YYYY";
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
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

  chooseDate2() async {
    DateTime? newpickedDate2 = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate2.value,
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
    if (newpickedDate2 != null) {
      selectedDate2.value = newpickedDate2;
      appointmentController2
        ..text = DateFormat.yMMMd().format(selectedDate2.value).toString()
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
}
