import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';

import '../../../modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';


class FranchisesComplaintController extends GetxController {
  final GlobalKey<FormState> franchisescomplaintformkey = GlobalKey<FormState>();

  late TextEditingController othersController,complaintController;
  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient?).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;
  void getNurseTypeApi() async {
    subject = await ApiProvider.DoctorComplainDropDownApi();
  }
  void franchiescomplaintApi() async {
    http.Response r = await ApiProvider.Franchise_ComplaintApi(
        selectedSubject.value?.subid.toString(),
        othersController.text,
      complaintController.text
    );
    if (r.statusCode == 200) {
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
    super.onInit();
    getNurseTypeApi();
    othersController = TextEditingController();
    complaintController = TextEditingController();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
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
  void checkFranchisesComplain() {
    if (franchisescomplaintformkey.currentState!.validate()) {
      franchiescomplaintApi();
    }
    franchisescomplaintformkey.currentState!.save();
  }
}
