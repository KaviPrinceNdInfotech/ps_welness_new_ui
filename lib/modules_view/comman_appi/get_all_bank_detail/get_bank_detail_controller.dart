import 'package:get/get.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

import '../comman_bank_update/all_get_bank_model.dart';

//import 'package:ps_welness_new_ui/model/RWA/rwa_profile_detail_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class BankDetailController extends GetxController {
  RxBool isLoading = false.obs;
  BankAllDetailModel? getbank;

  Future<void> BankDetailCommonApi() async {
    getbank = await ApiProvider.GetbankDetailAllApi();
    if (getbank?.mobileNumber != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    BankDetailController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
