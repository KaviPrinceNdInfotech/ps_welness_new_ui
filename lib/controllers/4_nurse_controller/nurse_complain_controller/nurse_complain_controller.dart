import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../modules_view/4_nurse_section_view/nurse_home/nurse_home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';


class NurseComplaintController extends GetxController {
  final GlobalKey<FormState> nursecomplaintformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  void nursecomplaintApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.NurseComplainApi(
      loginidController.text,
      subjectController.text,
      complaintController.text,
      isdeletedController.text,
      isresolveController.text,
      otherController.text,
      //doctorController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(NurseHomePage());
    }
  }

  late TextEditingController

      subjectController,
      complaintController,
      isdeletedController,
      isresolveController,
      otherController,
      //doctorController''
       loginidController;


  var Subjects = '';
  var complaint = '';
  var IsDeleted = '';
  var IsResolved = '';
  var Others = '';
  //var Doctor = '';
  var Login_Id = '';

  @override
  void onInit() {
    states.refresh();
    super.onInit();


    subjectController = TextEditingController();
    complaintController = TextEditingController();
    isdeletedController = TextEditingController();
    isresolveController = TextEditingController();
    otherController = TextEditingController();
    loginidController = TextEditingController();
    //doctorController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subjectController.dispose();
    complaintController.dispose();
    isdeletedController.dispose();
    isresolveController.dispose();
    otherController.dispose();
    loginidController.dispose();

    // doctorController.dispose();
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
    // final isValid = complaintformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    //complaintformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
