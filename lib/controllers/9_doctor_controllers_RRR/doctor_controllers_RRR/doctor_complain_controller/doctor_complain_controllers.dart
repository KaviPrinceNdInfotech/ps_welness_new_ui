import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';

import '../../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import '../../../modules_view/9_doctor_section_view/home_page_view/home_page.dart';
//import '../../../modules_view/circular_loader/circular_loaders.dart';
//import '../../../servicess_api/api_services_all_api.dart';

class DoctorComplaintController extends GetxController {
  final GlobalKey<FormState> doctorcomplaintformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  // select subject dropdown in doctor complain..
  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient?).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;
  void getNurseTypeApi() async {
    subject = await ApiProvider.DoctorComplainDropDownApi();
  }

  void doctorcomplaintApi() async {
    http.Response r = await ApiProvider.doctorComplainApi(
        selectedSubject.value?.subjectName,
        complaintController.text,
        otherController.text);
    if (r.statusCode == 200) {}
  }

  ////////driver complain
  void drivercomplaintApi() async {
    http.Response r = await ApiProvider.driverComplainApi(
      selectedSubject.value?.subjectName,
      complaintController.text,
    );
    if (r.statusCode == 200) {}
  }

  late TextEditingController subjectController,
      complaintController,
      otherController;

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    getNurseTypeApi();
    subjectController = TextEditingController();
    complaintController = TextEditingController();
    otherController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subjectController.dispose();
    complaintController.dispose();
    otherController.dispose();
  }

  String? validothers(String value) {
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

  void checkDoctor() {
    doctorcomplaintApi();
    // if (doctorcomplaintformkey.currentState!.validate()) {
    //
    // }
    // doctorcomplaintformkey.currentState!.save();
  }

  void checkDriver() {
    drivercomplaintApi();
  }
}
