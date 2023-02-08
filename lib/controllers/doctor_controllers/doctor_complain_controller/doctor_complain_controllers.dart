import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../modules_view/9_doctor_section_view/home_page_view/home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/modules_view/9_doctor_section_view/home_page_view/home_page.dart';
//import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class DoctorComplaintController extends GetxController {
  final GlobalKey<FormState> doctorcomplaintformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  void doctorcomplaintApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.doctorComplainApi(
      loginidController.text,
      subjectController.text,
      complaintController.text,
      isdeletedController.text,
      isresolveController.text,
      otherController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to doctor page.....................................
      Get.to(HomePage());
    }
  }

  late TextEditingController loginidController,
      subjectController,
      complaintController,
      isdeletedController,
      isresolveController,
      otherController;

  var Login_Id = '';
  var Subjects = '';
  var complaint = '';
  var IsDeleted = '';
  var IsResolved = '';
  var Others = '';

  @override
  void onInit() {
    states.refresh();
    super.onInit();

    loginidController = TextEditingController();
    subjectController = TextEditingController();
    complaintController = TextEditingController();
    isdeletedController = TextEditingController();
    isresolveController = TextEditingController();
    otherController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    loginidController.dispose();
    subjectController.dispose();
    complaintController.dispose();
    isdeletedController.dispose();
    isresolveController.dispose();
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
    if (doctorcomplaintformkey.currentState!.validate()) {
      doctorcomplaintApi();
    }
    doctorcomplaintformkey.currentState!.save();
    // final isValid = complaintformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    //complaintformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
