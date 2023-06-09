//LababoutusApi

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_homepage_model/about_us_model/about_us_model.dart';

import '../../../servicess_api/api_services_all_api.dart';

class DoctorAboutusController extends GetxController {
  //RxBool isLoading = false.obs;

  RxBool isLoading = true.obs;

  AboutUsModelDoctor? doctoraboutusModel;

  // HealthCheckupListss? healthCheckupListss;

  ///todo: lab appointment details...12 may 2023...prince....
  ///
  void doctoraboutusApi() async {
    isLoading(true);
    doctoraboutusModel = await ApiProvider.DoctoraboutusApi();
    print('Prince lab list');
    print(doctoraboutusModel);
    if (doctoraboutusModel != null) {
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
    doctoraboutusApi();
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
