//LababoutusApi

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/5_RWA_controller_RRR/rwa_aboutus_model.dart';

import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class RwaAboutusController extends GetxController {
  //RxBool isLoading = false.obs;

  RxBool isLoading = true.obs;

  RwaaboutusModel? rwaaboutusModel;

  // HealthCheckupListss? healthCheckupListss;

  ///todo: lab appointment details...12 may 2023...prince....
  ///
  void rwaaboutusApi() async {
    isLoading(true);
    rwaaboutusModel = await ApiProvider.RwaaboutusApi();
    print('Prince lab list');
    print(rwaaboutusModel);
    if (rwaaboutusModel != null) {
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
    rwaaboutusApi();
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
