import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';

import '../../modules_view/circular_loader/circular_loaders.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
class RWAUpdateBankDetailController extends GetxController {
  final GlobalKey<FormState> rwabankformkey = GlobalKey<FormState>();

  TextEditingController? AccountNo,
      IFSCCode,
      BranchName,
      BranchAddress,
      HolderName,
      MobileNumber;

  var accountNo = '';
  var iFSCCode = '';
  var branchName = '';
  var branchAddress = '';
  var holderName = '';
  var mobileNumber = '';

  void rwaAddBankDetailApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.AddBankDetailApi(
      AccountNo?.text,
      IFSCCode?.text,
      BranchName?.text,
      BranchAddress?.text,
      HolderName?.text,
      MobileNumber?.text,
    );
    if (r.statusCode == 200) {
      Get.snackbar(
        'Message',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(RwaHomePage());
    } else {
      Get.snackbar(
        'Error',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
      Get.to(RwaHomePage());
    }
  }

  @override
  void onInit() {
    //Id = TextEditingController(text: '');
    //Login_Id = TextEditingController(text: '');
    AccountNo = TextEditingController();
    IFSCCode = TextEditingController();
    BranchName = TextEditingController();
    BranchAddress = TextEditingController();
    HolderName = TextEditingController();
    MobileNumber = TextEditingController();
    //isverified = TextEditingController(text: '');
    super.onInit();
  }

  String? validbankaccount(String value) {
    if (value.length < 2) {
      return "                This is required field.";
    }
    return null;
  }

  String? validifsc(String value) {
    if (value.length < 2) {
      return "                This is required field.";
    }
    return null;
  }

  String? validbranch(String value) {
    if (value.length < 2) {
      return "                This is required field.";
    }
    return null;
  }

  String? validbranchaddress(String value) {
    if (value.length < 2) {
      return "                This is required field.";
    }
    return null;
  }

  String? validname(String value) {
    if (value.length < 2) {
      return "                This is required field.";
    }
    return null;
  }

  String? validmobile(String value) {
    if (value.length != 10) {
      return "                Please enter 10 digit mobile";
    }
    return null;
  }

  void checkrwabank3() {
    if (rwabankformkey.currentState!.validate()) {
      rwaAddBankDetailApi();
    }
    rwabankformkey.currentState!.save();
    // final isValid = complaintformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    //complaintformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
