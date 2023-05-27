import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class UpdateBankController extends GetxController {
  final GlobalKey<FormState> updatebankformkey = GlobalKey<FormState>();
  TextEditingController? accountnoController,
      ifscController,
      branchNameController,
      branchaddressController,
      holderNameController,
      mobileNumberController;
  TextEditingController? AccountNo, IFSCCode, BranchName;
  void chemistUpdateBankDetailApi() async {
    http.Response r = await ApiProvider.ChemistUpdateBankDetailApi(
        AccountNo?.text, IFSCCode?.text, BranchName?.text);
    if (r.statusCode == 200) {
      Get.to(ChemistHomePage());
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "failed",
          message: 'Update failed',
          icon: const Icon(Icons.refresh),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  var account = '';
  var ifsc = '';
  var branch = '';
  var branchaddress = '';
  var accountholdername = '';
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    //Login_Id = TextEditingController(text: '');
    AccountNo = TextEditingController(text: '');
    IFSCCode = TextEditingController(text: '');
    BranchName = TextEditingController(text: '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
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

  void checkUpdateBankDetail() {
    if (updatebankformkey.currentState!.validate()) {
      chemistUpdateBankDetailApi();
    }
    updatebankformkey.currentState!.save();
  }
}
