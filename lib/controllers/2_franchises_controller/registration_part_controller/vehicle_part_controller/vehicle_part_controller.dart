import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Franchies_vehicle_Controller extends GetxController {
  final GlobalKey<FormState> frvehicleformkey = GlobalKey<FormState>();

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

  late TextEditingController nameController,
      vehiclenumberController,
      accountController,
      confirmaccountController,
      driverchaergeController,
      accountholderController,
      IfscController;

  var name = '';
  var vehiclenumber = '';
  var account = '';
  var confirmaccount = '';
  var drivercharge = '';
  var acholdername = '';
  var ifsccode = '';

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    nameController = TextEditingController();
    vehiclenumberController = TextEditingController();
    accountController = TextEditingController();
    confirmaccountController = TextEditingController();
    driverchaergeController = TextEditingController();
    accountholderController = TextEditingController();
    IfscController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    vehiclenumberController.dispose();
    accountController.dispose();
    confirmaccountController.dispose();
    driverchaergeController.dispose();
    accountholderController.dispose();
    IfscController.dispose();
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  String? validnumber(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }

    return null;
  }

  String? validAcno(String value) {
    account = value;

    if (value.isEmpty) {
      return "              Please Enter account no";
    } else if (value.length < 8) {
      return "              Password must be atleast 8 characters long";
    } else {
      return null;
    }
  }

  String? validConfirmAcno(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter account no";
    } else if (value.length < 8) {
      return "              ac no must be atleast 8 characters long";
    } else if (value != confirmaccount) {
      return "              ac no must be same as above";
    } else {
      return null;
    }
  }

  String? validcharge(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? validaccholder(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validIfsc(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (value.length != 6) {
    //   return '              A valid ifsc should be of 6 digits';
    // }
    return null;
  }

  void checkFrvehicle() {
    final isValid = frvehicleformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    frvehicleformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
