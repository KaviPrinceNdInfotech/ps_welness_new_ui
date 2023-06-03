import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';

import '../../modules_view/circular_loader/circular_loaders.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
import '../../utils/services/account_service.dart';

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
class RWAAddPatientController extends GetxController {
  final GlobalKey<FormState> rwaaddformkey = GlobalKey<FormState>();

  late TextEditingController PatientNameController,
      EmailIdController,
      MobileNumberController,
      PasswordController,
      ConfirmPasswordController,
      LocationController,
      PinCodeController;

  var name = '';
  var phone = '';
  var location = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var pin = '';
  var address = '';

  void rwaAddPatientApi() async {
    CallLoader.loader();

    http.Response r = await ApiProvider.RWAAddPatientApi(
      PatientNameController?.text,
      EmailIdController?.text,
      MobileNumberController?.text,
      PasswordController?.text,
      ConfirmPasswordController?.text,
      LocationController?.text,
      PinCodeController?.text,
    );
    if (r.statusCode == 200) {
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 200),
          () {
            Get.snackbar('Patient ', "Add Successfully Thank-you."
                // "${r.body}"
                );
            Get.to(() => RwaHomePage());
          },
        );
      });
      CallLoader.hideLoader();
    } else {}
  }

  @override
  void onInit() {
    //AdminLogin_Id = TextEditingController(text: '1');
    PatientNameController = TextEditingController(text: '');
    EmailIdController = TextEditingController(text: '');
    MobileNumberController = TextEditingController(text: '');
    PasswordController = TextEditingController(text: '123456');
    ConfirmPasswordController = TextEditingController(text: '123456');
    LocationController = TextEditingController(text: '');
    PinCodeController = TextEditingController(text: '');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    PatientNameController.dispose();
    EmailIdController.dispose();
    PasswordController.dispose();
    ConfirmPasswordController.dispose();
    MobileNumberController.dispose();
    LocationController.dispose();
    PinCodeController.dispose();
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
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

  String? validPassword(String value) {
    confirmpassword = value;

    if (value.isEmpty) {
      return "              Please Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else {
      return null;
    }
  }

  String? validConfirmPassword(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else if (value != confirmpassword) {
      return "              Password must be same as above";
    } else {
      return null;
    }
  }

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
    }
    return null;
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin should be of 6 digits';
    }
    return null;
  }

  String? validAddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validlandline(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validcertificate(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  void checkadd11() {
    if (rwaaddformkey.currentState!.validate()) {
      rwaAddPatientApi();
    }
    rwaaddformkey.currentState!.save();
  }
}
