import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class UpdateBankSeperatefranchiseController extends GetxController {
  final GlobalKey<FormState> updateseperatebankformkeyfranchise =
      GlobalKey<FormState>();
  TextEditingController? AccountNo, IFSCCode, BranchName;

  var accountNo = '';
  var iFSCCode = '';
  var branchName = '';

  void franchiseUpdateBankDetailApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.FranchiseBankSeperateDetailApi(
      AccountNo?.text,
      IFSCCode?.text,
      BranchName?.text,
    );
    if (r.statusCode == 200) {
      ///Get.back();
      CallLoader.hideLoader();
      //Get.back();

      /// we can navigate to user page.....................................
      //Get.to(ChemistHomePage());
    } else {}
  }

  @override
  void onInit() {
    //Id = TextEditingController(text: '');
    //Login_Id = TextEditingController(text: '');
    AccountNo = TextEditingController(text: '');
    IFSCCode = TextEditingController(text: '');
    BranchName = TextEditingController(text: '');

    //isverified = TextEditingController(text: '');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  String? validbankaccount(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 9) {
      return '              Provide valid account no.';
    }
    return null;
  }

  String? validifsc(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 4) {
      return '              Provide valid IFSC code.';
    }
    return null;
  }

  String? validbranch(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  String? validbranchaddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  String? validname(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  String? validmobile(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  void checkUpdateBankSeperateDetail() {
    if (updateseperatebankformkeyfranchise.currentState!.validate()) {
      franchiseUpdateBankDetailApi();
    }
    updateseperatebankformkeyfranchise.currentState!.save();
  }
}
