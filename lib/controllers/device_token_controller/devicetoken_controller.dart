import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_upload_report_controller/nurse_upload_report_controller.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DevicetokenController extends GetxController {
  final GlobalKey<FormState> tokenfieldformkey = GlobalKey<FormState>();
  NurseUploadReportController _nursdeUploadReportController =
      Get.put(NurseUploadReportController());

  DriverProfileDetailController _driverprofile =
      Get.put(DriverProfileDetailController());

  // var Id = '';

  ///todo: this is user token.....28..august..2023...
  // Future<void> UsertokenApi() async {
  //   //CallLoader.loader();
  //   http.Response r = await ApiProvider.UserdevicetokenApi();
  //
  //   if (r.statusCode == 200) {
  //     var data = jsonDecode(r.body);
  //
  //     CallLoader.hideLoader();
  //     // _labListController.labListApi();
  //     // _labListController.update();
  //
  //     /// we can navigate to user page.....................................
  //     // Get.to(LabCatagaryDetails());
  //     ///Get.to(LabListPage());
  //   }
  // }

  ///todo: this is user token.....updsytde on 6 may 2024..

  Future<void> UsertokenApi() async {
    // CallLoader.loader();
    http.Response? r = await ApiProvider.UserdevicetokenApi();

    if (r != null && r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      // _labListController.labListApi();
      // _labListController.update();

      /// we can navigate to user page.....................................
      // Get.to(LabCatagaryDetails());
      /// Get.to(LabListPage());
    }
  }

  ///todo: this  driver is device token.....28..august..2023...
  void DrivertokenApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.DriverdevicetokenApi();

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      // _labListController.labListApi();
      // _labListController.update();

      /// we can navigate to user page.....................................
      // Get.to(LabCatagaryDetails());
      ///Get.to(LabListPage());
    }
  }

  ///todo: this is doctor device token.....28..august..2023...
  Future<void> DoctortokenApi() async {
    // CallLoader.loader();
    http.Response r = await ApiProvider.DoctordevicetokenApi();

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      // _labListController.labListApi();
      // _labListController.update();

      /// we can navigate to user page.....................................
      // Get.to(LabCatagaryDetails());
      ///Get.to(LabListPage());
    }
  }

  ///todo: this is nurse device token.....api....28----aug 2023
  void NursetokenApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.NursedevicetokenApi();

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      // _labListController.labListApi();
      // _labListController.update();

      /// we can navigate to user page.....................................
      // Get.to(LabCatagaryDetails());
      ///Get.to(LabListPage());
    }
  }

  // late TextEditingController emailController, passwordController;
  //
  // var email = '';
  // var password = '';

  @override
  void onInit() {
    super.onInit();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
  }

  @override
  void dispose() {
    Get.delete<DevicetokenController>();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //emailController.dispose();
    //passwordController.dispose();
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (!GetUtils.isEmail(value)) {
    //   return "              Email is not valid";
    // }
    return null;
  }

  String? validPassword(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 5) {
      return '              Password should have atleast 5 characters';
    }
    // if (!RegExp(r'[A-Z0-9a-z]*').hasMatch(value)) {
    //   return '              Enter a stronger password';
    // }
    //return null;
  }

  void checkuserToken() {
    if (tokenfieldformkey.currentState!.validate()) {
      UsertokenApi();
    }
    tokenfieldformkey.currentState!.save();
  }

  void checkdriverToken() {
    if (tokenfieldformkey.currentState!.validate()) {
      DrivertokenApi();
    }
    tokenfieldformkey.currentState!.save();
  }
}
