import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class forget_password_Controller extends GetxController {
  final GlobalKey<FormState> forgetpasswordformkey = GlobalKey<FormState>();

  late TextEditingController emailController;

  void forgotpasswordApi() async {
    //isLoading(true);
    //CallLoader.loader();
    http.Response r = await ApiProvider.ForgetPasswordApi(
      emailController.text,
    );

    if (r.statusCode == 200) {
      /// Get.to(SignInScreen());

      //CallLoader.loader();
      print("ACCOUNT ${r.body}");
    }
  }

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
    if (forgetpasswordformkey.currentState!.validate()) {
      forgotpasswordApi();
    }
    forgetpasswordformkey.currentState!.save();
  }
}
