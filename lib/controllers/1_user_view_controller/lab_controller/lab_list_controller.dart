import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_details_api.dart';

import '../../../model/1_user_model/lab_details/lab_checkout_modells.dart';
import '../../../model/1_user_model/lab_list_models.dart';
import '../../../model/1_user_model/time_slots_common_model/time_slots_common.dart';
import '../../../modules_view/1_user_section_views/lab/lab_appointment_checkout/lab_appointment_checkout.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

//import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class LabListController extends GetxController {
  final GlobalKey<FormState> Lab3formkey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;

  LabListUser? labListUser;
  Labdetailbyid? labdetailsbyid;
  Labcheckoutmodel? labCheckoutModel;

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;

  var appointment = ''.obs;

  Rx<TimeSlot?> selectedTimeslot = (null as TimeSlot?).obs;
  List<TimeSlot> timeslot = <TimeSlot>[].obs;

  ///todo from here we have get nurse checkout by location id...
  void labcheckoutApi() async {
    //isLoading(true);
    labCheckoutModel = await ApiProvider.LabcheckoutApi();
    print('Prince doctor list');
    print(labCheckoutModel);
    if (
        //nurseappointmentdetail?.result != null
        labCheckoutModel != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  void labListApi() async {
    isLoading(true);
    labListUser = await ApiProvider.ViewLabListApi();
    print('Prince lab list');
    print(labListUser);
    if (labListUser?.labBookings != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundlabProducts.value = labListUser!.labBookings!;
      //Get.to(()=>Container());
    }
  }

  ///lab_detail_api.....................18april....2023..
  void labdetailApi() async {
    isLoading(true);
    labdetailsbyid = await ApiProvider.ViewLabdetailssApi();
    print('Prince lab sedule.........');
    print(labdetailsbyid);
    if (labdetailsbyid != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///time slot api.......

  ///nurse type api class.................
  void timeslotApi() async {
    timeslot = (await ApiProvider.gettimeslotApi())!;
    print('Prince time slot  list');
    print(timeslot);
  }

  ///todo: lab booking 3... post api...28 april 2023...
  ///todo: nurse schedule api by the help of list Id of nurse....
  void labBooking2Api() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.Labbooking2Api(
      labidController.text,
      appointmentController.text,
      selectedTimeslot.value?.slotid.toString(),
      //selectedState.value?.id.toString(),
      // selectedCity.value?.id.toString(),
    );
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      //Get.to(NurseListUser());
      // Get.to(NurseDetailsSchedulePage());
      Get.to(() => LabAppointmentCheckout());

      /// we can navigate to user page.....................................
      //Get.to(NurseAppointmentHistory());

    }
  }

  late TextEditingController labidController,
      //selectedNurse.value?.id.toString(),
      appointmentController;

  @override
  void onInit() {
    super.onInit();
    labListApi();
    labdetailApi();
    timeslotApi();
    labcheckoutApi();
    labidController = TextEditingController();
    appointmentController = TextEditingController();
    appointmentController.text = "YYY-MM-DD";
  }

  @override
  void onClose() {
    labListUser = null;
    super.onClose();
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

  @override
  void dispose() {
    labListUser = null;
    super.dispose();
  }

  RxList<LabBooking> foundlabProducts = RxList<LabBooking>([]);

  void filterProduct(String searchlabName) {
    List<LabBooking>? finalResult = [];
    if (searchlabName.isEmpty) {
      finalResult = labListUser!.labBookings;
    } else {
      finalResult = labListUser!.labBookings
          ?.where((element) => element.labName
              .toString()
              .toLowerCase()
              .contains(searchlabName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundlabProducts.value = finalResult!;
  }

  ///.......................
  void checkLab2() {
    if (Lab3formkey.currentState!.validate()) {
      //nurseBookingFormApi();
      labBooking2Api();
    }
    Lab3formkey.currentState!.save();
  }
}

///todo from here checkout model value..............
