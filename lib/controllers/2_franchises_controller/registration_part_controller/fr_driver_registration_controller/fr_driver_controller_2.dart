import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Fr_Driver_2_Controller extends GetxController {
  final GlobalKey<FormState> frdriver2formkey = GlobalKey<FormState>();

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

  late TextEditingController pinController, addressController;

  var pin = '';
  var address = '';

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

  void checkDriver2() {
    final isValid = frdriver2formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    frdriver2formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
