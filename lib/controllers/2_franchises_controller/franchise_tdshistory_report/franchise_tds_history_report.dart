import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTDSReportDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTDSReportList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTdsListByDate_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTotalTDS_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FranchiseTdsHistoryReportController extends GetxController {
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

  FrenchiesTdsReportModel? getfrenchiesTdsReportModel;
  FrenchiesTotalTdsModel? getfrenchiesTotalTdsModel;
  TdsByDateModel? gettdsByDateModel;
  Rx<TdsDropdown?> selectedRole = (null as TdsDropdown?).obs;
  List<TdsDropdown> role = <TdsDropdown>[].obs;
  void getTdsRoleApi() async {
    role = await ApiProvider.FrenchiesTdsReportRole();
  }

  void frenchiesTDSReportApi(String p) async {
    isLoading(true);
    getfrenchiesTdsReportModel = await ApiProvider.FrenchiesTDSReportApi(p);
    if (getfrenchiesTdsReportModel?.tdsReport != null) {
      isLoading(false);
    }
  }

  void frenchiesTotalTDSAmountApi() async {
    var d1 = DateFormat("yyyy-MM-dd").format(selectedDate.value).toString();
    var d2 = DateFormat("yyyy-MM-dd").format(selectedDate2.value).toString();
    isLoading(true);
    getfrenchiesTotalTdsModel = await ApiProvider.FrenchiesTotalTDSAmountApi(
        selectedRole.value?.name.toString(), d1.toString(), d2.toString());
    if (getfrenchiesTotalTdsModel?.amount != null) {
      isLoading(false);
    }
  }

  /// tds list by date
  void frenchiesTDSListByDateApi() async {
    var d1 = DateFormat("yyyy-MM-dd").format(selectedDate.value).toString();
    var d2 = DateFormat("yyyy-MM-dd").format(selectedDate2.value).toString();
    isLoading(true);
    gettdsByDateModel = await ApiProvider.FrenchiesTDSListByDateApi(
        selectedRole.value?.name.toString(), d1.toString(), d2.toString());
    if (gettdsByDateModel?.tdsReport != null) {
      isLoading(false);
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getTdsRoleApi();
    frenchiesTDSReportApi('');
    frenchiesTotalTDSAmountApi();
    frenchiesTDSListByDateApi();
    appointmentController = TextEditingController();
    appointmentController.text = 'dd-MM-yyyy';
    appointmentController2 = TextEditingController();
    appointmentController2.text = 'dd-MM-yyyy';
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
      helpText: 'Select Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
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
      fieldLabelText: 'Selected date',
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
  // chooseDate() async{
  //   DateTime? pickedDate = await showDatePicker(
  //       context: Get.context!,
  //       initialDate: selectedDate.value,
  //       firstDate: DateTime(2018),
  //       lastDate: DateTime(2025));
  //   if(pickedDate != null && pickedDate != selectedDate.value){
  //     selectedDate.value = pickedDate;
  //   }
  // }
  // chooseDate2() async{
  //   DateTime? pickedDate = await showDatePicker(
  //       context: Get.context!,
  //       initialDate: selectedDate2.value,
  //       firstDate: DateTime(2018),
  //       lastDate: DateTime(2025));
  //   if(pickedDate != null && pickedDate != selectedDate2.value){
  //     selectedDate2.value = pickedDate;
  //   }
  // }
}
