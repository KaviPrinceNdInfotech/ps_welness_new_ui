import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/nurse_history/nurse_history_page.dart';

import '../../../../model/4_nurse_all_models/nurse_appointment_details_list.dart';
import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/4_nurse_all_models/nurse_appointment_details_list.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class NurseHistoryController extends GetxController {
  final GlobalKey<FormState> NurseHistoryformkey = GlobalKey<FormState>();

  var appointment = ''.obs;
  RxBool isLoading = true.obs;

  NurseAppointmentDetail? nurseappointmentdetail;

  //all catagary list .........

  void nursehistoryApi() async {
    isLoading(true);
    nurseappointmentdetail = await ApiProvider.NurseappointmentApibyuser();
    if (nurseappointmentdetail?.data != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundNurse.value = nurseappointmentdetail!.data!;
    }
  }

  ///delete_nurse...api...
  void deletenurseehistoryApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.nurseHisdeleteApi();
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();
      nursehistoryApi();
      Get.to(
        () => NurseHistoryUser(
            //id: "1234568911",
            ), //next page class
        duration: Duration(
            milliseconds: 400), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );

      //Get.back();
      //Get.offAll(() => AddSkilsScreen());

    }
  }

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  //RxBool isLoading = false.obs;

  late TextEditingController appointmentController1;

  ///this is for State....................................

  //radio.........

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    nursehistoryApi();

    appointmentController1 = TextEditingController();
    appointmentController1.text = "DD-MM-YYYY";
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
      appointmentController1
        ..text = DateFormat.yMMMd().format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: appointmentController1.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  void checklabhistory1() {
    final isValid = NurseHistoryformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    NurseHistoryformkey.currentState!.save();
    //Get.to(() => HomePage());
  }

  RxList<Datum> foundNurse = RxList<Datum>([]);
  void filterNurse(String searchnurseName) {
    List<Datum>? finalResult = [];
    if (searchnurseName.isEmpty) {
      finalResult = nurseappointmentdetail!.data;
    } else {
      finalResult = nurseappointmentdetail!.data!
          .where((element) => element.nurseName
              .toString()
              .toLowerCase()
              .contains(searchnurseName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundNurse.value = finalResult!;
  }
}
