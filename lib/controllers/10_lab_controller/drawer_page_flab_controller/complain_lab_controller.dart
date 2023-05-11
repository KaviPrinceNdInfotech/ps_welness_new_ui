import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';

import '../../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import '../../model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';

class ComplaintLabController extends GetxController {
  final GlobalKey<FormState> complaintlabformkey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;

  //this is for subject type.................................
  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient?).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;

  ///todo: complain subject type.........................25april...2023..

  ///nurse type api class.................
  void getcomplainTypeeApi() async {
    subject = await ApiProvider.getsubjecttypeApi();
    print('Prince subject type list');
    print(subject);
  }

  ///todo: user complain post Api...........26 april 2023.....

  void postComplainLabApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.LabComplainpi(
      complainController.text,
      loginidController.text,
      selectedSubject.value?.subid.toString(),
      otherController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(LabHomePage());
    }
  }

  late TextEditingController patsubidController,
      otherController,
      complainController,
      loginidController;

  var postsubid = '';
  var Others = '';
  var Complaints = '';
  var Login_Id = '';

  @override
  void onInit() {
    //states.refresh();
    //subject.refresh();
    super.onInit();
    getcomplainTypeeApi();
    patsubidController = TextEditingController();
    otherController = TextEditingController();
    complainController = TextEditingController();
    loginidController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    patsubidController.dispose();
    otherController.dispose();
    complainController.dispose();
    loginidController.dispose();
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

  void checkLabComplain() {
    if (complaintlabformkey.currentState!.validate()) {
      postComplainLabApi();
    }
    complaintlabformkey.currentState!.save();
  }
}
