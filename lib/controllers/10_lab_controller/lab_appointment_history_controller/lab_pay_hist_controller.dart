import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/4_nurse_all_models/nurse_appointment_details_list.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/4_nurse_all_models/nurse_appointment_details_list.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class LabpaymentController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = true.obs;

  //RxBool isLoading = true.obs;

  NurseAppointmentDetail? nurseappointmentdetail;

  //all catagary list .........

  void nursehistoryApi() async {
    isLoading(true);
    nurseappointmentdetail = await ApiProvider.NurseappointmentApi();
    if (
    nurseappointmentdetail?.result != null
    //appointmentdetail != null
    //getcatagartlist!.result!.isNotEmpty
    ) {
      isLoading(false);
    }
  }

  late TextEditingController appointmentController;

  var appointment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nursehistoryApi();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

    super.onClose();
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
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

//bool disableDate(DateTime day) {
//   if ((day.isAfter(DateTime.now().subtract(Duration(days: 4))) &&
//       day.isBefore(DateTime.now().add(Duration(days: 30))))) {
//     return true;
//   }
//   return false;
// }
}
