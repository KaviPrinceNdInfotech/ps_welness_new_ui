import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_detail_id.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_list_modelby_locationid.dart';

import '../../../model/4_nurse_all_models/nurse_appointment_details_list.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/4_nurse_all_models/nurse_appointment_details_list.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class NurseAppointmentDetailController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  late TextEditingController appointmentController;

  var appointment = ''.obs;

  NurseAppointmentDetail? nurseappointmentdetail;
  NurseListbycityId? nurseListbycityId;

  NursedetailbyId? nursedetailbyId;

  //all catagary list .........

  void nurseappointmentApi() async {
    //isLoading(true);
    nurseappointmentdetail = await ApiProvider.NurseappointmentApi();
    print('Prince doctor list');
    print(nurseappointmentdetail);
    if (
    //nurseappointmentdetail?.result != null
    nurseappointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
     //foundNurses.value = nurseappointmentdetail!.result!;

    }
  }

  ///todo from here we have get nurse list by location id...
  void nurselistsApi() async {
    //isLoading(true);
    nurseListbycityId = await ApiProvider.NursListApi();
    print('Prince doctor list');
    print(nurseListbycityId);
    if (
    //nurseappointmentdetail?.result != null
    nurseListbycityId != null
    //getcatagartlist!.result!.isNotEmpty
    ) {
      isLoading(false);
      foundNurses.value = nurseListbycityId!.getNurse!;

    }
  }

  ///todo: from here nurse detail.............18 april 2023...

  void nursedetailApi() async {
    //isLoading(true);
    nursedetailbyId = await ApiProvider.NursDetailApi();
    print('Prince nurse detail..');
    print(nursedetailbyId);
    if (nursedetailbyId != null
    //nurseappointmentdetail?.result != null
    //nursedetailbyId != null
    //getcatagartlist!.result!.isNotEmpty
    ) {
      isLoading(false);
      //foundNurses.value = nurseappointmentdetail!.result!;

    }
  }

  @override
  void onInit() {
    super.onInit();
    nurseappointmentApi();
    nurselistsApi();
    nursedetailApi();
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

RxList<GetNurse> foundNurses = RxList<GetNurse>([]);
  void filterNurse (String searchnursepatientName) {
    List<GetNurse>? finalResult = [];
    if (searchnursepatientName.isEmpty) {
      finalResult = nurseListbycityId!.getNurse;
    } else {
      finalResult = nurseListbycityId!.getNurse!.where((element) => element.nurseName
          .toString().toLowerCase().contains(searchnursepatientName.toString().toLowerCase().trim())
      ).toList();
    }
    print(finalResult!.length);
    foundNurses.value = finalResult!;
  }
}
