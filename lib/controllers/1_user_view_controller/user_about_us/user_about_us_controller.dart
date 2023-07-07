//LababoutusApi

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/about_us_user_model/user_aboutus_model.dart';

import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class UserAboutusController extends GetxController {
  //RxBool isLoading = false.obs;

  RxBool isLoading = true.obs;

  UseraboutusModel? useraboutusModel;

  // HealthCheckupListss? healthCheckupListss;

  ///todo: lab appointment details...12 may 2023...prince....
  ///
  void useraboutusApi() async {
    isLoading(true);
    useraboutusModel = await ApiProvider.UseraboutusApi();
    print('Prince lab list');
    print(useraboutusModel);
    if (useraboutusModel != null) {
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
    useraboutusApi();
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
