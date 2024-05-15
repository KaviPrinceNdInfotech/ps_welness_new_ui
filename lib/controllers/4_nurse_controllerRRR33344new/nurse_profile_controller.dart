import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_profile_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class NurseProfileControllersdetail extends GetxController {
  RxBool isLoading = true.obs;
  NurseProfileModel? getNurseProfile;

  Future<void> nurseprofileApi() async {
    isLoading(true);
    getNurseProfile = await ApiProvider.NurseProfileApi();
    if (getNurseProfile != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    nurseprofileApi();
  }

  @override
  void dispose() {
    Get.delete<NurseProfileControllersdetail>();
    super.dispose();
  }
}
