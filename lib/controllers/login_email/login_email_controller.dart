import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
//import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class LoginpasswordController extends GetxController {
  final GlobalKey<FormState> loginpasswordformkey = GlobalKey<FormState>();
  var Id = '';

  void emailApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.LoginEmailApi(
      emailController.text,
      passwordController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(UserHomePage());
    }
  }

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
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

  void checkLoginpassword() {
    if (loginpasswordformkey.currentState!.validate()) {
      emailApi();
    }
    loginpasswordformkey.currentState!.save();
  }
}

//}
//     final isValid = loginpasswordformkey.currentState!.validate();
//
//     if (!isValid) {
//       emailApi();
//
//       return;
//     }
//     loginpasswordformkey.currentState!.save();
//     //Get.to(SignUpList());
//   }
// }
