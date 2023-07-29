import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';

import '../../../model/1_user_model/hlthchkp_detail_model/healthchkp_detail_model.dart';
import '../../../model/1_user_model/time_slots_common_model/time_slots_common.dart';
// import '../../../model/9_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../../../model/9_prince_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../../../modules_view/1_user_section_views/doctorss/doctor_appointments_details/doctor_details_by_id/doctor_detail_by_id_model.dart';
import '../../../modules_view/1_user_section_views/doctorss/doctor_checkout/doctor_checkout.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';
import 'doctor_checkout_controller.dart';
//import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class DoctorListController extends GetxController {
  final GlobalKey<FormState> doctor3formkey = GlobalKey<FormState>();
  final DoctorCheckoutController _doctorappointmentcheckout =
      Get.put(DoctorCheckoutController());

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = true.obs;
  Rx<TimeSlot?> selectedTimeslot = (null as TimeSlot?).obs;
  List<TimeSlot> timeslot = <TimeSlot>[].obs;

  //late TextEditingController appointmentController;
  var appointment = ''.obs;

  GetDoctorListModel? doctorListUser;
  HealthCheckupcheDetail? healthCheckupcheDetail;

  void doctorListApi() async {
    isLoading(true);
    doctorListUser = await ApiProvider.ViewDoctorListApi();
    print('Prince doctor list');
    print(doctorListUser);
    if (doctorListUser != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundDoctors.value = doctorListUser!.doctorchoose!;
      //Get.to(()=>Container());
    }
  }

  ///lab_detail_api.....................18april....2023..
  void labdetailApi() async {
    isLoading(true);
    healthCheckupcheDetail = await ApiProvider.ViewdetailhlthchkpApi();
    print('Prince lab sedule.........');
    print(healthCheckupcheDetail);
    if (healthCheckupcheDetail?.year != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///nurse type api class.................
  void timeslotApi() async {
    timeslot = (await ApiProvider.gettimeslotApi())!;
    print('Prince time slot  list');
    print(timeslot);
  }

  void doctorBooking2Api() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.Doctorbooking2Api(
      doctoridController.text,
      selectedTimeslot.value?.slotid.toString(),
      appointmentController.text,

      //selectedState.value?.id.toString(),
      // selectedCity.value?.id.toString(),
    );
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      ///todo:for it it will call next screen apis and update....

      _doctorappointmentcheckout.doctoorcheckoutApi();
      _doctorappointmentcheckout.onInit();
      _doctorappointmentcheckout.update();
      await accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(seconds: 2),
          () {
            // labcheckoutApi();
            Get.to(DoctorAppointmentCheckout());

            //Get.to((page))
            ///
          },
        );
      });
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      //Get.to(NurseAppointmentHistory());

    }
  }

  late TextEditingController doctoridController,
      //selectedNurse.value?.id.toString(),
      appointmentController;

  ///get specialist api...........17 april 2023...prince
  GetDoctorDetailbyId? doctordetailbyid;
  void doctordetailApi() async {
    isLoading(true);
    doctordetailbyid = await ApiProvider.ViewDoctorDetailApi();
    if (doctordetailbyid?.doctorName == null) {
      Timer(
        const Duration(seconds: 2),
        () {
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(true);
      doctordetailbyid = await ApiProvider.ViewDoctorDetailApi();
      //Get.to(() => TotalPrice());

      //foundProducts.value = medicinelistmodel!.data;
      //Get.to(()=>Container());
    }
    print('Prince doctor list detail by id');
    print(doctordetailbyid);
    if (doctordetailbyid?.doctorName != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    doctorListApi();
    timeslotApi();
    doctordetailApi();
    doctoridController = TextEditingController();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
  }

  @override
  void onClose() {
    //doctorListUser = null;
    //super.onClose();
  }

  @override
  void dispose() {
    //doctorListUser = null;
    //super.dispose();
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

  RxList<Doctorchoose> foundDoctors = RxList<Doctorchoose>([]);
  void filterDoctor(String searchdoctorName) {
    List<Doctorchoose>? finalResult = [];
    if (searchdoctorName.isEmpty) {
      finalResult = doctorListUser!.doctorchoose;
    } else {
      finalResult = doctorListUser!.doctorchoose!
          .where((element) => element.doctorName
              .toString()
              .toLowerCase()
              .contains(searchdoctorName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundDoctors.value = finalResult!;
  }

  void checkdoctor2() {
    if (doctor3formkey.currentState!.validate()) {
      //nurseBookingFormApi();
      doctorBooking2Api();
    }
    doctor3formkey.currentState!.save();
  }
}

///todo from here checkout model value..............
