import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules_view/circular_loader/circular_loaders.dart';

class Change_password_Controller extends GetxController {
  final GlobalKey<FormState> changepasswordformkey = GlobalKey<FormState>();
  LoginpasswordController _loginpasswordControllerr6 = Get.find();

  //var Id = '';

  void changepasswordApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.ChangePasswordApi(
      idController.text,
      passwordController.text,
      newpasswordController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      Get.snackbar('Sucess', "${r.body}");

      // CallLoader.hideLoader();

      _loginpasswordControllerr6.onInit();
      CallLoader.loader();
      await Future.delayed(Duration(seconds: 2));
      CallLoader.hideLoader();
      await SharedPreferences.getInstance().then(
        (value) => Get.offAll(() => SignInScreen()),
      );

      //Get.back();
      //await Get.offAll(() => SignInScreen());

      /// we can navigate to user page.....................................
      // Get.to(SignInScreen());
    }
  }

  late TextEditingController idController;
  late TextEditingController passwordController;
  late TextEditingController newpasswordController;

  var id = '';
  var password = '';
  var newpassword = '';

  @override
  void onInit() {
    super.onInit();
    idController = TextEditingController();
    passwordController = TextEditingController();
    newpasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    idController.dispose();
    passwordController.dispose();
    newpasswordController.dispose();
  }

  String? validPassword(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 3) {
      return '              Password should have atleast 3 characters';
    }
    // if (!RegExp(r'[A-Z0-9a-z]*').hasMatch(value)) {
    //   return '              Enter a stronger password';
    // }
    //return null;
  }

  String? validNewPassword(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 3) {
      return '              Password should have atleast 3 characters';
    }
    // if (!RegExp(r'[A-Z0-9a-z]*').hasMatch(value)) {
    //   return '              Enter a stronger password';
    // }
    //return null;
  }

  // void checkChangePw() {
  //   final isValid = changepasswordformkey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   changepasswordformkey.currentState!.save();
  //   //Get.to(() => HomePage());
  // }
  void checkChangePw() {
    if (changepasswordformkey.currentState!.validate()) {
      changepasswordApi();
    }
    changepasswordformkey.currentState!.save();
  }
}
