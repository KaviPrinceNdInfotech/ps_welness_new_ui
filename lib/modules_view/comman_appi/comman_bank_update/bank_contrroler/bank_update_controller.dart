import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/get_all_bank_detail/get_bank_detail_controller.dart';

import '../../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
class UpdateBankRwaDetailController extends GetxController {
  final GlobalKey<FormState> rwabankupdateformkey = GlobalKey<FormState>();

  BankDetailController _getbank = Get.put(BankDetailController());

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

  void UpdateBankDetailsRwaApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.UpdateBankDetailApi(
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
        r.body,
        duration: Duration(seconds: 2),
      );
      CallLoader.hideLoader();

      //CallLoader.loader();
      //  await Future.delayed(Duration(milliseconds: 2000));
      // CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(RwaHomePage());
    } else {
      Get.snackbar(
        'Message',
        "${r.body}",
        duration: const Duration(seconds: 2),
      );
      Get.to(RwaHomePage());
    }
  }

  @override
  void onInit() {
    //_getbank
    //Id = TextEditingController(text: '');
    //Login_Id = TextEditingController(text: '');
    AccountNo = TextEditingController(
        text: "${_getbank.getbank?.accountNo.toString() ?? 0}");
    IFSCCode = TextEditingController(
        text: "${_getbank.getbank?.ifscCode.toString() ?? 0}");
    BranchName = TextEditingController(
        text: "${_getbank.getbank?.branchName.toString() ?? 0}");
    BranchAddress = TextEditingController(
        text: "${_getbank.getbank?.branchAddress.toString() ?? 0}");
    HolderName = TextEditingController(
        text: "${_getbank.getbank?.holderName.toString() ?? 0}");
    MobileNumber = TextEditingController(
        text: "${_getbank.getbank?.mobileNumber.toString() ?? 0}");
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
      return '              Provide valid bank name.';
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
      return '              Provide valid holder name.';
    }
    return null;
  }

  String? validmobile(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return "                Please enter 10 digit mobile";
    }
    return null;
  }

  // String? validbankaccount(String value) {
  //   if (value.length < 2) {
  //     return "                This is required field.";
  //   }
  //   return null;
  // }
  //
  // String? validifsc(String value) {
  //   if (value.length < 2) {
  //     return "                This is required field.";
  //   }
  //   return null;
  // }
  //
  // String? validbranch(String value) {
  //   if (value.length < 2) {
  //     return "                This is required field.";
  //   }
  //   return null;
  // }
  //
  // String? validbranchaddress(String value) {
  //   if (value.length < 2) {
  //     return "                This is required field.";
  //   }
  //   return null;
  // }
  //
  // String? validname(String value) {
  //   if (value.length < 2) {
  //     return "                This is required field.";
  //   }
  //   return null;
  // }
  //
  // String? validmobile(String value) {
  //   if (value.length != 10) {
  //     return "                Please enter 10 digit mobile";
  //   }
  //   return null;
  // }

  void checkrwabankupdateapi() {
    if (rwabankupdateformkey.currentState!.validate()) {
      UpdateBankDetailsRwaApi();
    }
    rwabankupdateformkey.currentState!.save();
  }
}
