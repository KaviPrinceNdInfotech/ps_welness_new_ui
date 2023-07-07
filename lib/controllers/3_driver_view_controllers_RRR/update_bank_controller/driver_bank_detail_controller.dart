import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverBankController extends GetxController {
  final GlobalKey<FormState> driverbankformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  late TextEditingController accountnoController,
      ifscController,
      branchController,
      branchaddressController,
      accountholderController;

  var account = '';
  var ifsc = '';
  var branch = '';
  var branchaddress = '';
  var accountholdername = '';

  @override
  void onInit() {
    states.refresh();
    super.onInit();

    accountnoController = TextEditingController(text: '9898666666');
    ifscController = TextEditingController(text: '999ONSBI');
    branchController = TextEditingController(text: 'SBI');
    branchaddressController = TextEditingController(text: 'Noida sector 15');
    accountholderController = TextEditingController(text: 'Kumar Prince');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    accountnoController.dispose();
    ifscController.dispose();
    branchController.dispose();
    branchaddressController.dispose();
    accountholderController.dispose();
  }

  String? validAccount(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 9) {
      return '              Provide valid account no.';
    }
    return null;
  }

  String? validIfsc(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 4) {
      return '              Provide valid IFSC code.';
    }
    return null;
  }

  String? validBranch(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  String? validBranchaddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  String? validaccountholder(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  void checkBankDetail() {
    final isValid = driverbankformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    driverbankformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
