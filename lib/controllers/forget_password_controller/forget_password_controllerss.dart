import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forget_password_Controller extends GetxController {
  final GlobalKey<FormState> forgetpasswordformkey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = '';

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (!value.contains('@')) {
      return "              A valid email should contain '@'";
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return "              Please enter a valid email";
    }
    return null;
  }

  void checkForget() {
    final isValid = forgetpasswordformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgetpasswordformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
