import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
class RWAUpdateBankDetailController extends GetxController {
  TextEditingController? Id,
      Login_Id,
      AccountNo,
      IFSCCode,
      BranchName,
      BranchAddress,
      HolderName,
      MobileNumber,
      isverified;
  void rwaUpdateBankDetailApi() async {
    http.Response r = await ApiProvider.RWAUpdateBankDetailApi(
        Id?.text,
        Login_Id?.text,
        AccountNo?.text,
        IFSCCode?.text,
        BranchName?.text,
        BranchAddress?.text,
        HolderName?.text,
        MobileNumber?.text,
        isverified?.text);
    if (r.statusCode == 200) {
    } else {}
  }

  @override
  void onInit() {
    Id = TextEditingController(text: '26');
    Login_Id = TextEditingController(text: '1024');
    AccountNo = TextEditingController(text: '1234567890');
    IFSCCode = TextEditingController(text: 'pjbO005654');
    BranchName = TextEditingController(text: 'HDFC');
    BranchAddress = TextEditingController(text: 'Noida');
    HolderName = TextEditingController(text: 'Vineet');
    MobileNumber = TextEditingController(text: '2222222222');
    isverified = TextEditingController(text: 'true');
    super.onInit();
  }
}
