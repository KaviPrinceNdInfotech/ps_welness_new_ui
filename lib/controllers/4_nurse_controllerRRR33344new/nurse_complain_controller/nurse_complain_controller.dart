import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import '../../../servicess_api/api_services_all_api.dart';

class NurseComplaintController extends GetxController {
  final GlobalKey<FormState> nursecomplaintformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  ////////
  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient?).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;
  void getNurseTypeApi() async {
    subject = await ApiProvider.DoctorComplainDropDownApi();
  }

  void nursecomplaintApi() async {
    http.Response r = await ApiProvider.NurseComplainApi(
        selectedSubject.value?.subjectName,
        otherController.text,
        complaintController.text);
    if (r.statusCode == 200) {}
  }

  late TextEditingController subjectController,
      otherController,
      complaintController;

  @override
  void onInit() {
    super.onInit();
    getNurseTypeApi();
    subjectController = TextEditingController();
    otherController = TextEditingController();
    complaintController = TextEditingController();
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
