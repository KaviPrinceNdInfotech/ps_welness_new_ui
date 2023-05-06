import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Doctor_2_Controller extends GetxController {
  final GlobalKey<FormState> doctor2formkey = GlobalKey<FormState>();

  ///TODO: image picker.................
  ///
  var selectedImagepath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  late TextEditingController pinController,
      clinicnameController,
      passwordController,
      confirmpasswordController,
      mobileController;

  var clinic_name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';

  //get stateCitymap => null;

  @override
  void onInit() {
    // stateCitymap((key, value) {
    //   states.add(key);
    // }
    //);
    states.refresh();

    clinicnameController = TextEditingController();
    mobileController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    clinicnameController.dispose();
    mobileController.dispose();
  }

  String? validClinicname(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }

    return null;
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

  void checkDoctor2() {
    final isValid = doctor2formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    doctor2formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
