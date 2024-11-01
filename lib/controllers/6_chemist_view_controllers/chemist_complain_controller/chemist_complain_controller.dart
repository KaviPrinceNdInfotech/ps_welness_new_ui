import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import '../../../modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import '../../../modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

class ChemistComplaintController extends GetxController {
  final GlobalKey<FormState> chemistcomplaintformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  void usercomplaintApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.UserComplainApi(
      loginidController.text,
      subjectController.text,
      complaintController.text,
      isdeletedController.text,
      isresolveController.text,
      otherController.text,
      doctorController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(ChemistHomePage());
    }
  }

  late TextEditingController loginidController,
      subjectController,
      complaintController,
      isdeletedController,
      isresolveController,
      otherController,
      doctorController;

  var Login_Id = '';
  var Subjects = '';
  var complaint = '';
  var IsDeleted = '';
  var IsResolved = '';
  var Others = '';
  var Doctor = '';

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
    doctorController = TextEditingController();
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
    doctorController.dispose();
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

  void checkChemist3() {
    if (chemistcomplaintformkey.currentState!.validate()) {
      usercomplaintApi();
    }
    chemistcomplaintformkey.currentState!.save();
    // final isValid = complaintformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    //complaintformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
