import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';

import '../../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class AdddriverBankController extends GetxController {
  final GlobalKey<FormState> addbankdriverrformkey = GlobalKey<FormState>();
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

  void addddriverBankDetailApi() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AddBankDetailApi(
      AccountNo?.text,
      IFSCCode?.text,
      BranchName?.text,
      BranchAddress?.text,
      HolderName?.text,
      MobileNumber?.text,
    );
    print('chemist');
    print(AccountNo);
    print(IFSCCode);
    print(BranchName);
    print(BranchAddress);
    print(HolderName);
    print(MobileNumber);
    if (r.statusCode == 200) {
      /// CallLoader.hideLoader();
      ///CallLoader.hideLoader();
      await Future.delayed(Duration(milliseconds: 900));
      // await SharedPreferences.getInstance()
      //     .then((value) => Get.offAll(() => DriverHomePage()));
      //Get.snackbar("Success", "${r.body}");
      //Get.back();
      /// we can navigate to user page.....................................
      Get.to(DriverHomePage());
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
    AccountNo = TextEditingController();
    IFSCCode = TextEditingController();
    BranchName = TextEditingController();
    BranchAddress = TextEditingController();
    HolderName = TextEditingController();
    MobileNumber = TextEditingController();
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
    if (value.length < 2) {
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
      return '              Provide valid Bank name.';
    }
    return null;
  }

  String? validbranchaddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch address.';
    }
    return null;
  }

  String? validname(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid  name.';
    }
    return null;
  }

  String? validmobile(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              Provide valid 10 digit number.';
    }
    return null;
  }

  void checkAddddBankDetail() {
    if (addbankdriverrformkey.currentState!.validate()) {
      addddriverBankDetailApi();
    }
    addbankdriverrformkey.currentState!.save();
  }
}