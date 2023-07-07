import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesPaymentReport_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchies_getRole_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FranchisePaymentReportController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  late TextEditingController appointmentController;
  FrenchiesPaymentReportModel? getfrenchiesPaymentReportModel;
  var appointment = ''.obs;
  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;
  // select subject dropdown in doctor complain..
  Rx<Role?> selectedRole = (null as Role?).obs;
  List<Role> role = <Role>[].obs;
  void getPaymentRoleApi() async {
    role = await ApiProvider.FrenchiesPaymentRole();
  }
  void frenchiesPaymentReportApi(String p)async{
    isLoading(true);
    getfrenchiesPaymentReportModel = await ApiProvider.FrenchiesPaymentReportApi(p);
    if(getfrenchiesPaymentReportModel?.paymentHistory != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesPaymentReportModel!.paymentHistory!;
    }
  }
  /// for search filter
  RxList<PaymentHistory> data = RxList<PaymentHistory>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<PaymentHistory>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesPaymentReportModel!.paymentHistory!;
    } else {
      finalResult = getfrenchiesPaymentReportModel!.paymentHistory!
          .where((element) => element.name
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
    getPaymentRoleApi();
    frenchiesPaymentReportApi('');
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
}
