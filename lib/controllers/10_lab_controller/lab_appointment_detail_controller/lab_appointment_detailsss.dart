import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/10_lab_module/lab_appointment_details/lab_appointment_detailsss.dart';

//import 'package:ps_welness_new_ui/model/10_lab_module/lab_appointment_details/lab_appointment_detailsss.dart';

import '../../../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class LabAppointmentDetailController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  //RxBool isLoading = false.obs;

  RxBool isLoading = true.obs;

  HealthCheckupListss? healthCheckupListss;

  LabappointmentdetailssModel? labappointmentdetailsModel;

  // HealthCheckupListss? healthCheckupListss;

  void labappointmentListApi() async {
    isLoading(true);
    healthCheckupListss = await ApiProvider.LabHistoryApi();
    print('Prince lab list');
    print(healthCheckupListss);
    if (healthCheckupListss != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///todo: lab appointment details...12 may 2023...prince....
  ///
  void labappointmentdetailApi() async {
    isLoading(true);
    labappointmentdetailsModel = await ApiProvider.LabapointmentdetailApi();
    if (labappointmentdetailsModel == null) {
      Timer(
        const Duration(seconds: 1),
        () {
          //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(false);
      labappointmentdetailsModel = await ApiProvider.LabapointmentdetailApi();
      //Get.to(() => TotalPrice());

      //foundProducts.value = medicinelistmodel!.data;
      //Get.to(()=>Container());
    }
    print('Prince lab list');
    print(labappointmentdetailsModel);
    if (labappointmentdetailsModel?.labAdapt != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundpatientlab.value = labappointmentdetailsModel!.labAdapt!;
      //Get.to(()=>Container());
    }
  }

  late TextEditingController appointmentController;

  var appointment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    labappointmentListApi();
    appointmentController = TextEditingController();
    appointmentController.text = "DD-MM-YYYY";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    healthCheckupListss = null;
    super.onClose();

    //TextEditingController.dispose();
  }

  @override
  void dispose() {
    healthCheckupListss = null;
    super.dispose();
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

  RxList<Labaptdetail> foundpatientlab = RxList<Labaptdetail>([]);
  void filterPatients(String searchpatientlabName) {
    List<Labaptdetail>? finalResult = [];
    if (searchpatientlabName.isEmpty) {
      finalResult = labappointmentdetailsModel!.labAdapt;
    } else {
      finalResult = labappointmentdetailsModel!.labAdapt!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchpatientlabName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundpatientlab.value = finalResult;
  }
}
