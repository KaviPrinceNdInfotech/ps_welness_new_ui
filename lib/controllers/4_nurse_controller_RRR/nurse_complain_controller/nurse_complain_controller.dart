import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/complain_nurse_model.dart';
//import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';

import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';

//import '../../../model/9_doctors_model_RRR/doctor_homepage_model/complain_doctor_model.dart';
//import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class NurseComplaintController extends GetxController {
  final GlobalKey<FormState> nursecomplaintformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  TextEditingController? Other, Complain;

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  ////////
  Rx<ComplaintNurse41Patient?> selectedSubject =
      (null as ComplaintNurse41Patient?).obs;
  List<ComplaintNurse41Patient> subject = <ComplaintNurse41Patient>[].obs;

  ///get type dropdown.....
  void getNurseTypeApi() async {
    subject = await ApiProvider.NurseComplainDropDownApi();
  }

  void nursecomplaintApi() async {
    http.Response r = await ApiProvider.NurseComplainApi(
        selectedSubject.value?.subid.toString(), Other?.text, Complain?.text);
    if (r.statusCode == 200) {
      Get.to(NurseHomePage());
      CallLoader.hideLoader();
    }
  }

  // late TextEditingController subjectController,
  //     otherController,
  //     complaintController;

  @override
  void onInit() {
    super.onInit();
    getNurseTypeApi();
    Other = TextEditingController();
    Complain = TextEditingController();
    // complaintController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Other.dispose();
    //Complain.dispose();
    // otherController.dispose();
  }

  String? validothers(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  String? validsubject(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  String? validAddress(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  void checkNurse3() {
    if (nursecomplaintformkey.currentState!.validate()) {
      nursecomplaintApi();
    }
    nursecomplaintformkey.currentState!.save();
  }
}
