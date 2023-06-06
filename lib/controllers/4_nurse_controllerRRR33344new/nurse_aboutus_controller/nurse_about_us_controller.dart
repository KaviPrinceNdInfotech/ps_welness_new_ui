//LababoutusApi

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_aboutus_model.dart';

import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class NurseAboutusController extends GetxController {
  //RxBool isLoading = false.obs;

  RxBool isLoading = true.obs;

  NurseaboutusModel? nurseaboutusModel;

  // HealthCheckupListss? healthCheckupListss;

  ///todo: lab appointment details...12 may 2023...prince....
  ///
  void NurseaboutusApi() async {
    isLoading(true);
    nurseaboutusModel = await ApiProvider.NurseaboutusApi();
    print('Prince lab list');
    print(nurseaboutusModel);
    if (nurseaboutusModel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  late TextEditingController appointmentController;

  var appointment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    NurseaboutusApi();
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
}
