import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FrRwa_2_Controller extends GetxController {
  final GlobalKey<FormState> frrwa2formkey = GlobalKey<FormState>();

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
      landlineController,
      addressController;

  var pin = '';
  var address = '';
  var landlineno = '';

  //get stateCitymap => null;

  @override
  void onInit() {
    // stateCitymap((key, value) {
    //   states.add(key);
    // }
    //);
    states.refresh();

    pinController = TextEditingController();
    addressController = TextEditingController();
    landlineController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pinController.dispose();
    addressController.dispose();
    landlineController.dispose();
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

  void checkrwa2() {
    final isValid = frrwa2formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    frrwa2formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
