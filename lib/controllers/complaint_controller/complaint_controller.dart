import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
import '../../model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';
import '../../modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import '../../modules_view/circular_loader/circular_loaders.dart';
import '../../servicess_api/api_services_all_api.dart';

class ComplaintController extends GetxController {
  final GlobalKey<FormState> complaintformkey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

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

  void postComplainApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.UserComplainnewApi(
      selectedSubject.value?.subid.toString(),
      otherController.text,
      complainController.text,
      loginidController.text,

    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(UserHomePage());
    }
  }

  late TextEditingController
      patsubidController,
      otherController,
      complainController,
      loginidController;


  var postsubid = '';
  var Others = '';
  var Complaints = '';
  var Login_Id = '';


  ///todo:user complain...........

  // void usercomplaintApi() async {
  //   CallLoader.loader();
  //   http.Response r = await ApiProvider.UserComplainApi(
  //     loginidController.text,
  //     subjectController.text,
  //     complaintController.text,
  //     isdeletedController.text,
  //     isresolveController.text,
  //     otherController.text,
  //     doctorController.text,
  //   );
  //
  //   if (r.statusCode == 200) {
  //     var data = jsonDecode(r.body);
  //
  //     CallLoader.hideLoader();
  //
  //     /// we can navigate to user page.....................................
  //     Get.to(UserHomePage());
  //   }
  // }
  //
  // late TextEditingController loginidController,
  //     subjectController,
  //     complaintController,
  //     isdeletedController,
  //     isresolveController,
  //     otherController,
  //     doctorController;
  //
  // var Login_Id = '';
  // var Subjects = '';
  // var complaint = '';
  // var IsDeleted = '';
  // var IsResolved = '';
  // var Others = '';
  // var Doctor = '';

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

  void checkUser3() {
    if (complaintformkey.currentState!.validate()) {
      postComplainApi();
    }
    complaintformkey.currentState!.save();
    // final isValid = complaintformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    //complaintformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
