import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Franchies_2_Controller extends GetxController {
  final GlobalKey<FormState> franchies2formkey = GlobalKey<FormState>();

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

  late TextEditingController addressController,
      pinController,
      gstController,
      panController,
      aadhaarController;

  var address = '';
  var pin = '';
  var gst = '';
  var pan = '';
  var aadhaar = '';

  //get stateCitymap => null;

  @override
  void onInit() {
    // stateCitymap((key, value) {
    //   states.add(key);
    // }
    //);
    states.refresh();

    addressController = TextEditingController();
    pinController = TextEditingController();
    gstController = TextEditingController();
    panController = TextEditingController();
    aadhaarController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    addressController.dispose();
    pinController.dispose();
    gstController.dispose();
    panController.dispose();
    aadhaarController.dispose();
  }

  String? validAddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }

    return null;
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin code should be of 6 digits';
    }
    return null;
  }

  String? validAadhar(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 12) {
      return '              A valid Aadhaar number should be of 10 digits';
    }
    return null;
  }

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid Pan number should be of 10 digits';
    }
    return null;
  }

  String? validGst(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 15) {
      return '              A valid Gst number should be of 15 digits';
    }
    return null;
  }

  void checkFranchies2() {
    final isValid = franchies2formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    franchies2formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
