import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_catagary2_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/vehicle_type3_model.dart';

import '../../servicess_api/api_services_all_api.dart';

class Driver_1_Controller extends GetxController {
  final GlobalKey<FormState> driver1formkey = GlobalKey<FormState>();

  ///ambulancde catagary Id...........

  Rx<Vehicle?> selectedambCatagary = (null as Vehicle?).obs;
  List<Vehicle> ambulancvecatagarys = <Vehicle>[].obs;

  ///vehicle by catagary Id...........
  ///
  Rx<VehicleDetaile?> selectedvhicleCatagary = (null as VehicleDetaile?).obs;
  RxList<VehicleDetaile> vhicletypes = <VehicleDetaile>[].obs;

  ///ambulancde catagary Id...........

  void ambulancecatagaryyApi() async {
    ambulancvecatagarys = (await ApiProvider.getambulancecatagaryApi())!;
    print('Prince ambulance catagary list');
    print(ambulancvecatagarys);
  }

  late TextEditingController nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController;

  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';

  @override
  void onInit() {
    super.onInit();
    ambulancecatagaryyApi();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    mobileController.dispose();
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
    } else if (value.length < 8) {
      return "              Password must be atleast 8 characters long";
    } else {
      return null;
    }
  }

  String? validConfirmPassword(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter New Password";
    } else if (value.length < 8) {
      return "              Password must be atleast 8 characters long";
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

  void checkDriver1() {
    final isValid = driver1formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    driver1formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
