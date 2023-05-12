import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/10_lab_module/lab_appointment_historyy_latest/lab_appointment_history_model.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class LabAppointmentHistoryyController extends GetxController {
  //RxBool isLoading = false.obs;

  RxBool isLoading = true.obs;

  LabappointmentHistoryModel? labappointmentHistoryModel;

  // HealthCheckupListss? healthCheckupListss;

  ///todo: lab appointment details...12 may 2023...prince....
  ///
  void labappointmenthistoryApi() async {
    isLoading(true);
    labappointmentHistoryModel = await ApiProvider.LabapointmenthistoryApi();
    print('Prince lab list');
    print(labappointmentHistoryModel);
    if (labappointmentHistoryModel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundpatienthistorylab.value = labappointmentHistoryModel!.labAppHistory!;
      //Get.to(()=>Container());
    }
  }

  late TextEditingController appointmentController;

  var appointment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    labappointmenthistoryApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //healthCheckupListss = null;
    super.onClose();

    //TextEditingController.dispose();
  }

  @override
  void dispose() {
    //healthCheckupListss = null;
    super.dispose();
  }

  RxList<LabAppHistory> foundpatienthistorylab = RxList<LabAppHistory>([]);
  void filterappinthispatient(String searchpatientlabName) {
    List<LabAppHistory>? finalResult = [];
    if (searchpatientlabName.isEmpty) {
      finalResult = labappointmentHistoryModel!.labAppHistory;
    } else {
      finalResult = labappointmentHistoryModel!.labAppHistory!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchpatientlabName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundpatienthistorylab.value = finalResult!;
  }
}
