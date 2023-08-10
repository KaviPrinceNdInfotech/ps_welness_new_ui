import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesCommissionReportDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesCommissionReport_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTotalCommission_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FranchiseCommissionReportController extends GetxController {
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

  FrenchiesCommissionReportModel? getfrenchiesCommissionReportModel;
  FrenchiesTotalCommissionModel? getfrenchiesTotalCommissionModel;
  Rx<CommissionDropdown?> selectedRole = (null as CommissionDropdown?).obs;
  List<CommissionDropdown> role = <CommissionDropdown>[].obs;
  void getCommissionRoleApi() async {
    role = await ApiProvider.FrenchiesCommissionReportRole();
  }

  void frenchiesCommissionReportApi() async {
    var d1 = DateFormat("yyyy-MM-dd").format(selectedDate.value).toString();
    var d2 = DateFormat("yyyy-MM-dd").format(selectedDate2.value).toString();
    isLoading(true);
    getfrenchiesCommissionReportModel =
        await ApiProvider.FrenchiesCommissionReportApi(
            selectedRole.value?.name.toString(), d1.toString(), d2.toString());
    if (getfrenchiesCommissionReportModel?.commissionReport != null) {
      isLoading(false);
    }
    isLoading(false);
  }

  ////
  void frenchiesTotalCommissionAmountApi() async {
    var d1 = DateFormat("yyyy-MM-dd").format(selectedDate.value).toString();
    var d2 = DateFormat("yyyy-MM-dd").format(selectedDate2.value).toString();
    isLoading(true);
    getfrenchiesTotalCommissionModel =
        await ApiProvider.FrenchiesTotalCommissionAmountApi(
            selectedRole.value?.name.toString(), d1.toString(), d2.toString());
    if (getfrenchiesTotalCommissionModel?.totalCommissionAmount != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    var d3 = DateFormat("dd-MM-yyyy").format(selectedDate.value).toString();
    var d4 = DateFormat("dd-MM-yyyy").format(selectedDate2.value).toString();
    getCommissionRoleApi();
    frenchiesCommissionReportApi();
    frenchiesTotalCommissionAmountApi();
    appointmentController = TextEditingController();
    appointmentController.text = d3;

    appointmentController2 = TextEditingController();
    appointmentController2.text = d4;
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
      helpText: 'Select Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',

      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Select Date',

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

  chooseDate2() async {
    DateTime? newpickedDate2 = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate2.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',

      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Select date',
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
  }
}
