import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/1_user_model/nurse_appointment_models/nurse_detail_id.dart';
import '../../../model/1_user_model/time_slots_common_model/time_slots_common.dart';
import '../../../modules_view/1_user_section_views/nursess/nurse_list_userrrr/nurse_list_user_model.dart';
import '../../../servicess_api/api_services_all_api.dart';

class NurseUserListController extends GetxController {
  //final GlobalKey<FormState> NurseBooking2formkey = GlobalKey<FormState>();

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;
  //
  // late TextEditingController appointmentController;

  var appointment = ''.obs;

  Rx<TimeSlot?> selectedTimeslot = (null as TimeSlot?).obs;
  List<TimeSlot> timeslot = <TimeSlot>[].obs;

  ///NurseAppointmentDetail? nurseappointmentdetail;

  NurseListbylocationId? nurseListbylocationId;

  //NurseListbycityId? nurseListbycityId;

  NursedetailbyId? nursedetailbyId;

  ///nurse type api class.................
  // void timeslotApi() async {
  //   timeslot = (await ApiProvider.gettimeslotApi())!;
  //   print('Prince time slot  list');
  //   print(timeslot);
  // }

  //all catagary list .........

  // void nurseappointmentApi() async {
  //   //isLoading(true);
  //   nurseappointmentdetail = await ApiProvider.NurseappointmentApi();
  //   if (
  //   //nurseappointmentdetail?.result != null
  //   nurseappointmentdetail != null
  //   //getcatagartlist!.result!.isNotEmpty
  //   ) {
  //     isLoading(false);
  //   }
  // }

  ///todo: nurse schedule api by the help of list Id of nurse....

  late TextEditingController appointmentController, nurseidController;
  //selectedNurse.value?.id.toString(),
  //appointmentController;

  ///todo from here we have get nurse list by location id...
  void nurselistsuserApi() async {
    isLoading(true);
    nurseListbylocationId = await ApiProvider.NursListUserrApi();
    print('Prince doctor list');
    print(nurseListbylocationId);
    if (
        //nurseappointmentdetail?.result != null
        nurseListbylocationId != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundNurses.value = nurseListbylocationId!.nurseLists!;
    }
  }

  ///todo: from here nurse detail.............18 april 2023...
  //
  // void nursedetailApi() async {
  //   //isLoading(true);
  //   nursedetailbyId = await ApiProvider.NursDetailApi();
  //   print('Prince nurse detail..');
  //   print(nursedetailbyId);
  //   if (nursedetailbyId != null
  //   //nurseappointmentdetail?.result != null
  //   //nursedetailbyId != null
  //   //getcatagartlist!.result!.isNotEmpty
  //   ) {
  //     isLoading(false);
  //     //foundNurses.value = nurseappointmentdetail!.result!;
  //
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    nurselistsuserApi();

    // nurseidController = TextEditingController();
    // appointmentController = TextEditingController();
    // appointmentController.text = "YYY-MM-DD";
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

//bool disableDate(DateTime day) {
//   if ((day.isAfter(DateTime.now().subtract(Duration(days: 4))) &&
//       day.isBefore(DateTime.now().add(Duration(days: 30))))) {
//     return true;
//   }
//   return false;
// }

  RxList<NurseListlucationid> foundNurses = RxList<NurseListlucationid>([]);
  void filterNurse(String searchnursepatientName) {
    List<NurseListlucationid>? finalResult = [];
    if (searchnursepatientName.isEmpty) {
      finalResult = nurseListbylocationId!.nurseLists!;
    } else {
      finalResult = nurseListbylocationId!.nurseLists!
          .where((element) => element.nurseName
              .toString()
              .toLowerCase()
              .contains(searchnursepatientName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult.length);
    foundNurses.value = finalResult;
  }

  ///.......................
  // void checkNurse2() {
  //   if (NurseBooking2formkey.currentState!.validate()) {
  //     //nurseBookingFormApi();
  //     nurseBooking2Api();
  //   }
  //   NurseBooking2formkey.currentState!.save();
  // }
}
