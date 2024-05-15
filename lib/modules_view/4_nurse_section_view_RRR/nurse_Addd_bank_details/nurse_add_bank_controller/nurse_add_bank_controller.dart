import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';

import '../../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class AddNurtseBankController extends GetxController {
  final GlobalKey<FormState> updatenurseformkey = GlobalKey<FormState>();
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

  void addnurseBankDetailApi() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AddBankDetailApi(
      AccountNo?.text,
      IFSCCode?.text,
      BranchName?.text,
      BranchAddress?.text,
      HolderName?.text,
      MobileNumber?.text,
    );
    print('dr');
    print(AccountNo);
    print(IFSCCode);
    print(BranchName);
    print(BranchAddress);
    print(HolderName);
    print(MobileNumber);
    if (r.statusCode == 200) {
      /// CallLoader.hideLoader();
      ///CallLoader.hideLoader();
      await Future.delayed(Duration(milliseconds: 100));
      // await SharedPreferences.getInstance()
      //     .then((value) => Get.offAll(() => DriverHomePage()));
      //Get.snackbar("Success", "${r.body}");
      //Get.back();
      /// we can navigate to user page.....................................
      Get.to(NurseHomePage());
    } else {
      Get.snackbar(
        'Fail',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
      print('chemist');
      print(AccountNo);
      print(IFSCCode);
      print(BranchName);
      print(BranchAddress);
      print(HolderName);
      print(MobileNumber);
    }
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
    if (value.length < 4) {
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
    if (value.length != 10) {
      return '              Provide valid mobile number';
    }
    return null;
  }

  void checkAddddBankDetail() {
    if (updatenurseformkey.currentState!.validate()) {
      addnurseBankDetailApi();
    }
    updatenurseformkey.currentState!.save();
  }
}
