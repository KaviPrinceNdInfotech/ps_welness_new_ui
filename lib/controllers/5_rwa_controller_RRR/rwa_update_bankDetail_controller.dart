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

  void rwaUpdateBankDetailApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.RWAUpdateBankDetailApi(
      AccountNo?.text,
      IFSCCode?.text,
      BranchName?.text,
      BranchAddress?.text,
      HolderName?.text,
      MobileNumber?.text,
    );
    if (r.statusCode == 200) {
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(RwaHomePage());
    } else {}
  }

  @override
  void onInit() {
    //Id = TextEditingController(text: '');
    //Login_Id = TextEditingController(text: '');
    AccountNo = TextEditingController(text: '');
    IFSCCode = TextEditingController(text: '');
    BranchName = TextEditingController(text: '');
    BranchAddress = TextEditingController(text: '');
    HolderName = TextEditingController(text: '');
    MobileNumber = TextEditingController(text: '');
    //isverified = TextEditingController(text: '');
    super.onInit();
  }

  String? validbankaccount(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  String? validifsc(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  String? validbranch(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  String? validbranchaddress(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  String? validname(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  String? validmobile(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  void checkrwabank3() {
    if (rwabankformkey.currentState!.validate()) {
      rwaUpdateBankDetailApi();
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
