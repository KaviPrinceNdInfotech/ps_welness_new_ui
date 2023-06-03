import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';

//import '../../../modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import '../../../model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

class RwaComplaintController extends GetxController {
  final GlobalKey<FormState> rwacomplaintformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  //this is for subject type.................................
  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient?).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;

  ///todo: complain subject type........................31_may...2023....
  void getcomplainTypeeApi() async {
    subject = await ApiProvider.getsubjecttypeApi();
    print('Prince subject type list');
    print(subject);
  }

  void rwacomplaintApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.RwaComplainpi(
      selectedSubject.value?.subid.toString(),
      complaintController.text,
      otherController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(RwaHomePage());
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
    getcomplainTypeeApi();
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

  void checkrwa3() {
    if (rwacomplaintformkey.currentState!.validate()) {
      rwacomplaintApi();
    }
    rwacomplaintformkey.currentState!.save();
    // final isValid = complaintformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    //complaintformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
