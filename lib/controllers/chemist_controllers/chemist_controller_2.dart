import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Chemist_2_Controller extends GetxController {
  final GlobalKey<FormState> chemist2formkey = GlobalKey<FormState>();

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
      addressController,
      franchiesController,
      gstController,
      licencenumberController,
      licencevalidityController;

  var pin = '';
  var address = '';
  var franchiesid = '';
  var gstno = '';
  var licenceno = '';
  var licencevalidity = '';

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
    franchiesController = TextEditingController();

    gstController = TextEditingController();
    licencenumberController = TextEditingController();
    licencevalidityController = TextEditingController();
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
    franchiesController.dispose();
    gstController.dispose();
    licencenumberController.dispose();
    licencevalidityController.dispose();
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

  String? validCertificate(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validFranchiesid(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validGstno(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validLicenceno(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validLicencevalidity(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  void checkchemist2() {
    final isValid = chemist2formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    chemist2formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
