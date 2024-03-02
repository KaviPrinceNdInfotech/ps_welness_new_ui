import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesProfileDetail_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesProfileDetailController extends GetxController {
  RxBool isLoading = false.obs;
  FrenchiesProfileDetailModel? getfrenchiesProfileDetailModel;
  Future<void> frenchiesProfileDetailApi() async {
    isLoading(true);
    getfrenchiesProfileDetailModel =
        await ApiProvider.FrenchiesProfileDetailApi();
    if (getfrenchiesProfileDetailModel != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    frenchiesProfileDetailApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
