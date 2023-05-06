import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class UpdateBankController extends GetxController {
  final GlobalKey<FormState> updatebankformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  late TextEditingController idController,
      LoginIdController,
      accountnoController,
      ifscController,
      branchNameController,
      branchaddressController,
      holderNameController,
      mobileNumberController;

  var account = '';
  var ifsc = '';
  var branch = '';
  var branchaddress = '';
  var accountholdername = '';
  RxBool isLoading = true.obs;
  void driverUpdateBankDetailApi() async {
    isLoading(true);
    // CallLoader.loader();
    http.Response r = await ApiProvider.DriverUpdateBankDetail(
        idController.text,
        LoginIdController.text,
        accountnoController.text,
        ifscController.text,
        branchNameController.text,
        branchaddressController.text,
        holderNameController.text,
        mobileNumberController.text);
    if (r.statusCode == 200) {
      isLoading(false);
      // CallLoader.hideLoader();
    } else {
      isLoading(false);
      // CallLoader.hideLoader();
    }
  }

  @override
  void onInit() {
    super.onInit();
    idController = TextEditingController(text: '1');
    LoginIdController = TextEditingController(text: '1024');
    accountnoController = TextEditingController(text: '9898666666');
    ifscController = TextEditingController(text: '999ONSBI');
    branchNameController = TextEditingController(text: 'SBI');
    branchaddressController = TextEditingController(text: 'Noida sector 15');
    holderNameController = TextEditingController(text: 'Kumar Prince');
    mobileNumberController = TextEditingController(text: '6398028236');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    idController.dispose();
    LoginIdController.dispose();
    accountnoController.dispose();
    ifscController.dispose();
    branchNameController.dispose();
    branchaddressController.dispose();
    holderNameController.dispose();
    mobileNumberController.dispose();
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

  void checkDriverUpdateBankDetail() {
    final isValid = updatebankformkey.currentState!.validate();
    driverUpdateBankDetailApi();
    if (!isValid) {
      return;
    }
    updatebankformkey.currentState!.save();
  }
}
