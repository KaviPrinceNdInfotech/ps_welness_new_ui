import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';

import '../../../modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import '../../../servicess_api/api_services_all_api.dart';

class ChemistComplaintController extends GetxController {
  final GlobalKey<FormState> chemistcomplaintformkey = GlobalKey<FormState>();
  TextEditingController? Other, Complain;

  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient?).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;
  void getNurseTypeApi() async {
    subject = await ApiProvider.DoctorComplainDropDownApi();
  }

  void chemistcomplaintApi() async {
    http.Response r = await ApiProvider.ChemistComplainApi(
        selectedSubject.value?.subid.toString(), Other?.text, Complain?.text);
    if (r.statusCode == 200) {
      Get.to(ChemistHomePage());
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
    }
  }

  var Login_Id = '';
  var Subjects = '';
  var complaint = '';
  var IsDeleted = '';
  var IsResolved = '';
  var Others = '';
  var Doctor = '';

  @override
  void onInit() {
    getNurseTypeApi();
    Other = TextEditingController();
    Complain = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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

  void checkChemist3() {
    if (chemistcomplaintformkey.currentState!.validate()) {
      chemistcomplaintApi();
    }
    chemistcomplaintformkey.currentState!.save();
  }
}
