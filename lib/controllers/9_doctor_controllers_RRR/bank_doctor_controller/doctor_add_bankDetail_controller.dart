import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
class DoctorAddBankDetailController extends GetxController {
  final GlobalKey<FormState> drbankformkey = GlobalKey<FormState>();

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

  void doctorAddBankDetailApi() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AddBankDetailApi(
      AccountNo?.text,
      IFSCCode?.text,
      BranchName?.text,
      BranchAddress?.text,
      HolderName?.text,
      MobileNumber?.text,
      // "AccountNo": AccountNo,
      //       "IFSCCode": IFSCCode,
      //       "BranchName": BranchName,
      //       "BranchAddress": BranchAddress,
      //       "HolderName": HolderName,
      //       "MobileNumber": MobileNumber,
    );

    if (r.statusCode == 200) {
      print('chemist');
      print(AccountNo);
      print(IFSCCode);
      print(BranchName);
      print(BranchAddress);
      print(HolderName);
      print(MobileNumber);

      ///CallLoader.hideLoader();
      await Future.delayed(Duration(milliseconds: 100));
      await SharedPreferences.getInstance()
          .then((value) => Get.offAll(() => DoctorHomePage()));

      /// we can navigate to user page.....................................
      ///Get.to(DoctorHomePage());
    } else {
      Get.snackbar(
        'Fail',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
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
      return "               This is required field.";
    }
    return null;
  }

  String? validifsc(String value) {
    if (value.length < 2) {
      return "               This is required field.";
    }
    return null;
  }

  String? validbranch(String value) {
    if (value.length < 2) {
      return "               This is required field.";
    }
    return null;
  }

  String? validbranchaddress(String value) {
    if (value.length < 2) {
      return "               This is required field.";
    }
    return null;
  }

  String? validname(String value) {
    if (value.length < 2) {
      return "               This is required field.";
    }
    return null;
  }

  String? validmobile(String value) {
    if (value.length != 10) {
      return "               Provide 10 digit mobile.";
    }
    return null;
  }

  void checkrwabank3() {
    if (drbankformkey.currentState!.validate()) {
      doctorAddBankDetailApi();
    }
    drbankformkey.currentState!.save();
    // final isValid = complaintformkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    //complaintformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
